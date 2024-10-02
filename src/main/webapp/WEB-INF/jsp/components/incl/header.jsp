<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <li><a href="/app/dashboard">Dashboard</a></li>
                <li><a href="/app/payment_history">Payment History</a></li>
                <li><a href="/app/transact_history">Transaction History</a></li>
            </ul>
        </nav>
        <!-- End of Navigation -->

        <!-- Display Name -->
        <div class="display-name ms-auto">
            <i class="fa fa-circle text-success me-2"></i>Welcome: <span>${user.first_name} ${user.last_name}</span>
        </div>
        <!-- End of Display Name -->

        <!-- Logout Button -->
        <a href="/logout" class="btn btn-sm ms-2">
            <i class="fas fa-sign-out-alt" aria-hidden="true"></i> Sign out
        </a>
        <!-- End of Logout Button -->
    </div>
</header>
<!-- End of Main Page Header -->