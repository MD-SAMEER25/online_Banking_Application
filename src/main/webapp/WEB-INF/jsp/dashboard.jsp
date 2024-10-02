<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../css/fontawesome/css/all.css">
    <link rel="stylesheet" href="../css/main.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Dashboard</title>
</head>

<body>



<c:import url="components/incl/header.jsp" />
<c:import url="components/add_account_offcanvas.jsp" />

<!-- Start Of Transact OffCanvas -->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title text-white" id="offcanvasExampleLabel">Transact</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <!-- Offcanvas: Transact Body -->
    <div class="offcanvas-body">
        <small class="card-text text-white">
            Choose an option below to perform a transaction
        </small>
        <!-- Transaction Type Drop Down List -->
        <select name="transact-type" class="form-control my-3" id="transact-type">
            <option value="">-- Select Transaction Type --</option>
            <option value="payment">Payment</option>
            <option value="transfer">Transfer</option>
            <option value="deposit">Deposit</option>
            <option value="withdraw">Withdraw</option>
        </select>
        <!-- End Of Transaction Type Drop Down List -->

        <!-- Payment Card -->
        <div class="card payment" style="display: none;">
            <div class="card-body">
                <form action="/transact/payment" method="POST" class="payment-form">
                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for="beneficiary">Account holder/Beneficiary</label>
                        <input type="text" name="beneficiary" id="beneficiary" class="form-control" placeholder="Enter Account holder/Beneficiary" required>
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for="beneficiary-account-number">Beneficiary account number</label>
                        <input type="text" name="account_number" id="beneficiary-account-number" class="form-control" placeholder="Enter Beneficiary account no" required>
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group">
                        <label for="payment-account">Select Account</label>
                        <select name="account_id" id="payment-account" class="form-control" required>
                            <option value="">-- Select Account --</option>
                            <c:if test="${userAccounts != null}">
                                <c:forEach items="${userAccounts}" var="selectAccount">
                                    <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for="payment-reference">Reference</label>
                        <input type="text" name="reference" id="payment-reference" class="form-control" placeholder="Enter Reference" required>
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <label for="payment-amount">Enter payment amount</label>
                        <input type="text" name="payment_amount" id="payment-amount" class="form-control" placeholder="Enter payment amount" required>
                    </div>
                    <!-- End Of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group mb-2">
                        <button id="payment-btn" type="submit" class="btn btn-md transact-btn">Pay</button>
                    </div>
                    <!-- End Of Form Group -->
                </form>
            </div>
        </div>
        <!-- End Of Payment Card -->




        <!-- Deposit Card -->
        <div class="card deposit" style="display: none;">
            <div class="card-body">
                <form action="/transact/deposit" method="POST" class="deposit-form">
                    <div class="form-group mb-2">
                        <label for="deposit-amount">Enter deposit amount</label>
                        <input type="text" id="deposit-amount" name="deposit_amount" class="form-control" placeholder="Enter deposit amount">
                    </div>

                    <div class="form-group">
                        <label for="deposit-account">Select Account</label>
                        <select id="deposit-account" name="account_id" class="form-control">
                            <option value="">-- Select Account --</option>
                            <c:if test="${userAccounts != null}">
                                <c:forEach items="${userAccounts}" var="selectAccount">
                                    <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <button id="deposit-btn" class="btn btn-md transact-btn">Deposit</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Of Deposit Card -->

        <!-- Transfer Card -->
        <div class="card transfer" style="display: none;">
            <div class="card-body">
                <form action="/transact/transfer" method="POST" class="transfer-form">
                    <div class="form-group mb-2">
                        <label for="transfer-from-account">Select Account to Transfer From</label>
                        <select name="transfer_from" class="form-control" id="transfer-from-account">
                            <option value="">-- Select Account --</option>
                            <c:if test="${userAccounts != null}">
                                <c:forEach items="${userAccounts}" var="selectAccount">
                                    <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <label for="transfer-to-account">Select Account to Transfer To</label>
                        <select name="transfer_to" class="form-control" id="transfer-to-account">
                            <option value="">-- Select Account --</option>
                            <c:if test="${userAccounts != null}">
                                <c:forEach items="${userAccounts}" var="selectAccount">
                                    <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <label for="transfer-amount">Enter Transfer Amount</label>
                        <input type="text" name="transfer_amount" class="form-control" id="transfer-amount" placeholder="Enter transfer amount">
                    </div>

                    <div class="form-group mb-2">
                        <button id="transfer-btn" class="btn btn-md transact-btn">Transfer</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Of Transfer Card -->

        <!-- Withdraw Card -->
        <div class="card withdraw" style="display: none;">
            <div class="card-body">
                <form action="/transact/withdraw" method="POST" class="withdraw-form">
                    <div class="form-group mb-2">
                        <label for="withdraw-amount">Enter Withdrawal Amount</label>
                        <input type="text" name="withdrawal_amount" id="withdraw-amount" class="form-control" placeholder="Enter withdrawal amount">
                    </div>

                    <div class="form-group mb-2">
                        <label for="withdraw-account">Select Account</label>
                        <select name="account_id" class="form-control" id="withdraw-account">
                            <option value="">-- Select Account --</option>
                            <c:if test="${userAccounts != null}">
                                <c:forEach items="${userAccounts}" var="selectAccount">
                                    <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <button id="withdraw-btn" class="btn btn-md transact-btn">Withdraw</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Of Withdraw Card -->
    </div>
    <!-- End Of Offcanvas Body -->
