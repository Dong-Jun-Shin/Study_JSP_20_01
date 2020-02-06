<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>JSTL Core: choose</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->

		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<h3>JSTL Core Tag: choose</h3>

<%-- 		<c:set var="today" value="<%= new java.util.Date() %>" /> --%>
		<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
		<c:choose>
			<%-- today의 메서드 호출 --%>
			<c:when test="${today.hours < 12 }" >
				Good morning!
			</c:when>
			<c:when test="${today.hours < 18 }" >
				Good afternoon!
			</c:when>
			<c:otherwise>
				Good evening!
			</c:otherwise>
		</c:choose>
		<hr />
		<c:set var="jumsu" value="${param.jumsu }" />
<%-- 		점수 : ${jumsu } / 학점 :  --%>
		점수 : <c:out value="${jumsu }" default="0" /> / 학점 : 
		<c:choose>
			<c:when test="${jumsu >= 90}" >
				A
			</c:when>
			<c:when test="${jumsu >= 80}" >
				B
			</c:when>
			<c:when test="${jumsu >= 70}" >
				C
			</c:when>
			<c:when test="${jumsu >= 60}" >
				D
			</c:when>
			<c:when test="${jumsu < 60}" >
				F
			</c:when>
			<c:otherwise>
				-
			</c:otherwise>
		</c:choose>
		 학점.
	</body>
</html>
