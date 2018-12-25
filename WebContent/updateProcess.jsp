<%@page import="java.sql.*" %>
<%@ page import="Member.MemberDTO"%>
<%@ page import="Member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="loginCheck.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String passwd = null;
	String user_nm = null;
	int age = 0;
	String gender = null;
	String email = null;
	String zipcode = null;
	String address1 = null;
	String address2 = null;
	String phone = null;
	
	if(request.getParameter("user_id") != null) {
		user_id = (String) request.getParameter("user_id");
	}
	if(request.getParameter("passwd") != null) {
		passwd = (String) request.getParameter("passwd");
	}
	if(request.getParameter("user_nm") != null) {
		user_nm = (String) request.getParameter("user_nm");
	}
	if(request.getParameter("age") != null) {
		age = Integer.parseInt(request.getParameter("age"));
	}
	if(request.getParameter("gender") != null) {
		gender = (String) request.getParameter("gender");
	}
	if(request.getParameter("email") != null) {
		email = (String) request.getParameter("email");
	}
	if(request.getParameter("zipcode") != null) {
		zipcode = (String) request.getParameter("zipcode");
	}
	if(request.getParameter("address1") != null) {
		address1 = (String) request.getParameter("address1");
	}
	if(request.getParameter("address2") != null) {
		address2 = (String) request.getParameter("address2");
	}
	if(request.getParameter("phone") != null) {
		phone = (String) request.getParameter("phone");
	}
	
	
	if (user_id == null || passwd == null || email == null || user_nm == null || age == 0 || gender == null || zipcode == null || address1 == null || address2 == null || phone == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = new MemberDTO(user_id, passwd, user_nm, age, gender, email, zipcode, address1, address2, phone);
		int result = memberDAO.update(member);
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성공');");
			script.println("location.href = 'main.jsp';");
			script.println("</script>");
			script.close();
		}
	} 
%>