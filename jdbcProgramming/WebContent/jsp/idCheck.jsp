<%@page import="com.student.StudentDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
	String sd_id = request.getParameter("sd_id");

	StudentDAO sdao = StudentDAO.getInstance();
	int result = sdao.idCheck(sd_id);
	out.print(result);
%>
