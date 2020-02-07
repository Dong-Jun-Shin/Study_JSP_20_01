<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>JSTL Core: set target</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<h2>JSTL Core Tag: set target</h2>
		
		<%-- Map을 이용한 설정과 접근 --%>
		<c:set var="book" value="<%= new java.util.HashMap<String, String>() %>" />
		
		<c:set target="${book }" property="java" value="자바로 배우는 프로그래밍 기초" />
		<c:set target="${book }" property="c" value="C로 배우는 프로그래밍 기초" />
		<c:set target="${book }" property="jsp" value="JSP로 배우는 프로그래밍 기초" />
		
		<p>\${book.java } = ${book.java }</p>
		<p>\${book.c } = ${book.c }</p>
		<p>\${book.jsp } = ${book.jsp }</p>
		
		<%-- 자바빈을 이용한 설정과 접근 --%>
		<jsp:useBean id="oneday" class="java.util.Date" />
		<c:set target="${oneday }" property="year" value="2019" />
		<p>\${oneday.year } =  ${oneday.year }</p>
		
		
		<%--
			member.User member = new member.User();
			member.setUname("홍길동");
			out.print(member.getUname());
		--%>
		<jsp:useBean id="member" class="member.User" />
		<c:set target="${member }" property="uname" value="홍길동" />
		<p>\${member.uname } =  ${member.uname }</p>
	</body>
</html>
