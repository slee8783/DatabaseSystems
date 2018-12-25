<%@page import="java.sql.*" %>
<%@ page import="rsvp.RsvpDTO"%>
<%@ page import="rsvp.RsvpDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Added to Reservation List</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			int info_id = Integer.parseInt(request.getParameter("information_id"));
			String user_id = (String) session.getAttribute("user_id");
			String rsvp_status = "Waiting for Payment";
			Timestamp rsvp_date = new Timestamp(System.currentTimeMillis());
			
			RsvpDAO rsvpDAO = new RsvpDAO();
			RsvpDTO rsvp = new RsvpDTO(user_id, info_id, rsvp_date, rsvp_status);
			int result = rsvpDAO.addToRsvplist(rsvp);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('error');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			} 
		%>
		<script>
			alert("<%=session.getAttribute("user_id")%>님이 <%=info_id%>번 티켓을 ReservationList에 추가하셨습니다");
			history.back();
		</script>		
	</body>
</html>