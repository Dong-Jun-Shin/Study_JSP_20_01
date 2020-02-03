<%@page import="com.student.StudentDAO"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<% 
	String s_num = request.getParameter("s_num");
	String num = null;
	Calendar calendar = Calendar.getInstance();
	String year = String.valueOf(calendar.get(Calendar.YEAR)).substring(2);
	
	StudentDAO sdao = StudentDAO.getInstance();
	String number = sdao.getStudentCount(s_num);
	
	out.print(year + s_num + number);
%>
