<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Insert title here</title>
		
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
		<h2>JSTL Core Tag: remove</h2>
		<c:set var="str" value="Hello set Tag!!!" scope="session" />
		\${str } = ${str } <br />
		\${sessionScope.str } = ${sessionScope.str } <br />
		
		<c:remove var="str" scope="page" />
		\${str } = ${str } <br />
		
		<c:remove var="str" scope="session" />
		\${str } = ${str } <br />
		
		<c:set var="app" value="응용프로그램 변수" scope="application" />
		\${app } = ${app } <br />
		
		<c:remove var="app" />
		\${app } = ${app }
	</body>
</html>
