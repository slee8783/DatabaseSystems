<%@page import="detail.DetailedDAO"%>
<%@page import="detail.DetailedDTO"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="mycss/footer.css">
	<link rel="stylesheet" type="text/css" href="mycss/navbar.css">
	<link rel="stylesheet" type="text/css" href="mycss/body.css">	
	<link rel="stylesheet" type="text/css" href="mycss/info.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.js"></script>
	<title>Member Information</title>
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
							<%=user_id%> 님이 로그인하셨습니다.
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
		<%
			request.setCharacterEncoding("utf-8");
			int rsvp_id = Integer.parseInt(request.getParameter("id"));
			
			ArrayList<DetailedDTO> detailedList = new ArrayList<DetailedDTO>();
				
			detailedList = new DetailedDAO().getDetailedInfo(rsvp_id);
				
			if(detailedList != null && detailedList.size() > 0){
				DetailedDTO info = detailedList.get(0);
		%>
		<div id="info">
			<h2>Flight Information</h2>
			<hr>
			<h5>
			Flight No.: <%=info.getFlight_no()%><br>
			Model Name: <%=info.getModel_nm()%><br>
			Total Seat: <%=info.getTotal_seat()%><br>
			Airline: <%=info.getAirline_nm()%><br>
			Flight Hours: <%=info.getFlight_hr()%><br>
			Depart Date: <%=info.getDepart_date()%><br>
			Arrival Date: <%=info.getArrival_date()%><br>
			Price: <%=info.getPrice()%><br>
			Stopover Count: <%=info.getStopover_cnt()%><br>
			Departure: <%=info.getDeparture()%><br>
			Destination: <%=info.getDestination() %><br>
			<br>
			<%
			}
			%>
			</h5>
		</div>
	   	<footer id="footer" class="bg-dark text-center">

      		<p>Copyright ⓒ 2018 Siwon Lee All Rights Reserved.</p>

    	</footer>
	</body>
</html>