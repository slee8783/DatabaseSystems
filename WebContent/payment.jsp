<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Process of Payment</title>
	</head>
	<body>
		<% 
			String user_id = (String) session.getAttribute("user_id");
		
			if(user_id == null){
				response.sendRedirect("loginForm.jsp");
				return;
			}
		%>	
		<%
			request.setCharacterEncoding("utf-8");
			String rsvp_id = request.getParameter("information_id");
			String rsvp_status = "Completed";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int miles_total = 0;
			int miles_remain = 0;
			
			Class.forName("com.mysql.jdbc.Driver");	
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SiwonLee?characterEncoding=UTF-8&serverTimezone=UTC", "root", "dltldnjs1234");
			
			String sql ="UPDATE reservation_info SET rsvp_status=? WHERE rsvp_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rsvp_status);
			pstmt.setString(2, rsvp_id);
			
			pstmt.executeUpdate();
			
			String select = "SELECT miles_total, miles_remain FROM mileage_info "
						+"WHERE " 
						+"user_id =? and "
						+"miles_id = (select max(miles_id) from mileage_info where user_id = ?)";
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				miles_total = rs.getInt(1) + 100;
				miles_remain = rs.getInt(2) + 100;
			}
			
			String insert = "INSERT INTO mileage_info(miles_total, miles_remain, user_id) VALUES(?, ?, ?)";
			pstmt = conn.prepareStatement(insert);
			pstmt.setInt(1, miles_total);
			pstmt.setInt(2, miles_remain);
			pstmt.setString(3, user_id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			rs.close();
			conn.close();
		%>
		<script>
			alert("<%=session.getAttribute("user_id")%>님이 <%=rsvp_id%>번 티켓을 구매하셨습니다");
			history.back();
		</script>
	</body>
</html>