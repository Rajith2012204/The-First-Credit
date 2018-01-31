//################### Global Variable ###############################################
var customerSaveUrl = "create-customer/save";
var customerUpdateUrl = "create-customer/update";
var getUsers = "create-customer/find/groupId";

var title;
var status;
var firstName;
var middleName;
var lastName;
var dob;
var chkStatus;
var gender;
var nationalID;
var universityNo;
var identityType;
var age;
var occupation;
var noFamily;
var noDependents;
var issuedCountry;
var dialogInstance;
var personalAddressOne;
var personalAddressTwo;
var personalAddressCountry;
var personalAddressProvince;
var personalAddressCity;
var username;
var fileUpload;
var mobileNoOne;
var mobileNoTwo;
var landLineNo;
var personalEmail;
var email;
var fax;

var imageLoaded = false;
var token = $("#txtSecurityToken").val();
//#############################
//INITIALIZATION
//#############################
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
            },{
                field: 'status',
                title: 'Status',
                align: 'left',
                valign: 'bottom',
                sortable: true
            },{
                field: 'action',
                title: 'Edit',
                align: 'left',
                valign: 'bottom',
                sortable: true,
                formatter: operateFormatter,
                events: operateEvents
            },{
                field: 'memberDetail',
                title: 'Add Details',
                align: 'left',
                valign: 'bottom',
                sortable: false,
                formatter: operateFormatterMember,
                events: operateEventsAddMemberDetail
            }]
    });
}



//############################# LOADINGS #############################
$(document).ready(function () {   
    initTable();
    loadData();
});

// ################### Data ###############################################
function getData() {

    identityType = $("#id-type").val();
    title = $("#title").val();
    chkStatus = $("#is-active").is(':checked'); // true
    firstName = $("#first-name").val();
    middleName = $("#middle-name").val();
    lastName = $("#last-name").val();
    nationalID = $("#idenfition-no").val();
    if (document.getElementById('male').checked) {
        gender = "male";
    } else if (document.getElementById('female').checked) {
        gender = "female";
    }
    dob = $("#dob").val();


    personalAddressOne = $("#personal-add1").val();
    personalAddressTwo = $("#personal-add2").val();
    personalAddressCity = $("#personal-city").val();
    personalAddressProvince = $("#personal-province").val();

    occupation = $("#occupation").val();
    noFamily = $("#no-family").val();
    noDependents = $("#no-dependents").val();
    issuedCountry = $("#issued-country").val();

    mobileNoOne = $("#contact-1").val();
    mobileNoTwo = $("#contact-2").val();
    landLineNo = $("#landline").val();
    personalEmail = $("#email-personal").val();
    email = $("#email").val();
    fax = $("#fax").val();

    username = $("#txtUserName").val();

    if (chkStatus) {
        status = "Active";
    } else {
        status = "Deactive";
    }
}

function saveEvent() {
    if (imageLoaded) {
        $('#input-id').fileinput('upload');
    } else {
        saveDetail();
    }
}

// ################### Ajax Call ###############################################
// first pop-up in create course
function saveDetail() {

    $.ajax({
        type: "POST",
        url: customerSaveUrl,
        async: false,
        headers: {
            'X-CSRF-TOKEN': token
        },
        data: {
            groupId: getUrlVars()["groupId"],
            customerIdentificationNo: nationalID,
            idType: $("#id-type").val(),
            txtPersonalAddress1: personalAddressOne,
            txtPersonalAddress2: personalAddressTwo,
            sltPersonalProvince: personalAddressProvince,
            sltPersonalCity: personalAddressCity,
            salutaionId: title,
            sltGender: gender,
            txtFirstName: firstName,
            txtMiddleName: middleName,
            txtLastName: lastName,
            txtDob: dob,
            occupation: occupation,
            noFamily: noFamily,
            noDependents: noDependents,
            issuedCountry: issuedCountry,
            chkActive: status,
            username: username,
            fileUpload: fileUpload,
            phoneNoOne: mobileNoOne,
            phoneNoTwo: mobileNoTwo,
            landLine: landLineNo,
            personalEmail: personalEmail,
            email: email,
            fax: fax
        },
        success: function (data) {
            console.log(data);

            if (data.success === "true") {
                showSaveMsg(data);
            } else {
                showErrorMsg("Error", data.errorMessage);
                imageLoaded = false;
            }

        },
        error: function () {
            alert("Failed to load ");
        }
    });
}

