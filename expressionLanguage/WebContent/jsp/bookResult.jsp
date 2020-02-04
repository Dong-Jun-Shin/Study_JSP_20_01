<%@page import="book.Book"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- post방식을 위한 인코딩 방식 설정 --%>
<% request.setCharacterEncoding("UTF-8"); %>	
<%--
		<!-- 클래스 생성과 필드값 설정 -->
		Book book = new Book();
		book.setTitle(request.getParameter("title"));
		book.setAuthor(request.getParameter("author"));
		book.setPublisher(request.getParameter("publisher"));

		<!-- javaBean의 scope를 이용해서 객체 자체를 속성으로 설정 가능 -->
		request.setAttribute("title", book.getTitle());
		request.setAttribute("author", book.getAuthor());
		request.setAttribute("publisher", book.getPublisher());
 --%>

<!-- useBean은 사용하는 클래스의 기본 생성자와 설정자, 접근자가 필수이다. -->
<jsp:useBean id="book" class="book.Book" scope="request"/>
<jsp:setProperty property="*" name="book" />
<jsp:forward page="bookOutput.jsp" />
