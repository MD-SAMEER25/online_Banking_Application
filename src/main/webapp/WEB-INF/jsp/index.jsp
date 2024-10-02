<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <link rel="stylesheet" href="css/default.css">
    <title>Bank of India</title>
    <style>
        .password-field {
            position: relative; /* Positioning for the eye icon */
        }

        .eye-icon {
            position: absolute;
            right: 10px; /* Position the icon */
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #FF4E00; /* Change to your theme color */
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center" style="height: 100vh;">

<!-- Card: User Authentication -->
<div id="auth-card" class="card col-12 col-md-8 col-lg-4 p-4 shadow-lg rounded">
    <!-- Card Body -->
    <div class="card-body text-center">
        <!-- Card Header -->
        <h1 class="card-title display-4 mb-3">Bank of India</h1>
        <h5 class="mb-4">Sign In to Your Account</h5>
        <!-- End of Card Header -->

        <!-- Display Success Message -->
        <c:if test="${requestScope.success != null}">
            <div id="successMessage" class="alert alert-success text-center border border-success">
                <b>${requestScope.success}</b>
            </div>
        </c:if>
        <!-- End Of Display Success Message -->

        <!-- Display Error Message -->
        <c:if test="${error != null}">
            <div class="alert alert-danger text-center border border-danger">
                <b>${error}</b>
            </div>
        </c:if>
        <!-- End Of Display Error Message -->

        <!-- Display Logged Out Message -->
        <c:if test="${logged_out != null}">
            <div id="loggedOutMessage" class="alert alert-info text-center border border-info">
                <b>${logged_out}</b>
            </div>
        </c:if>
        <!-- End Of Display Logged Out Message -->

        <form action="/index" method="POST" class="login-form">

            <!-- Username Input -->
            <div class="form-group mb-3">
                <label for="username" class="sr-only">UserName</label>
                <input type="text" id="username" name="email" class="form-control" placeholder="Username" required>
            </div>

            <!-- Password Input -->
            <div class="form-group mb-4 password-field">
                <label for="password" class="sr-only">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                <i class="fas fa-eye eye-icon" id="togglePassword" onclick="togglePasswordVisibility()"></i>
            </div>

            <div class="form-group mb-4">
                <input type="hidden" name="_token" value="${token}" />
            </div>

            <!-- Button Wrapper -->
            <div class="button-wrapper mb-3">
                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
            </div>
            <!-- End of Button Wrapper -->

        </form>

        <!-- Sign Up Link -->
        <div class="sign-up-wrapper">
            <p class="mb-0">
                Don't have an account?
                <a href="/register" method="post" class="text-primary font-weight-bold">Sign Up</a>.
            </p>
        </div>
        <!-- End of Sign Up Link -->

    </div>
    <!-- End of Card Body -->
</div>
<!-- End of Card: User Authentication -->

<script>
    function togglePasswordVisibility() {
        const passwordInput = document.getElementById('password');
        const toggleIcon = document.getElementById('togglePassword');
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = "password";
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }

    window.onload = function() {
        // Hide success message after 3 seconds
        setTimeout(function() {
            const successMessage = document.getElementById('successMessage');
            if (successMessage) {
                successMessage.style.display = 'none';
            }
        }, 4000);

        // Hide logged out message after 4 seconds
        setTimeout(function() {
            const loggedOutMessage = document.getElementById('loggedOutMessage');
            if (loggedOutMessage) {
                loggedOutMessage.style.display = 'none';
            }
        }, 4000);
    };
</script>

</body>

</html>