function updateDetail() {

    $.ajax({
        type: "POST",
        url: customerUpdateUrl,
        async: false,
        headers: {
            'X-CSRF-TOKEN': token
        },
        data: {
            groupId: getUrlVars()["groupId"],
            customerId:$("#custId").val(),
            customerIdentificationNo: nationalID,
            idType: $("#id-type").val(),
            txtPersonalAddress1: personalAddressOne,
            txtPersonalAddress2: personalAddressTwo,
            sltPersonalProvince: personalAddressProvince,
            sltPersonalCity: personalAddressCity,
            salutaionId: title,
            sltGender: gender,
            txtFirstName: firstName,
            txtMiddleName: middleName,
            txtLastName: lastName,
            txtDob: dob,
            occupation: occupation,
            noFamily: noFamily,
            noDependents: noDependents,
            issuedCountry: issuedCountry,
            chkActive: status,
            username: username,
            fileUpload: fileUpload,
            phoneNoOne: mobileNoOne,
            phoneNoTwo: mobileNoTwo,
            landLine: landLineNo,
            personalEmail: personalEmail,
            email: email,
            fax: fax
        },
        success: function (data) {
            console.log(data);

            if (data.success === "true") {
                showSaveMsg(data);
            } else {
                showErrorMsg("Error", data.errorMessage);
                imageLoaded = false;
            }

        },
        error: function () {
            alert("Failed to load ");
        }
    });
}

// ################### DROPDOWNS ###############################################
$(document).ready(
        function () {
            $('.active').removeClass('active');
            $("#student-menu").addClass("active");

            $.ajaxSetup({
                global: false,
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': token
                },
                async: false,
            });


            $('.file-drop-zone').css({
                "height": "300"
            });

            $('.file-drop-zone-title').css({
                "font-size": "20px"
            });

        });



//Other Events
function operateFormatter(value, row, index) {
    return [
        '<a class="edit ml10" href="javascript:void(0)" title="Edit">',
        '<i class="glyphicon glyphicon-pencil"></i>',
        '</a>'
    ].join('');
}

window.operateEvents = {
    'click .edit': function (e, value, row, index) {
        //clearBtn.click();
        console.log(row);
        $("#custId").val(row.customerId);
        $("#title").val(row.salutaionId);
        $("#is-active").is(':checked'); // true
        $("#first-name").val(row.firstName);
        $("#middle-name").val(row.middleName);
        $("#last-name").val(row.lastName);
        
        //set gender
        if (row.gender == "1") {
        $("#male").attr('checked', true);
        } else if (row.gender == "0") {
        $("#female").attr('checked', true);
        }
        
        $("#dob").val(row.dateOfBirth);
        $("#age").val(getAge($("#dob").val()));
        
        
        $("#idenfition-no").val(row.customerIdentificationNumber);
        $("#id-type").val(row.idType);


        $("#personal-add1").val(row.firstAddress);
        $("#personal-add2").val(row.secondAddress);
        $("#personal-city").val(row.city);
        $("#personal-province").val(row.province);
        $("#personal-province").val(row.province);

        $("#occupation").val(row.occupation);
        $("#no-family").val(row.noOfFamilyMembers);
        $("#no-dependents").val(row.noOfDependents);
        $("#issued-country").val(row.issueCountry);

        $("#contact-1").val(row.mobileNumberOne);
        $("#contact-2").val(row.mobileNumberTwo);
        $("#landline").val(row.landLineNumber);
        $("#email-personal").val(row.personalEmail);
        $("#email").val(row.email);
        $("#fax").val(row.fax);

        username = $("#txtUserName").val();

        if (row.status==="Active") {

          $("#is-active").prop( "checked", true );
           
        } else {
            
          $("#is-active").prop('checked', false);
          
        }
        
        $('#submit').html('Update');
    }
};

