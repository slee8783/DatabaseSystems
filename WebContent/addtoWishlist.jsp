<%@page import="java.sql.*" %>
<%@ page import="wish.WishDTO"%>
<%@ page import="wish.WishDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ticket Wishlist</title>
	</head>
	<body>	
		<%
			request.setCharacterEncoding("utf-8");
			int info_id = Integer.parseInt(request.getParameter("flight_num"));
			String user_id = (String) session.getAttribute("user_id");
			
			WishDAO wishDAO = new WishDAO();
			WishDTO wish = new WishDTO(user_id, info_id);
			int result = wishDAO.addToWishlist(wish);
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
			alert("<%=session.getAttribute("user_id")%>님이 <%=info_id%>번 티켓을 WishList에 추가하셨습니다");
			history.back();
		</script>
	</body>
</html>