<%@page import="java.sql.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="loginCheck.jspf" %>
<%
	String passwd = request.getParameter("passwd");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SiwonLee?characterEncoding=UTF-8&serverTimezone=UTC", "root", "dltldnjs1234");
	String sql = "SELECT passwd FROM member WHERE user_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, user_id);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(passwd.equals(rs.getString("passwd"))){
			pstmt.close();
			pstmt = null;
			sql = "DELETE FROM member WHERE user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			pstmt.executeUpdate();
			
			session.invalidate();
			%>
			<script>
				alert('탈퇴 완료');
				location.href = 'loginForm.jsp';
			</script>
			<%
		} else{
			%>
			<script>
				alert('패스워드 틀림');
				history.back();
			</script>
			<%
		}
	}
%>