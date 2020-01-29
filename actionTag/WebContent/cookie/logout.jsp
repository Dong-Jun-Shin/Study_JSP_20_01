<%@page import="util.Cookies"%>
<%@page import="com.sun.corba.se.spi.activation.Repository"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
%>
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
			$(function(){
				$("#btnLoginForm").click(function(){
					location.href = "loginForm.jsp";
				});
				
				$("#btnLoginCheck").click(function(){
					location.href = "loginCheck.jsp";
				});
			});
		</script>
	</head>
	<body>
		<div>로그아웃하였습니다.</div>
		<button type="button" id="btnLoginForm">로그인</button>
		<button type="button" id="btnLoginCheck">로그인 체크</button>
	</body>
</html>
