<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Booking System</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="mycss/login_01.css">
	<link rel="stylesheet" type="text/css" href="mycss/footer_00.css">
	<link rel="stylesheet" type="text/css" href="mycss/navbar.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.js"></script>
	</head>
	<body id="LoginForm">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">BookingSystem</a>
            <button class="navbar-toggler" type="button" data-target="#navigation">
                <span class="navbar-toggler-icon"></span>
            </button>			
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="nav navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="main.jsp"> Home </a></li>
					<li class="nav-item"><a class="nav-link" href="reservation.jsp"> Reservation List </a></li>
					<li class="nav-item"><a class="nav-link" href="wishlist.jsp"> Wish List </a></li>
				</ul>		
			</div>
		</nav>
		<div class="container">
		<div class="login-form">
		<div class="main-div">
			<div class="panel">
			<h1>Login</h1>
			<p>Please enter your email and password</p>
			</div>
		<form id ="login" action="loginProcess.jsp" method="post">
			<div class="form-group">
				<input type="text" class="form-control" id="inputID" name="user_id" placeholder="ID">
			</div>
			<div class="form-group">
				<input type="password" id="inputPassword" class="form-control" name="passwd" placeholder="Password">
			</div>
			<input type="submit" class="form-control" name="login" value="Login" class="btn btn-primary">
			<input type="button" class="form-control" name="signup" value="Signup" onclick="location.href='signupForm.jsp'">
		</form>
		</div>
		</div>
		</div>
	   	<footer id ="footer" class="bg-dark text-center">

      		<p>Copyright ⓒ 2018 Siwon Lee All Rights Reserved.</p>

    	</footer>
	</body>
</html>