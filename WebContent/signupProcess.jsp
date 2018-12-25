<%@page import="java.sql.*" %>
<%@ page import="Member.MemberDTO"%>
<%@ page import="Member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
<%
	request.setCharacterEncoding("utf-8");
	String user_id = null;
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
	
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());

	if (user_id == null || passwd == null || email == null || user_nm == null || age == 0 || gender == null || zipcode == null || address1 == null || address2 == null || phone == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = new MemberDTO(user_id, passwd, user_nm, reg_date, age, gender, email, zipcode, address1, address2, phone);
		int result = memberDAO.signup(member);
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			session.setAttribute("user_id", user_id);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'loginForm.jsp';");
			script.println("</script>");
			script.close();
		}
	} 
%>