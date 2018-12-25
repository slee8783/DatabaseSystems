<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Flight Information</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="mycss/footer_00.css">
	<link rel="stylesheet" type="text/css" href="mycss/navbar.css">
	<link rel="stylesheet" type="text/css" href="mycss/body.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script>
        $(document).ready(function(){
                $.get("/DatabaseSystems/AirlineListServlet", function(responseJson) {
                    var $select = $("#dropdownlist");
                    $select.find("option").remove();  
                    $.each(responseJson, function(index, category) {
                        $("<option>").val(category.airline_id).text(category.airline_nm).appendTo($select);
                    });                   
                     
                });
            });
        </script>
        <script type="text/javascript">
	        function changeHiddenInput(objDropDown) {
	            var DTobjid=objDropDown.options[objDropDown.selectedIndex].value;   
	            document.getElementById('selectedval').value=DTobjid;
	            document.forms[0].submit();
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
		<div id="info">
		<h2>Put the Flight Info.</h2>
		<hr>   
		<form action="flightInsertPro.jsp" method="post">
		<input type="hidden" name="selectedval" id="selectedval">
			<div class="form-group">
				<label>FLIGHT_NO</label>
				<input type="text" name="flight_no" class="form-control">
			</div>
			<div class="form-group">
				<label>AIRLINE</label> 
			    <select id="dropdownlist" name="airline_nm" class="form-control"></select>
			</div>
			<div class="form-group">
				<label>FLIGHT HOURS</label>
				<input type="text" name="flight_hr" class="form-control">
			</div>
			<div class="form-group">
				<label>DEPART DATE</label>
				<input type="datetime-local" name="depart_date" class="form-control">
			</div>
			<div class="form-group">
				<label>ARRIVAL DATE</label> 
				<input type="datetime-local" name="arrival_date" class="form-control">
			</div>
			<div class="form-group">
				<label>PRICE</label> 
				<input type="number" name="price" class="form-control">
			</div>
			<div class="form-group">
				<label>STOPOVER NO.</label> 
				<input type="number" name="stopover_cnt" class="form-control">
			</div>
			<div class="form-group">
				<label>DEPARTURE</label> 
				<input type="text" name="departure" class="form-control">
			</div>
			<div class="form-group">
				<label>DESTINATION</label> 
				<input type="text" name="destination" class="form-control">
			</div>
			<input type="button" onclick="changeHiddenInput(airline_nm)" value="Insert" class="btn btn-primary">
			<input type="button" name="goBack" value="Back"
			onclick="location.href='main.jsp'" class="btn btn-primary">
		</form>
		</div>
	   	<footer id="footer" class="bg-dark text-center">

      		<p>Copyright ⓒ 2018 Siwon Lee All Rights Reserved.</p>

    	</footer>		
	</body>
</html>