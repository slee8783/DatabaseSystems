<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Booking System</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="mycss/footer_00.css">
	<link rel="stylesheet" type="text/css" href="mycss/navbar.css">
    <link rel="stylesheet" type="text/css" href="mycss/body.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.js"></script>
	<script type="text/javascript">
	
	function showDiv( id, id1, id2, id3 ) { 
	    document.all.departure.style.visibility = "hidden"; 
	    document.all.destination.style.visibility = "hidden";
	    document.all.depart_date.style.visibility = "hidden";
	    document.all.return_date.style.visibility = "hidden";
	    document.all.departure.value = ''; 
	    document.all.destination.value = '';
	    document.all.depart_date.value = '';
	    document.all.return_date.value = '';
	    document.all[id].style.visibility = "visible"; 
	    document.all[id1].style.visibility = "visible"; 
	    document.all[id2].style.visibility = "visible"; 
	    document.all[id3].style.visibility = "visible"; 
	    document.all[id].focus();
	}
	
	</script>
	</head>
	<body id="page">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<%
					String user_id = (String) session.getAttribute("user_id");
					
					if(user_id==null){
						response.sendRedirect("loginForm.jsp");
						return;
					}
				%>
	
				<a class="navbar-brand" href="#">BookingSystem</a>
	            <button class="navbar-toggler" type="button" data-target="#navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="nav navbar-nav">
						<li class="nav-item active"><a class="nav-link" href="main.jsp"> Home </a></li>
						<li class="nav-item"><a class="nav-link" href="reservation.jsp"> Reservation List </a></li>
						<li class="nav-item"><a class="nav-link" href="wishlist.jsp"> Wish List </a></li>
						<%
						if(user_id.equals("admin")){
							%>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#"  id="navbarDropdownMenuLink" 
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Flight Info</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="flightInsert.jsp">Add Flight</a>
									<a class="dropdown-item" href="flightSearch.jsp">Update Flight</a>
								</div>
							</li>
							<%
						}
						%>
					</ul>		
				</div>
				<div class="nav navbar-nav navbar-right">			
					<div class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<%=user_id %> 님이 로그인하셨습니다.
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="memberInfo.jsp">회원정보 조회</a></li>
							<li><a href="update.jsp">회원정보 수정</a></li>
							<li><a href="delete.jsp">회원 탈퇴</a></li>
							<li><a href="logout.jsp">로그아웃</a></li>
							<li class="divider"></li>
							<%
							if (user_id.equals("admin")){
								%>
								<li><a href="memberList.jsp">전체회원 목록</a></li>
								<%
							}
							%>
						</ul>
					</div>
				</div>
		</nav>
		<div id="page_container" class="container">
			<form action="ticketSearch.jsp" method="post">
				<p>
				TICKET TYPE: <input id="btn_radio" type="radio" name="travel_type" value="return" onclick="showDiv('departure','destination', 'depart_date', 'return_date')" checked>Round Trip
				<input id="btn_radio" type="radio" name="travel_type"  value="one_way" onclick="showDiv('departure', 'destination', 'depart_date')">One Way
				</p>
				<br>
				<input type="text" class="form-control" name="departure" placeholder="FROM"><br>
				<input type="text" class="form-control" name="destination" placeholder="TO"><br>
				<input type="text" class="form-control" name="depart_date" placeholder="DEPART"><br>
				<input type="text" class="form-control" name="return_date" placeholder="RETURN"><br>
				<br>
				<input type="submit" value="Search" class="btn btn-primary">
			</form>
		</div>
	   	<footer id="footer" class="bg-dark text-center">

      		<p>Copyright ⓒ 2018 Siwon Lee All Rights Reserved.</p>

    	</footer>
	</body>
</html>