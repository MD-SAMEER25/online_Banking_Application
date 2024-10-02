<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Container: No Accounts -->
<div class="container">
    <!-- Card: No Accounts -->
    <div class="card no-accounts-card">
        <div class="card-body">
            <h1 class="card-title">
                <i class="fas fa-ban text-danger"></i> No Registered Accounts
            </h1>
            <div class="card-text">
                You currently do not have any registered accounts.
                Please click below to register or add a new account.
            </div>

            <!-- Button to open right-side offcanvas -->
            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                <i class="fa fa-credit-card"></i> Add an account
            </button>
        </div>
    </div>
</div>
<!-- End of Container: No Accounts -->