//Other Events
function operateFormatterMember(value, row, index) {
    return [
        '<a class="edit ml10" href="javascript:void(0)" title="Edit">',
        '<i class="glyphicon glyphicon-pencil"></i>',
        '</a>'
    ].join('');
}

window.operateEventsAddMemberDetail = {
    'click .edit': function (e, value, row, index) {
        console.log("clicked",row);
       // window.location.href = "create-member-business-details?groupId=" + row.groupId+"&memberId="+row.groupId;
    }
};



// ################### EVENTS ###############################################


$("#id-type").change(function () {
    if ($("#id-type").val() == "NIC") {
        $("#idenfition-no").attr('maxlength', '20');
    }
    else {
        $("#idenfition-no").attr('maxlength', '20');
    }
});

$("#input-id").fileinput({
    uploadUrl: "file-upload/upload-student",
    allowedFileExtensions: ['jpg', 'png', 'gif'],
    overwriteInitial: false,
    maxFileSize: 2000,
    maxFilesNum: 10,
    allowedFileTypes: ['image'],
    uploadAsync: false,
});


$('#input-id').on('fileloaded',
        function (event, file, previewId, index, reader) {
            imageLoaded = true;
            $(".file-footer-buttons").hide();
            $(".file-upload-indicator").hide();
        });

$("#resetButton").click(function () {
     clearDetailPage();
});


$('#input-id').on('fileuploaded', function (event, data, previewId, index) {
    $.each(data.response, function (index, file) {
        fileName = file.renamedFileName;
    });
    fileUpload = fileName;
    saveDetail();
});

$("#dob").change(function () {
    var validator = $("#form-student-details").validate();
    validator.element("#dob");
    age = getAge($("#dob").val());
    $("#age").val(getAge($("#dob").val()));
});


$(".stu-no").change(function () {
    isValidStudent();
});
$(".idenfition-no").mousedown(function () {
    isValidStudent();
});
$(".contact-1").change(function () {
    isValidStudent();
});
$(".contact-2").change(function () {
    isValidStudent();
});
$(".email-personal").change(function () {
    isValidStudent();
});
$(".landline").change(function () {
    isValidStudent();
});
$(".fax").change(function () {
    isValidStudent();
});
$('#something').click(function () {
    location.reload();
});

$(".contact").change(function () {
    isValidContact();
});

$("#submit").click(function () {
    //  if (isValidStudent()) {
    showMemberSaveconfirmation();
    //} else {
    //  focusInvalid();
    //}
});

// ################### HTML UPDATE ##########################################

function generateStudentViewData() {
    var content = "<table id='tableDetails' class='table table-bordered table-striped'>";
    content += "<tbody>";
    ////---Personal Details----///////
    content += "<tr><th colspan='2'>Personal Details</th></tr>";
    content += "<tr>";
    content += "<tr>";
    content += "<td>Identification Number</td>";
    content += "<td>" + identityType + "-" + nationalID + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Title</td>";
    content += "<td>" + title + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Name</td>";
    content += "<td>" + firstName + " " + middleName + " " + lastName + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Date Of Birth</td>";
    content += "<td>" + dob + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Age</td>";
    content += "<td>" + $("#age").val() + "</td>";
    content += "</tr>";
    ////---Personal Address Details----///////
    content += "<tr><th colspan='2'>Personal Address Details</th></tr>";
    content += "<tr>";
    content += "<tr>";
    content += "<td>Street Address 1</td>";
    content += "<td>" + personalAddressOne + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Street Address 2</td>";
    content += "<td>" + personalAddressTwo + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>City</td>";
    content += "<td>" + personalAddressCity + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Province</td>";
    content += "<td>" + personalAddressProvince + "</td>";
    content += "</tr>";
    content += "<tr>";
    ////---Personal Contact Details-----///////
    content += "<tr><th colspan='2'>Personal Contact Details</th></tr>";
    content += "<tr>";
    content += "<tr>";
    content += "<td>Mobile Number 1</td>";
    content += "<td>" + mobileNoOne + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Mobile Number 2</td>";
    content += "<td>" + mobileNoTwo + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Land Line Number</td>";
    content += "<td>" + landLineNo + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Personal Email</td>";
    content += "<td>" + personalEmail + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Email</td>";
    content += "<td>" + email + "</td>";
    content += "</tr>";
    content += "<tr>";
    content += "<td>Fax</td>";
    content += "<td>" + fax + "</td>";
    content += "</tr>";
    content += "</tbody>";
    content += "</table>";
    return content;
}

