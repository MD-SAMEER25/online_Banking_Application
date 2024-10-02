<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <style>
        *{
            box-sizing: border-box;
            font-family:comfortaa ;
        }
        body{
            height: 100vh;
            background-image: url("../images/main_bg.png");
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
        }
        .card{
            box-shadow: 0px 3px 6px rgba(0, 14, 53,0.3);
        }
        .card .card text{
            font: size 16px; ;
        }
    </style>
    <title>Error</title>
</head>
<body class ="d-flex align-items-center justify-content-center">

<!-- card error card -->
<div class="card col-4 alert alert-danger border border-danger text-danger shadow-lg">
    <h3 class="card-title">
        <i class="fa fa-window-close me-2"></i>Error:
        <hr>
        <!-- card body-->
        <div class="card-body">
            <p class="card-text">
                <!-- Display Message -->
                <c:if test="${requestScope.error != null}">
            <div class="alert alert-danger text-center border border-danger">
                <b>${requestScope.error}</b>
            </div>
            </c:if>
            <!-- End Of Display Message -->

            </p>
            <hr>
            <!-- go back-->
            <a href="/index" class="btn btn-sm btn-danger">
                <i class="fa fa-arrow-alt-circle-left me-1"></i>back
                <!-- end of go back-->
            </a>
        </div>
        <!-- card body-->
    </h3>
</div>
<!-- end of card error card -->

</body>
</html>