</div>
<!-- End Of Transact OffCanvas -->

<!-- JavaScript to toggle cards based on dropdown selection -->
<!-- JavaScript to toggle cards based on dropdown selection -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const transactTypeSelect = document.getElementById('transact-type');
        const paymentCard = document.querySelector('.payment');
        const depositCard = document.querySelector('.deposit');
        const transferCard = document.querySelector('.transfer');
        const withdrawCard = document.querySelector('.withdraw');

        transactTypeSelect.addEventListener('change', function () {
            const selectedValue = this.value;

            // Hide all cards initially
            paymentCard.style.display = 'none';
            depositCard.style.display = 'none';
            transferCard.style.display = 'none';
            withdrawCard.style.display = 'none';

            // Show the selected card
            if (selectedValue === 'payment') {
                paymentCard.style.display = 'block';
            } else if (selectedValue === 'deposit') {
                depositCard.style.display = 'block';
            } else if (selectedValue === 'transfer') {
                transferCard.style.display = 'block';
            } else if (selectedValue === 'withdraw') {
                withdrawCard.style.display = 'block';
            }
        });
    });
</script>



<!-- Container -->
<!-- Container -->
<div class="container">

    <!-- Display Message -->
    <c:if test="${success != null}">
        <div class="alert alert-info text-center border border-info" id="success-message">
            <b>${success}</b>
        </div>
    </c:if>
    <!-- End Of Display Message -->

    <!-- Display Error Message -->
    <c:if test="${error != null}">
        <div class="alert alert-danger text-center border border-danger" id="error-message">
            <b>${error}</b>
        </div>
    </c:if>
    <!-- End Of Display Error Message -->
</div>
<!-- End Of Container -->

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Hide success message after 4 seconds
        const successMessage = document.getElementById('success-message');
        if (successMessage) {
            setTimeout(() => {
                successMessage.style.display = 'none';
            }, 4000);
        }

        // Hide error message after 4 seconds
        const errorMessage = document.getElementById('error-message');
        if (errorMessage) {
            setTimeout(() => {
                errorMessage.style.display = 'none';
            }, 3000);
        }
    });
</script>



<c:choose>
    <c:when test="${fn:length(userAccounts) > 0}">
        <!-- Display Accounts -->
        <c:import url="components/accounts_display.jsp" />
    </c:when>
    <c:otherwise>
        <!-- Don't Display Accounts -->
        <c:import url="components/no_accounts_display.jsp" />
    </c:otherwise>
</c:choose>

<script src="//code.tidio.co/jo9svlhqjtrrzinjd9gpiwziwjeaki4q.js" async></script>



</body>

</html>