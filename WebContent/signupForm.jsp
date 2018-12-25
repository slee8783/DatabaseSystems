<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Signup</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="mycss/footer_00.css">
	<link rel="stylesheet" type="text/css" href="mycss/navbar.css">
	<link rel="stylesheet" type="text/css" href="mycss/body.css">
	<link rel="stylesheet" href="css/custom.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.js"></script>
	</head>
	<body id="page">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="main.jsp">BookingSystem</a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="nav navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="main.jsp"> Home </a></li>
					<li class="nav-item"><a class="nav-link" href="reservation.jsp"> Reservation List </a></li>
					<li class="nav-item"><a class="nav-link" href="wishlist.jsp"> Wish List </a></li>
				</ul>		
			</div>
		</nav>
		<div id="info">
		<h2>Sign Up</h2>
		<hr>
		<form action="signupProcess.jsp" method="post">
			<div class="form-group">
				<label>ID</label> 
				<input type="text" name="user_id" class="form-control">
			</div>
			<div class="form-group">
				<label>PASSWORD</label>
				<input type="text" name="passwd" class="form-control">
			</div>
			<div class="form-group">
				<label>NAME</label> 
				<input type="text" name="user_nm" class="form-control">
			</div>
			<div class="form-group">
				<label>AGE</label>
				<input type="number" name="age" min="1" max="130" class="form-control">
			</div>
			<div class="form-group">
				<label>GENDER</label>
				<input type="radio" name="gender" value="male">MALE
				<input type="radio" name="gender" value="female">FEMALE
			</div>
			<div class="form-group">
				<label>EMAIL</label>
				<input type="text" name="email" class="form-control">
			</div>
			<div class="form-group">
				<label>ZIPCODE</label>
				<input type="text" name="zipcode" class="form-control">
			</div>
			<div class="form-group">
				<label>ADDRESS1</label> 
				<input type="text" name="address1" class="form-control">
			</div>
			<div class="form-group">
				<label>ADDRESS2</label>
				<input type="text" name="address2" class="form-control">
			</div>
			<div class="form-group">
				<label>PHONE</label>
				<input type="text" name="phone" class="form-control">
			</div>
			<input type="submit" value="Signup" class="btn btn-primary">
			<input type="button" name="signup" value="Login" onclick="location.href='loginForm.jsp'" class="btn btn-primary">
		</form>
		</div>
	   	<footer id="footer" class="bg-dark text-center">

      		<p>Copyright ⓒ 2018 Siwon Lee All Rights Reserved.</p>

    	</footer>
	</body>
</html>