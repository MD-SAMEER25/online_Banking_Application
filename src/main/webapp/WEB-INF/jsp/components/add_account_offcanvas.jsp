<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Offcanvas for Accounts -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title text-white" id="offcanvasRightLabel">Create / Add an Account</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <div class="card">
            <div class="card-body">
                <form action="/account/create_account" method="POST" class="add-account-form">
                    <div class="form-group mb-3">
                        <label for="accountName">Enter Account Name</label>
                        <input type="text" name="account_name" id="accountName" class="form-control" placeholder="Enter account name">
                    </div>

                    <div class="form-group mb-3">
                        <label for="accountType">Select Account Type</label>
                        <select name="account_type" id="accountType" class="form-control">
                            <option value="">--Select account type--</option>
                            <option value="checking">Checking</option>
                            <option value="savings">Savings</option>
                            <option value="business">Business</option>
                        </select>
                    </div>

                    <div class="form-group mb-3">
                        <label for="additionalInfo">Additional Information</label>
                        <input type="text" name="additional_info" id="additionalInfo" class="form-control" placeholder="Enter additional information">
                    </div>

                    <div class="form-group mb-2">
                        <button type="submit" class="btn btn-md btn-primary">Add Account</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- End of Offcanvas for Accounts -->