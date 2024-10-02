<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>Register | YourBank</title>

    <style>
        html, body {
            height: 100%; /* Ensure the height is set */
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
        }

        .container {
            backdrop-filter: blur(10px); /* Optional: Adds a blur effect to background content */
        }

        .card {
            background-color: rgba(255, 255, 255, 0.95); /* Slightly less transparent for card */
            border-radius: 10px; /* Optional: Rounded corners for a more modern look */
        }
    </style>

    <script>
        function togglePasswordVisibility(inputId, iconId) {
            var passwordField = document.getElementById(inputId);
            var icon = document.getElementById(iconId);

            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                passwordField.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
    </script>
</head>

<body>

<div class="container">
    <div class="row justify-content-center align-items-center min-vh-100">
        <div class="col-lg-6 col-md-8">
            <div class="card registration-card shadow-lg">
                <div class="card-body p-5">
                    <!-- Form Header -->
                    <h2 class="text-center mb-4">Create an Account</h2>
                    <p class="text-center text-muted mb-5">Join us today! Please fill out the form to get started.</p>

                    <!-- Display Success Message -->
                    <c:if test="${requestScope.success != null}">
                        <div class="alert alert-success text-center">
                            <b>${requestScope.success}</b>
                        </div>
                    </c:if>

                    <!-- Check if the user has registered -->
                    <c:if test="${requestScope.isRegistered == null}">
                        <!-- Registration Form -->
                        <form:form action="/register" class="form" modelAttribute="registerUser">
                            <!-- First Name and Last Name -->
                            <div class="form-row mb-3">
                                <div class="col">
                                    <form:input type="text" path="first_name" class="form-control" placeholder="First Name" />
                                    <form:errors path="first_name" class="text-danger" />
                                </div>
                                <div class="col">
                                    <form:input type="text" path="last_name" class="form-control" placeholder="Last Name" />
                                    <form:errors path="last_name" class="text-danger" />
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="form-group mb-3">
                                <form:input path="email" name="email" class="form-control" placeholder="Email Address" />
                                <form:errors path="email" class="text-danger" />
                            </div>

                            <!-- Password and Confirm Password -->
                            <div class="form-row mb-4">
                                <div class="col position-relative">
                                    <form:input type="password" id="password" path="password" class="form-control" placeholder="Password" />
                                    <i class="fas fa-eye eye-icon" id="password-icon" onclick="togglePasswordVisibility('password', 'password-icon')"></i>
                                    <form:errors path="password" class="text-danger" />
                                </div>
                                <div class="col position-relative">
                                    <input type="password" id="confirm_password" name="confirm_password" class="form-control" placeholder="Confirm Password" />
                                    <i class="fas fa-eye eye-icon" id="confirm-password-icon" onclick="togglePasswordVisibility('confirm_password', 'confirm-password-icon')"></i>
                                    <small class="text-danger">${confirm_pass}</small>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="form-group mb-4">
                                <button class="btn btn-primary btn-block py-2">Create Account</button>
                            </div>

                            <!-- Already have an account -->
                            <p class="text-center text-muted">Already have an account? <a href="/index" class="text-primary">Sign In</a></p>
                        </form:form>
                    </c:if>
                </div>
            </div>

            <!-- Go Back Link -->
            <div class="text-center mt-4">
                <a href="/index" class="text-secondary"><i class="fa fa-arrow-alt-circle-left"></i> Back</a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
