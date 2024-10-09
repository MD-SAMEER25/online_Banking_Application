<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Container with Buttons to Open Offcanvas -->
<div class="container d-flex mt-4">
    <button id="add-account-btn" class="btn btn-lg shadow" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
        <i class="fa fa-credit-card"></i> Add new accounts
    </button>
    <button id="transact-btn" class="btn btn-lg ms-auto shadow" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
        <i class="fa fa-wallet"></i> Transaction
    </button>
</div>
<!-- End of Container with Buttons -->

<!-- Container: Total Account Balance -->
<div class="container d-flex">
    <h2 class="me-auto">Total Account Balance:</h2>
    <h2 class="ms-auto">
        <c:if test="${requestScope.totalBalance != null}">
            <c:out value="${totalBalance}"/>
        </c:if>
    </h2>
</div>
<!-- End of Container: Total Account Balance -->
<!-- Container: Accordion Menu / Drop Down -->
<div class="container">
    <!-- Accordion Menu / Drop Down -->
    <c:if test="${requestScope.userAccounts != null }">

        <c:forEach items="${requestScope.userAccounts}" var="account">

            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${account.account_id}" aria-expanded="false" aria-controls="flush-collapseOne">
                                ${account.account_name}
                        </button>
                    </h2>
                    <div id="flush-${account.account_id}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <!-- Account Details List -->
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex">Account Name <span class="ms-auto"><b>${account.account_name}</b></span></li>
                                <li class="list-group-item d-flex">Account Number <span class="ms-auto"><b>${account.account_number}</b></span></li>
                                <li class="list-group-item d-flex">Account Type <span class="ms-auto"><b>${account.account_type}</b></span></li>
                                <li class="list-group-item d-flex">Account Balance <span class="ms-auto"><b>${account.balance}</b></span></li>
                                <li class="list-group-item d-flex">User ID <span class="ms-auto"><b>${account.user_id}</b></span></li>
                                <li class="list-group-item d-flex">Account ID <span class="ms-auto"><b>${account.account_id}</b></span></li>
                            </ul>
                            <!-- Account Details List -->
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </c:if>
    <!-- End Of Accordion Menu / Drop Down -->
</div>
<!-- End Of Container: Accordion Menu / Drop Down -->
