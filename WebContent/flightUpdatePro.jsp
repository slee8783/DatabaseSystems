<%@page import="java.sql.*" %>
<%@ page import="Flight.FlightDTO"%>
<%@ page import="Flight.FlightDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="loginCheck.jspf" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String flight_no = null;
	String flight_hr = null;
	String depart_date = null;
	String arrival_date = null;
	int price = 0;
	int stopover_cnt = 0;
	String departure = null;
	String destination = null;
	int airline_id = 0;
	int info_id = 0;
	
	if(request.getParameter("flight_no") != null) {
		flight_no = (String) request.getParameter("flight_no");
	}
	if(request.getParameter("selectedval") != null) {
		airline_id = Integer.parseInt(request.getParameter("selectedval"));
	}
	if(request.getParameter("flight_hr") != null) {
		flight_hr = (String) request.getParameter("flight_hr");
	}
	if(request.getParameter("depart_date") != null) {
		depart_date = (String) request.getParameter("depart_date");
	}
	if(request.getParameter("arrival_date") != null) {
		arrival_date = (String) request.getParameter("arrival_date");
	}
	if(request.getParameter("price") != null) {
		price = Integer.parseInt(request.getParameter("price"));
	}
	if(request.getParameter("stopover_cnt") != null) {
		stopover_cnt = Integer.parseInt(request.getParameter("stopover_cnt"));
	}
	if(request.getParameter("departure") != null) {
		departure = (String) request.getParameter("departure");
	}
	if(request.getParameter("destination") != null) {
		destination = (String) request.getParameter("destination");
	}
	if(request.getParameter("info_id") != null) {
		info_id = Integer.parseInt(request.getParameter("info_id"));
	}

	if (flight_no == null || flight_hr == null || depart_date == null || arrival_date == null || departure == null || destination == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		FlightDAO flightDAO = new FlightDAO();
		FlightDTO flight = new FlightDTO(info_id, flight_no, airline_id, flight_hr, depart_date, arrival_date, price, stopover_cnt, departure, destination);
		flightDAO.update(flight);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정 성공');");
		script.println("location.href ='main.jsp';");
		script.println("</script>");
		script.close();
	}
%>