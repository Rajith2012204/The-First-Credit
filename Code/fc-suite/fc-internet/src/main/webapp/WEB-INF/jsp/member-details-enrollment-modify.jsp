<!--########################## Main Header ###########################-->
<%@include file="template/main/header.jsp"%>

<!-- ############# PAGE TITLE ############# -->
<script>
    document.title = "MISY Myanmar International School - Student Details Form";
</script>




<!-- ############# CONTENT ############# -->
<div class="content">

    <div id="modal" class="row">
        <div class="col-sm-12">
            <ul id="section-nav">
                <security:authorize ifAnyGranted="1030">
                    <li class="current"><a  id="student-details-enrollment" href="#">Details</a></li>
                    </security:authorize>
                    <security:authorize ifAnyGranted="1001">
                    <li><a id="student-qualification-enrollment" href="#">Education Qualifications</a></li>
                    </security:authorize>
                    <security:authorize ifAnyGranted="1002">
                    <li><a id="student-activity-enrollment" href="#">Activities</a></li>
                    </security:authorize>
                    <security:authorize ifAnyGranted="1003">
                    <li><a id="student-achivement-enrollment" href="student-achivement-enrollment">Achievements</a></li>
                    </security:authorize>
                <!--                <li><a id="student-scholarship-enrollment"
                                       href="student-scholarship-enrollment">Scholarship</a></li>-->
                <security:authorize ifAnyGranted="1005">
                    <li><a id="student-sibling-enrollment" href="student-sibling-enrollment">Sibling</a></li>
                    </security:authorize>
                    <security:authorize ifAnyGranted="1006">
                    <li><a id="parent-details-enrollment" href="parent-details-enrollment">Parents</a></li>
                    </security:authorize>
                    <security:authorize ifAnyGranted="1007">
                    <li><a id="student-documents-loader" href="student-documents-loader">Attachments</a></li>
                    </security:authorize>
            </ul>
            <a href="student-details-enrollment.jsp"></a>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <h2 class="form-heading">Student Details</h2>
        </div>
    </div>

    <form class="form-horizontal form-custom" id="form-student-details"
          role="form" enctype="multipart/form-data">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-section">
                    <h3 class="form-subheading">Personal Details</h3>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="admission">Admission Date</label>
                        <div class="col-sm-10 col-md-9">
                            <div class="input-group date">
                                <input type="text" class="form-control datepicker other"
                                       id="admission" name="admission" data-date-format="mm/dd/yyyy" />
                                <span class="input-group-addon"> <span
                                        class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="ref-no">Student Reference Number</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text"  class="form-control   stringNumberValClass  other" maxlength="20"
                                   id="ref-no" name="ref-no" placeholder="Student Reference Number" disabled="true">
                        </div> 
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3"
                               for="ref-no">Student Number</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control stringNumberValClass other" maxlength="30"
                                   id="stu-no" name="stu-no"
                                   placeholder="Student Number">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3"
                               for="ref-no">Identification Number</label>
                        <div class="col-sm-4">
                            <select class="form-control other" id="id-type" name="id-type">
                                <option value="NRIC">NRIC</option>
                                <option value="Passport">Passport No.</option>
                                <option value="Driving Licence">Driving Licence</option>
                            </select>
                        </div>
                        <div class="col-sm-5 col-md-5">
                            <input type="text" class="form-control stringNumberValClass other"
                                   id="idenfition-no" name="idenfition-no" maxlength="20"
                                   placeholder="NRIC/PP/DL">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="title">Title</label>
                        <div class="col-sm-4">
                            <select class="form-control other" id="title" name="title">
                                <option>Mr.</option>
                                <option>Ms.</option>
                                <option>Miss.</option>
                                <option>Mrs.</option>
                            </select>
                        </div>
                        <div class="col-sm-5 ">
                            <label class="control-label col-sm-8 col-md-8 checkbox"
                                   for="is-active">Active</label>
                            <div class="col-xs-1 col-sm-3">
                                <input type="checkbox" class="other checkbox" id="is-active"
                                       name="is-active" checked="checked">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="is-enrolled">Enrolment Status</label>
                        <div class="col-sm-10 col-md-9">
                            <select class="form-control other" id="is-enrolled" name="is-enrolled"
                                    placeholder="Is Enrolled">
                                <option>Is Enrolled</option>
                                <option>Withdrawn</option>
                                <option>Missing in action</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required "
                               for="first-name">First Name</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control  other"
                                   id="first-name" name="first-name" placeholder="First Name"
                                   maxlength="30">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3" for="middle-name">Middle
                            Name</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control  other"
                                   id="middle-name" placeholder="Middle Name" maxlength="30">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="last-name">Last Name</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control lastNameVal other"
                                   id="last-name" name="last-name" placeholder="Last Name"
                                   maxlength="30">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="radio col-sm-offset-2 col-md-offset-3">
                            <label class="control-label radio" for="male">Male</label>
                            <div class="col-xs-1 col-sm-1">
                                <input type="radio" class="other" name="gender" id="male"
                                       checked="checked">
                            </div>
                            <label class="control-label radio " for="female">Female</label>
                            <div class="col-xs-1 col-sm-1">
                                <input type="radio" class="other" name="gender" id="female">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="dob">DOB</label>
                        <div class=" col-md-9">
                            <div class="input-group date">
                                <input type="text" class="form-control dob-datepicker other"
                                       id="dob" name="dob" data-date-format="mm/dd/yyyy" /> <span
                                       class="input-group-addon"> <span
                                        class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3" for="age">Age</label>
                        <div class="col-md-9">
                            <input type="text" disabled="disabled"
                                   class="form-control numberValClass other" id="age" name="age"
                                   maxlength="2">
                        </div>
                    </div>
                    <div class="form-group">
                        <div
                            class="inner-form-group col-sm-5 col-md-4 col-sm-offset-2 col-md-offset-3">
                            <label class="control-label" for="blood-type">Blood Type</label>
                            <select class="form-control other" id="blood-type">
                                <option>O+</option>
                                <option>A+</option>
                                <option>B+</option>
                                <option>AB</option>
                                <option>O-</option>
                                <option>N/A</option>
                            </select>
                        </div>
                        <div class="inner-form-group col-sm-5 col-md-4 col-md-offset-1">

                            <label class="control-label  is-required" for="nationality">Nationality</label>
                            <div class="">
                                <select class="form-control other" id="nationality"
                                        name="nationality" placeholder="Nationality">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div
                            class="inner-form-group col-sm-5 col-md-4 col-sm-offset-2 col-md-offset-3">
                            <label class="control-label" for="language">Language 1</label>
                            <div class="">
                                <select class="form-control other" id="language1">
                                </select>
                            </div>

                        </div>
                        <div class="inner-form-group col-sm-5 col-md-4 col-md-offset-1">
                            <label class="control-label" for="language">Language 2</label>
                            <div class="">
                                <select class="form-control other" id="language2" name="language2">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div
                            class="inner-form-group col-sm-5 col-md-4 col-sm-offset-2 col-md-offset-3">
                            <label class="control-label" for="religion">Religion</label>
                            <div class="">
                                <select class="form-control other" id="religion">
                                </select>
                            </div>
                        </div>
                        <!--                        <div class="inner-form-group col-sm-5 col-md-4 col-md-offset-1">
                                                    <label class="control-label" for="otherreligion">Other</label>
                                                    <div class="">
                                                        <input type="text" class="form-control other"
                                                               id="other-religion" placeholder="Other Religion" maxlength="10">
                                                    </div>
                                                </div>-->
                        <div class="inner-form-group col-sm-5 col-md-4 col-md-offset-1">
                            <label class="control-label"     for="birthplace">Birth Place</label>
                            <div class="">
                                <input type="text" class="form-control other" id="birthplace" name="birthplace"
                                       placeholder="Birth Place" maxlength="30">
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3" for="last-name">Profile
                            Image</label>
                        <div class="col-sm-10 col-md-9">
                            <input id="input-id" type="file" name="files[]" class="uploadFile file"
                                   data-preview-file-type="text" data-show-upload="false">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="category">Interested Curriculum</label>
                        <div class="col-sm-10 col-md-9">
                            <select class="form-control other" id="program" name="program">
                                <option>Select Curriculum</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="category">Student Category</label>
                        <div class="col-sm-10 col-md-9">
                            <select class="form-control other" id="category" name="category"
                                    placeholder="Student Category">
                                <option>Select Student Category</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="category">Source</label>
                        <div class="col-sm-10 col-md-9">
                            <select class="form-control other" id="source" name="source">
                                <option value="">Select Source</option>
                                <option>Friends/Existing Students</option>
                                <option>Design Club</option>
                                <option>Education Fair</option>
                                <option>Newspaper</option>
                                <option>Internet/MISY website</option>
                                <option>Radio</option>
                                <option>Facebook</option>
                                <option>Other</option>
                            </select> <input type="text" class="form-control other"
                                             placeholder="State the source" id="sourceTxt" name="sourceTxt" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3"
                               for="student-house">Student House</label>
                        <div class="col-sm-10 col-md-9">
                            <select class="form-control other" id="student-house" name="student-house"
                                    placeholder="Student House">
                                <option>Select Student House</option>
                            </select>
                        </div>
                    </div>
                </div>


            </div>
            <div class="col-sm-6">
                <div class="form-section">
                    <h3 class="form-subheading">Personal Address Details</h3>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required" for="add1">Street
                            Address 1</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="personal-add1"
                                   name="personal-add1" placeholder="Address 1" maxlength="250">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="add2">Street
                            Address 2</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="personal-add2"
                                   placeholder="Address 2" maxlength="250">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required"
                               for="personal-city">City</label>
                        <div class="col-sm-9">
                            <select class="form-control other" id="personal-city"
                                    name="personal-city" placeholder="City"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required"
                               for="personal-province">State</label>
                        <div class="col-sm-9">
                            <select class="form-control other" id="personal-province"
                                    name="personal-province" placeholder="State"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required"
                               for="personal-country">Country</label>
                        <div class="col-sm-9">
                            <select class="form-control other" id="personal-country"
                                    name="personal-country">
                                <option>Sri Lanka</option>
                                <option>Maldives</option>
                                <option>United States of America</option>
                                <option>United Kingdom</option>
                                <option>China</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-8 col-md-4 checkbox"
                               for="is-postal"> This is Postal Address</label>
                        <div class="col-xs-1 col-push-2">
                            <input type="checkbox" class="other checkbox" id="is-postal"
                                   name="is-postal" checked="checked">
                        </div>
                    </div>
                </div>


                <div class="form-section" id="postal-address-form">
                    <h3 class="form-subheading">Postal Address Details</h3>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required" for="add1">Street
                            Address 1</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control postalAdd ignore"
                                   id="postal-add1" name="postal-add1" placeholder="Address 1"
                                   maxlength="250">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="add2">Street
                            Address 2</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control postalAdd ignore"
                                   id="postal-add2" placeholder="Address 2" maxlength="250">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required"
                               for="postal-city">City</label>
                        <div class="col-sm-9">
                            <select class="form-control postalAdd ignore" id="postal-city"
                                    name="postal-city" placeholder="City"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required"
                               for="postal-province">Province</label>
                        <div class="col-sm-9">
                            <select class="form-control postalAdd ignore"
                                    id="postal-province" name="postal-province"
                                    placeholder="Province/State"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required"
                               for="postal-country">Country</label>
                        <div class="col-sm-9">
                            <select class="form-control postalAdd ignore" id="postal-country"
                                    name="postal-country">
                                <option>Sri Lanka</option>
                                <option>Maldives</option>
                                <option>United States of America</option>
                                <option>United Kingdom</option>
                                <option>China</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="form-subheading">Personal Contact Details</h3>


                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="phone-number">Mobile Number 1</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control  tpnumberValClass other" id="contact-1"
                                   name="contact-1" placeholder="Mobile No. 1" maxlength="15">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3"
                               for="phone-number">Mobile Number 2</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control  tpnumberValClass other" id="contact-2"
                                   name="contact-2" placeholder="Mobile No. 2" maxlength="15">
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3"
                               for="landLine-number">Land Line Number</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control  tpnumberValClass other" id="landline"
                                   name="landline" placeholder="Land Line No." maxlength="15">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="email-personal">Personal Email</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="email-personal"
                                   maxlength="100" name="email-personal"
                                   placeholder="Personal Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3" for="email-college">Email</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="email"
                                   name="email" maxlength="100" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3" for="fax">Fax</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control tpnumberValClass other" id="fax" name="fax" maxlength="15"
                                   placeholder="Fax No.">
                        </div>
                    </div>
                </div>
                <div class="form-section">
                    <h3 class="form-subheading">Previous School Details</h3>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="previous-school">Previous School</label>
                        <div class="col-sm-9">
                            <input type="text" id="previousSchoolId" hidden="true">
                            <select class="form-control other" id="previous-school"
                                    name="previous-school"></select>
                            <span id="school_previous"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="reason">Reason For Leaving</label>
                        <div class="col-sm-9">
                            <textarea class="form-control other" id="reason" name="reason"
                                      maxlength="100" style="resize: none"
                                      placeholder="Reason For Leaving"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9 text-right">
                            <button id="resetEmg" type="button" class="btn-custom btn-cancel">Clear</button>
                            <button id="add" type="button" class="btn-custom btn-primary">Add</button>
                        </div>
                    </div>
                    <table id="previous-school-table" class="form-table"></table>
                </div>
                <div class="form-section">
                    <!--                    <h3 class="form-subheading">How do you want to be notified?</h3>-->
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-4 checkbox"
                               for="email-checkbox"> Email Notifications</label>
                        <div class="col-xs-1 col-push-2">
                            <input type="checkbox" class="other checkbox" id="email-checkbox"
                                   name="alert" checked="checked">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9 text-right">
<!--                    <button id="resetButton" type="button"
                            class="btn-custom btn-cancel">Clear</button>-->
                    <button id="submit" type="button" class="btn-custom btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </form>


</div>
<!-- ############# /CONTENT ############# -->
<%@include file="template/main/footer.jsp"%>
<script
src="${pageContext.servletContext.contextPath}/resources/js/common-functions.js"></script>
<script
src="${pageContext.servletContext.contextPath}/resources/js/common-dropdown.js"></script>
<script
src="${pageContext.servletContext.contextPath}/resources/js/student-enrollment-init.js"></script>
<script
src="${pageContext.servletContext.contextPath}/resources/js/validation/common-validation.js"></script>
<script
src="${pageContext.servletContext.contextPath}/resources/js/validation/student-details-validation.js"></script>
<script
src="${pageContext.servletContext.contextPath}/resources/js/student-details-enrollment-modify.js"></script>

<script
src="${pageContext.servletContext.contextPath}/resources/js/init.js"></script>


