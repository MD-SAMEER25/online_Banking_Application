<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <title>Payment History</title>
</head>

<body>

<!-- Main Page Header -->
<header class="main-page-header mb-3">
    <div class="container d-flex align-items-center">
        <!-- Company Name -->
        <div class="company-name">
            Bank Of India
        </div>
        <!-- End of Company Name -->

        <!-- Navigation -->
        <nav class="navigation ms-4">
            <ul class="d-flex align-items-center">
                <li><a href="${pageContext.request.contextPath}/app/dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/app/payment_history">Payment History</a></li>
                <li><a href="${pageContext.request.contextPath}/app/transact_history">Transaction History</a></li>
            </ul>
        </nav>
        <!-- End of Navigation -->

        <!-- Display Name -->
        <div class="display-name ms-auto">
            <i class="fa fa-circle text-success me-2"></i>Welcome: <span>${user.first_name} ${user.last_name}</span>
        </div>
        <!-- End of Display Name -->

        <!-- Logout Button -->
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm ms-2">
            <i class="fas fa-sign-out-alt" aria-hidden="true"></i> Sign out
        </a>
        <!-- End of Logout Button -->
    </div>
</header>
<!-- End of Main Page Header -->

<!-- Container -->
<div class="container">

    <!-- Card: Payment History Card -->
    <div class="card">
        <!-- Card Header -->
        <div class="card-header">
            <i class="fas fa-credit-card me-2" aria-hidden="true"></i> Payment History
        </div>
        <!-- End Of Card Header -->
        <!-- Card Body -->
        <div class="card-body">
            <c:if test="${requestScope.payment_history != null}">
                <!-- Payment History Table -->
                <table class="table text-center table-striped">
                    <tr>
                        <th>Record Number</th>
                        <th>Beneficiary</th>
                        <th>Beneficiary Account Number</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Reference</th>
                        <th>Reason Code</th>
                        <th>Created at</th>
                    </tr>
                    <!-- Loop Through Payment History Records -->
                    <c:forEach items="${requestScope.payment_history}" var="payments">
                        <tr>
                            <td>${payments.payment_id}</td>
                            <td>${payments.beneficiary}</td>
                            <td>${payments.beneficiary_acc_no}</td>
                            <td>${payments.amount}</td>
                            <td>${payments.status}</td>
                            <td>${payments.reference_no}</td>
                            <td>${payments.reason_code}</td>
                            <td>${payments.created_at}</td>
                        </tr>
                    </c:forEach>
                    <!-- End Of Loop Through Payment History Records -->
                </table>
                <!-- End Of Payment History Table -->
            </c:if>
        </div>
        <!-- End Of Card Body -->
    </div>
    <!-- End Of Card: Payment History Card -->
</div>
<!-- End Of Container -->

<!-- Footer -->
<script src="../js/main.js"></script>
</body>
</html>
