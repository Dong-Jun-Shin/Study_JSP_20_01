<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>JSTL Core Tag: if</title>
		
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
		<h3>JSTL Core Tag</h3>
		
		<c:set var="num" value="95" />
		점수 : ${num }은
		
		<%-- JSTL의 if문 --%>
		<%-- 예제1 --%>
		<c:if test="${num > 60 }">
			합격입니다.
		</c:if>
		<hr />
		안녕하세요.
		<c:set var="today" value="<%= new java.util.Date() %>" />
		
		<%-- 예제2 --%>
		<c:if test="${today.hours > 17 }" var="bool">
			저녁 식사는 하셨는지요?<br />
		</c:if>
		
		<p>\${today.hours} = ${today.hours }</p>
		\${bool } = ${bool }
	</body>
</html>
