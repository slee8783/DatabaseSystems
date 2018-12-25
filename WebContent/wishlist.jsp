<%@page import="ticket.TicketDTO"%>
<%@page import="ticket.TicketDAO"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>wishlist</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="mycss/footer_00.css">
		<link rel="stylesheet" type="text/css" href="mycss/navbar.css">
		<link rel="stylesheet" type="text/css" href="mycss/body.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.bundle.js"></script>
		<script type="text/javascript">
		
		function buyFlight(index)
		{
			alert("2018년 12월 31일까지 결제 완료해주시기 바랍니다.");
			
			document.getElementById('information_id').value = document.getElementById('info_'+index).childNodes[0].nodeValue;
			document.forms[0].submit();
		}
		
		
		</script>	
		<title>WishList</title>
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
		<div id="info">
		<h2>Wish List</h2>
		<%
			ArrayList<TicketDTO> ticketList = new ArrayList<TicketDTO>();
		
			ticketList = new TicketDAO().getWishList(user_id);
			if(ticketList != null)
			{
		%>
		<form action="addToReservation.jsp">
			<input type="hidden" id="information_id" name="information_id"></input>
			<table class="table">
			<tr>
				<th>User</th><th>No.</th><th>FLIGHT NO.</th><th>AIRLINE</th><th>DEPART DATE</th><th>ARRIVAL DATE</th><th>FLIGHT HOURS</th><th>PRICE</th><th>STOPOVER</th>
				<th>DEPARTURE</th><th>DESTINATION</th>
			</tr>
				<%
					for(int i = 0; i < ticketList.size(); i++){
						TicketDTO ticket = ticketList.get(i);
				%>
					<tr>
						<td><%=user_id%></td>
						<td id='info_<%=i%>'><%=ticket.getInfo_id()%></td>
						<td><%=ticket.getFlight_no()%></td>
						<td><%=ticket.getAirline_nm()%></td>
						<td><%=ticket.getDepart_date()%></td>
						<td><%=ticket.getArrival_date()%></td>
						<td><%=ticket.getFlight_hr()%></td>
						<td><%=ticket.getPrice()%></td>
						<td><%=ticket.getStopover_cnt()%></td>
						<td><%=ticket.getDeparture()%></td>
						<td><%=ticket.getDestination()%></td>
						<td><input type="button" value="Buy" onclick="buyFlight(<%=i%>);" class="btn btn-primary"></td>
					</tr>
				<%
				}
			}
			%>
			</table>
		</form>
		</div>
	   	<footer id="footer" class="bg-dark text-center">

      		<p>Copyright ⓒ 2018 Siwon Lee All Rights Reserved.</p>

    	</footer>
	</body>
</html>