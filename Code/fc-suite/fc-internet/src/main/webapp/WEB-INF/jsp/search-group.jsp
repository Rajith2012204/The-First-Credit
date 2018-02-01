
<!--########################## Main Header ###########################-->
<%@include file="template/main/header.jsp"%>

<!-- ############# PAGE TITLE ############# -->
<script>
    document.title = "MISY Myanmar International School - Student Details Search Form";
</script>

<!-- Dialog Menu -->

<!-- ############# CONTENT ############# -->
<div class="content">
    <div class="row">
        <div class="col-sm-12">
            <h2 class="form-heading">Search</h2>
        </div>
    </div>
    <form class="form-custom" id="form-student-search" role="form">
        <div class="row">
            <div class="col-sm-5">
                <div class="form-group">
                    <input type="text" class="form-control"
                           placeholder="Group by Name" name="" id="group-name">
                </div>
            </div>
            <div class="col-sm-5">
                <div class="form-group">
                    <input type="text" class="form-control"
                           placeholder="Group by Customer Name" name="" id="group-name">
                </div>
            </div>        
            <div class="col-sm-5">
               <div class="form-group">
                   <input type="text" class="form-control"
                          placeholder="Group by Customer NIC Number" name=""
                          id="search-nric">
               </div>
           </div>
           <div class="col-sm-5">
               <div class="form-group">
                   <input type="text" class="form-control"
                          placeholder="Group by Customer Driving Licence Number" name=""
                          id="search-driving">
               </div>
           </div>
           <div class="col-sm-5">
               <div class="form-group">
                   <input type="text" class="form-control"
                          placeholder="Group by Customer Passport Number" name="" id="search-passport">
               </div>
           </div>
            <div class="col-sm-5">
                <div class="form-group input-group">
                    <input type="text" class="form-control datepicker"
                           placeholder=" Group by Created Date" name=""
                           id="search-admission"> <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
    
    </form>

    <div class="row">
        <div class="col-sm-offset-5 col-sm-5 text-right">
            <div class="form-group">
                <div class="">
                    <button id="resetButton" type="button"
                            class="btn-custom btn-cancel">Reset</button>
                    <button id="submit" type="button" class="btn-custom btn-primary">Search</button><br/>
                    <button id="generate-excel" type="button" class="btn-custom btn-primary" style="display:none;float:right;margin:4px 0 0 0;">Generate Excel</button>
                    <button id="generate-pdf" type="button" class="btn-custom btn-primary" style="display:none;float:right;margin:4px 4px  0 0;">Generate PDF</button>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="search-results">Search
            Results</label>
        <div class="wr-bootstrap-table search-table">
            <table id="search-results" class="form-table"></table>
        </div>
        <!--</div>-->
    </div>
    <!-- ############# /CONTENT ############# -->

    <%@include file="template/main/footer.jsp"%>
    <!-- ############# CUSTOM SCRIPTS ############# -->    
    <script src="${pageContext.servletContext.contextPath}/resources/libs/bootstrap-typeahead/bootstrap3-typeahead.min.js"></script>
    <script
    src="${pageContext.servletContext.contextPath}/resources/js/common-functions.js"></script>
    <script
    src="${pageContext.servletContext.contextPath}/resources/js/validation/student-search-validation.js"></script>
    <script
    src="${pageContext.servletContext.contextPath}/resources/js/validation/common-validation.js"></script>
    <script
    src="${pageContext.servletContext.contextPath}/resources/js/common-dropdown.js"></script>
    <script
    src="${pageContext.servletContext.contextPath}/resources/js/student-enrollment-init.js"></script>
    <script
    src="${pageContext.servletContext.contextPath}/resources/js/student-details-search.js"></script>
    <script
    src="${pageContext.servletContext.contextPath}/resources/js/init.js"></script>





</html>