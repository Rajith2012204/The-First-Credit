// #############################
// VARIABLES
// #############################
var saveUrl = "create-group/save";
var readUrl = "country/find";
var updateUrl = "country/update";

var token = $("#txtSecurityToken").val();
var username = $("#txtUserName").val();
var table;
var clearBtn = $("#clear");
var addBtn = $("#add");

//#############################
//INITIALIZATION
//#############################

//document.title = "MISY Myanmar International School - Country Form";

function initTable() {
    table = $('#member-table').bootstrapTable({
        method: 'get',
        url: '',
        cache: false,
        height: 350,
        striped: true,
        pagination: true,
        search: true,
        showColumns: true,
        pageSize: 50,
        pageList: [10, 25, 50, 100, 200],
        minimumCountColumns: 2,
        clickToSelect: true,
        columns: [{
                field: 'memberName',
                title: 'Member Name',
                align: 'left',
                valign: 'bottom',
                sortable: true
            }, {
                field: 'status',
                title: 'Status',
                align: 'left',
                valign: 'bottom',
                sortable: true
            }, {
                field: 'action',
                title: 'Edit',
                align: 'left',
                valign: 'bottom',
                sortable: true,
                formatter: operateFormatter,
                events: operateEvents
            }]
    });
}

function initReference() {

    document.getElementById("create-country").setAttribute("href", "create-country");
    document.getElementById("create-state").setAttribute("href", "create-state");
    document.getElementById("create-city").setAttribute("href", "create-city");
}

//#############################
//LOADINGS
//#############################
$(document).ready(function () {
    $('.active').removeClass('active');
    $("#common-menu").addClass("active");
    //initReference();
    //intilizing table
    initTable();
    //common-dropdown functions
    //loadData();
});

function loadData() {

    //Loads from database
    data = ajaxData(readUrl, "GET");
    console.log(data);
    //Loading database data to bootstrap table
    table.bootstrapTable('load', data);

}

//#############################
//GETTER & SETTER
//#############################
function getData() {
    allData = [{
            title: "Group Name",
            colomn: "groupName",
            value: $("#group-name").val()
        }, {
            title: "Date of Establishment",
            colomn: "establishment",
            value: $("#establishment").val()
        }, {
            title: "Group Officer",
            colomn: "groupOfficer",
            value: $("#group-officer").val()
        },{
            title: "Meeting Day",
            colomn: "meetingDay",
            value: $("#meeting-day").val()
        },{
            title: "Group Branch",
            colomn: "groupBranch",
            value: $("#group-Branch").val()
        },{
            title: "Group Address",
            colomn: "groupAddress",
            value: $("#meeting-day").val()
        },{
            title: "Contact Number",
            colomn: "contactNumber",
            value: $("#group-contact-number").val()
        },{
            title: "",
            colomn: "details",
            value: $("#details").val()
        },{
            title: "Status",
            colomn: "status",
            value: $("#status").val()
        }, {
            title: "",
            colomn: "username",
            value: username
        }];
    return allData;

}

//#############################
//EVENTS
//#############################


addBtn.click(function () {
    //show confirmation message to save
    buttonstatus = $(this).html();
    if (buttonstatus == "Add") {
        validateForm("Add");
    }
    else if (buttonstatus == "Update") {

        validateForm("Update");
    }
});


function validateForm(msg) {

  //  if (isValidCountry()) {
        showSaveconfirmation(msg);
   // } else {
      //  focusInvalid();
    //}
}


clearBtn.click(function () {
    //validator.resetForm();  
});

//#############################
//POP UPS
//#############################
function generateViewData(data) {
    var content = "<table class='table table-bordered table-striped'>";
    content += "<tbody>";

    for (var i in data) {
        if (data[i].title != "") {
            content += "<tr>";
            content += "<td>" + data[i].title + "</td>";
            content += "<td class='wordbreak'>" + data[i].value + "</td>";
            content += "</tr>";
        }
    }

    content += "</tbody>";
    content += "</table>";
    return content;
}

function showSaveconfirmation(msg) {
    //get current data to save
    var gatheredData = getData();

    BootstrapDialog.show({
        title: 'Save Confirmation',
        //automatically generating view data
        message: generateViewData(gatheredData),
        buttons: [{
                label: msg,
                cssClass: 'btn-success',
                autospin: true,
                action: function (dialog) {
                    dialog.enableButtons(false);
                    dialog.setClosable(false);
                    //Serialize Data
                    serializedData = manualSerialize(gatheredData);
                    //save country data
                    if (msg == "Add") {
                        //saves new 
                        saveData(saveUrl, "POST", serializedData);
                    }
                    else {
                        //updates exist 
                        saveData(updateUrl, "POST", serializedData);
                    }

                    dialog.close();
                }
            }, {
                label: 'Cancel',
                action: function (dialog) {
                    dialog.close();
                }
            }]
    });
}

function showSaveMsg(Id) {
    dialogInstance = new BootstrapDialog();
    dialogInstance.setTitle('Save Message');
    dialogInstance.setMessage("Entry saved!, Group Id is " + Id);
    dialogInstance.setType(BootstrapDialog.TYPE_SUCCESS);
    dialogInstance.open();

    setTimeout(function () {
        clearBtn.click();
        dialogInstance.close();
    }, 3000);
}


//#############################
//AJAX
//#############################
function saveData(url, type, data) {
    $.ajax({
        type: type,
        url: url,
        async: false,
        headers: {
            'X-CSRF-TOKEN': token
        },
        data: data,
        success: function (data) {
            if (data.success === "true") {
                showSaveMsg(data.result);
            } else {
                showErrorMsg("Error", data.errorMessage);
            }

        },
        error: function () {
            alert("Failed to load ");
        }
    });
}

function ajaxData(url, type, data) {
    var returnData = null;
    $.ajax({
        type: type,
        url: url,
        async: false,
        headers: {
            'X-CSRF-TOKEN': token
        },
        data: data,
        success: function (data) {
            returnData = data;
        },
        error: function () {
            alert("Failed to load ");
        }
    });
    return	returnData;
}

//#############################
//Other Events
//#############################
function operateFormatter(value, row, index) {
    return [
        '<a class="edit ml10" href="javascript:void(0)" title="Edit">',
        '<i class="glyphicon glyphicon-pencil"></i>',
        '</a>'
    ].join('');
}

window.operateEvents = {
    'click .edit': function (e, value, row, index) {
        clearBtn.click();
        $("#province").val(row.provinceId);
        $("#country").val(row.countryId);
        $("#details").val(row.description);
        $("#status").val(row.status);
        $('#country').attr('disabled', 'true');
        $('#province').attr('disabled', 'true');
        $('#add').html('Update');
    }
};

