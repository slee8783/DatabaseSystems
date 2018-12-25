<%@page import="Flight.FlightDTO"%>
<%@page import="Flight.FlightDAO"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.util.ArrayList" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="mycss/footer_00.css">
		<link rel="stylesheet" type="text/css" href="mycss/navbar.css">
		<link rel="stylesheet" type="text/css" href="mycss/body.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.bundle.js"></script>
		<script type="text/javascript">
		
		function addFlight(index, type)
		{
			if(type === 0)
			{
				alert(document.getElementById('d_info_'+index).childNodes[0].nodeValue);
				document.getElementById('flight_num').value = document.getElementById('d_info_'+index).childNodes[0].nodeValue;
			}
			else
			{
				alert(document.getElementById('a_info_'+index).childNodes[0].nodeValue);
				document.getElementById('flight_num').value = document.getElementById('a_info_'+index).childNodes[0].nodeValue;
			}
			
			document.forms[0].submit();
		}
		
		
		</script>
		<title>Find Ticket</title>
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
		
		<%
			request.setCharacterEncoding("utf-8");
			String departure = request.getParameter("departure");
			String destination = request.getParameter("destination");
			String depart_date = request.getParameter("depart_date");		 
			
			ArrayList<FlightDTO> flightList = new ArrayList<FlightDTO>();
			
			flightList = new FlightDAO().getDepartureList_new(departure, destination, depart_date);
				
			if(flightList != null)
			{
		%>
		<div id="info">
		<h2>Departures</h2>
		<form action="addtoWishlist.jsp">
			<input type="hidden" id="flight_num" name="flight_num"></input>
			<table class="table">
			<tr>
				<th>No.</th><th>FLIGHT NO.</th><th>AIRLINE</th><th>DEPART DATE</th><th>ARRIVAL DATE</th><th>FLIGHT HOURS</th><th>PRICE</th><th>STOPOVER</th>
				<th>DEPARTURE</th><th>DESTINATION</th>
			</tr>
			<%
				for(int i = 0; i < flightList.size(); i++) {
					FlightDTO flight = flightList.get(i);
			%>
					<tr>
						<td id='d_info_<%=i%>'><%=flight.getInfo_id()%></td>
						<td><%=flight.getFlight_no()%></td>
						<td><%=flight.getAirline_nm()%></td>
						<td><%=flight.getDepart_date()%></td>
						<td><%=flight.getArrival_date()%></td>
						<td><%=flight.getFlight_hr()%></td>
						<td><%=flight.getPrice()%></td>
						<td><%=flight.getStopover_cnt()%></td>
						<td><%=flight.getDeparture()%></td>
						<td><%=flight.getDestination()%></td>
						<td><input type="button" value="Add" onclick="addFlight(<%=i%>, 0);" class="btn btn-primary"></td>
					</tr>
				<%
				}
			}%>
			</table>
		</form>
		<%
			request.setCharacterEncoding("utf-8");
			String return_date = request.getParameter("return_date");		 
			
			flightList = new FlightDAO().getDepartureList_new(destination, departure, return_date);
				
			if(flightList != null)
		%>
		<h2>Arrivals</h2>
		<form action="addtoWishlist.jsp">
			<input type="hidden" id="flight_num" name="flight_num"></input>
			<table class="table">
			<tr>
				<th>No.</th><th>FLIGHT NO.</th><th>AIRLINE</th><th>DEPART DATE</th><th>ARRIVAL DATE</th><th>FLIGHT HOURS</th><th>PRICE</th><th>STOPOVER</th>
				<th>DEPARTURE</th><th>DESTINATION</th>
			</tr>
				<%
				for(int i = 0; i < flightList.size(); i++) {
					FlightDTO flight = flightList.get(i);
			%>
					<tr>
						<td id='a_info_<%=i%>'><%=flight.getInfo_id()%></td>
						<td><%=flight.getFlight_no()%></td>
						<td><%=flight.getAirline_nm()%></td>
						<td><%=flight.getDepart_date()%></td>
						<td><%=flight.getArrival_date()%></td>
						<td><%=flight.getFlight_hr()%></td>
						<td><%=flight.getPrice()%></td>
						<td><%=flight.getStopover_cnt()%></td>
						<td><%=flight.getDeparture()%></td>
						<td><%=flight.getDestination()%></td>
						<td><input type="button" value="Add" onclick="addFlight(<%=i%>, 1);" class="btn btn-primary"></td>
					</tr>
				<%
				}
			%>
			</table>
		</form>
		<h3><a href="main.jsp">NEXT</a></h3>
		</div>
	   	<footer id="footer" class="bg-dark text-center">

      		<p>Copyright ⓒ 2018 Siwon Lee All Rights Reserved.</p>

    	</footer>
	</body>
</html>