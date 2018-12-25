<%@page import="Member.MemberDTO"%>
<%@page import="Member.MemberDAO"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<title>Member List</title>
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
			if(user_id == null || !user_id.equals("admin")){
				response.sendRedirect("main.jsp");
				return;
			}
		%>
		<div id="info">
		<h2>MemberList</h2>
		<hr>
		<%
	
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
	
		memberList = new MemberDAO().getMemberList();
	
		if(memberList != null)
		%>
		<table class="table">
		<tr>
			<th>ID</th><th>PASSWORD</th><th>NAME</th><th>REGISTRATION DATE</th><th>AGE</th><th>GENDER</th><th>EMAIL</th>
			<th>ZIPCODE</th><th>ADDRESS</th><th>PHONE</th>
		</tr>
		<%
		for(int i = 0; i < memberList.size(); i++) {
			MemberDTO member = memberList.get(i);
		%>
			<tr>
				<td><%=member.getUser_id()%></td>
				<td><%=member.getPasswd()%></td>
				<td><%=member.getUser_nm()%></td>
				<td><%=member.getReg_date()%></td>
				<td><%=member.getAge()%></td>
				<td><%=member.getGender()%></td>
				<td><%=member.getEmail()%></td>
				<td><%=member.getZipcode()%></td>
				<td><%=member.getAddress1()%></td>
				<td><%=member.getPhone()%></td>
			</tr>
		<%
		}
		%>
		</table>
		<h3><a href="main.jsp">MAIN</a></h3>
		</div>

	   	<footer id="footer" class="bg-dark text-center">

      		<p>Copyright ⓒ 2018 Siwon Lee All Rights Reserved.</p>

    	</footer>
	</body>
</html>