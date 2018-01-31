<%-- 
    Document   : create-group
    Created on : Feb 15, 2017, 10:05:05 AM
    Author     : Naveen
--%>

<!--########################## Main Header ###########################-->
<%@include file="template/main/header.jsp" %>

<!-- ############# PAGE TITLE ############# -->
<script>
    document.title = "The First Credit - Create Product Form";

</script>
<!-- ############# CONTENT ############# -->
<div class="content"> 
    <div class="row">
        <div class="col-sm-12">
            <h2 class="form-heading">Create Product</h2>
        </div>
    </div>

    <form class="form-horizontal form-custom" id="form-group" role="form" enctype="multipart/form-data">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-section">
                    <h3 class="form-subheading">Loan Details</h3>

                    <div class="form-group" hidden="true">
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control other"
                                   id="loan-id" name="loan-id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required" for="product">Name of the Loan</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control other"
                                   id="loan-name" name="loan-name" placeholder="Name of the loan"
                                   maxlength="50">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required"
                               for="title">Installment type</label>
                        <div class="col-sm-9">
                            <select class="form-control other" id="InstallmentType" name="InstallmentType">
                                <option>Monthly</option>
                                <option>Weekly</option>
                                <option>Daily</option>
                                <option>Maturity</option>
                                <option>30 Days</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required" for="product">Amount</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control other"
                                   id="product-amount" name="product-amount" placeholder="Amount"
                                   maxlength="50">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required" for="product">Interest rate</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control other"
                                   id="product-interest-rate" name="product-interest-rate" placeholder="Interest rate"
                                   maxlength="50">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-3 is-required" for="product">Terms</label>
                        <div class="col-sm-10 col-md-9">
                            <input type="text" class="form-control other"
                                   id="product-terms" name="product-terms" placeholder="Terms"
                                   maxlength="50">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 " for="details">Description</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="5" id="details" maxlength="250"
                                      placeholder="Description" style="resize:none"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 " for="status">Status</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="status">
                                <option>Active</option>
                                <option>Deactive</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-section">
                    <h3 class="form-subheading">Fees parameters</h3>
                    <div class="form-group">
                        <label class="control-label col-sm-3 is-required" for="add1">Starting Fee</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="starting-fee"
                                   name="starting-fee" placeholder="Starting Fee" maxlength="25">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="add2">Admin Fee</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="admin-fee"
                                   placeholder="Admin Fee" maxlength="25">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="add2">Insurance Fee</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="insurance-fee"
                                   placeholder="insurance-fee" maxlength="25">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="document-fee">Document Fee</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="document-fee"
                                   placeholder="Document Fee" maxlength="25">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="late-fee">Late Fees</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="late-fee"
                                   placeholder="Late Fees" maxlength="25">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="overdue-principle">Overdue Principle</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control other" id="overdue-principle"
                                   placeholder="Overdue Principle" maxlength="25">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9 text-right">
                        <button id="clear" type="reset" class="btn-custom btn-cancel">Reset</button>
                        <button id="add" type="button" class="btn-custom btn-primary">Add</button>
                    </div>
                </div>
             </div>
            
            <div class="col-sm-6">
                <div class="form-section">
                    <h3 class="form-subheading">Products</h3>
                    <div class="form-group">           
                        <div class="col-sm-12">
                            <div class="wr-bootstrap-table activity-table">
                                <table id="product-table" class="form-table"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- ############# /CONTENT ############# -->
<%@include file="template/main/footer.jsp" %>
<script src="${pageContext.servletContext.contextPath}/resources/js/init.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/common-functions.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/create-product.js"></script>

<script>
    $("#addmember").click(function () {
        window.location.href = '<%=request.getContextPath()%>/admin/create-member';
    });
</script>