function showMemberSaveconfirmation() {
    getData();
    BootstrapDialog.show({
        title: 'Save Confirmation',
        cssClass: 'details-dialog',
        message: generateStudentViewData(),
        buttons: [{
                label: 'Save',
                cssClass: 'btn-success',
                autospin: true,
                action: function (dialog) {
                    dialog.enableButtons(false);
                    dialog.setClosable(false);
                    var btnstatus=$('#submit').html();
                    if(btnstatus==='Submit'){
                         saveEvent();
                         
                    }else{
                       updateDetail();
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

function showSaveMsg(result) {

    dialogInstance = new BootstrapDialog();
    dialogInstance.setTitle('Save Message');
    dialogInstance.setMessage("Entry saved!, Customer Id is " + result.result);
    dialogInstance.setType(BootstrapDialog.TYPE_SUCCESS);
    dialogInstance.open();

    setTimeout(function () {
        //showHeadings(memberId);
        dialogInstance.close();
        imageLoaded = false;
        window.location.href = "create-member?groupId=" + result.errorCode;
        loadData();
    }, 3000);

}


function showHeadings(memberId) {

    document.getElementById("details-enrollment").setAttribute("href", "member-details-enrollment-modify?studentId=" + $("#ref-no").val());
    document.getElementById("bussiness-details").setAttribute("href", "create-member-business-details?studentId=" + $("#ref-no").val());
    document.getElementById("income-and-expenses").setAttribute("href", "student-activity-enrollment?studentId=" + $("#ref-no").val());
    document.getElementById("guarantor-profile").setAttribute("href", "student-activity-enrollment?studentId=" + $("#ref-no").val());
}


function clearDetailPage() {
     $("#id-type").val("NIC");
     $("#title").val("Mr.");
     $("#is-active").prop( "checked", true ); // true
     $("#male").prop('checked', true);
     $("#first-name").val("");
     $("#middle-name").val("");
     $("#last-name").val("");
     $("#idenfition-no").val("");
     $("#age").val("");
   
     $("#dob").val("");
     $("#personal-add1").val("");
     $("#personal-add2").val("");
     $("#personal-city").val("");
     $("#personal-province").val("");

     $("#occupation").val("");
     $("#no-family").val("");
     $("#no-dependents").val("");
     $("#issued-country").val("");

     $("#contact-1").val("");
     $("#contact-2").val("");
     $("#landline").val("");
     $("#email-personal").val("");
     $("#email").val("");
     $("#fax").val(""); 
     $('#submit').html('Save');
}

$("#title").change(function () {
    console.log($(this).val());
    //set gender according to title
    if ($(this).val() == 'Mr.') {
        $("#male").prop('checked', true);
    } else {
        $("#female").prop('checked', true);
    }

});

function loadData() {
    
    //Loads from database
    data = ajaxLoadData(getUsers, "GET", getUrlVars()["groupId"]);
    //Loading database data to bootstrap table
    table.bootstrapTable('load', data);

}

function ajaxLoadData(url, type, groupId) {

    var returnData = null;
    console.log(groupId);
    $.ajax({
        type: type,
        url: url,
        async: false,
        data: {
            groupId: groupId
        }, headers: {
            'X-CSRF-TOKEN': token
        },
        success: function (data) {
            returnData = data;
        },
        error: function () {
            alert("Failed to load ");
        }
    });
    return returnData;
}


