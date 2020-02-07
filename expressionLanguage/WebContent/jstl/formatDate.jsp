<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>formatDate</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<h4>formatDate 태그에서 type 속성 확인</h4>
		<p>
			<c:set var="now" value="<%= new java.util.Date() %>" />
			<!-- 날짜 -->
			<fmt:formatDate type="date" value="${now }" /><br />
			<!-- 시간 -->
			<fmt:formatDate type="time" value="${now }" /><br />
			<!-- 날짜와 시간-->
			<fmt:formatDate type="both" value="${now }" />
		</p>
		
		<h4>formatDate 태그에서 dateStyle, timeStyle 속성 확인</h4>
		<p>
			<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${now }" /><br />
			<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${now }" /><br />
			<fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${now }" /><br />
		</p>
		
		<h4>formatDate 태그에서 pattern 속성 확인</h4>
		<p>
			<fmt:formatDate pattern="yyyy-MM-dd" value="${now }" /><br />
		</p>
		
		<h4>parseDate 태그에서 문자열을 날짜형으로 파싱</h4>
		<p>
			<fmt:parseDate value="2020-01-01 09:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="date" />
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${date }" /><br />
			<fmt:formatDate type="date" value="${date }" />
			<fmt:formatDate type="time" value="${date }" />
		</p>
	</body>
</html>
