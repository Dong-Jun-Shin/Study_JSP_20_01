<%@page import="util.Cookies"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Insert title here</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#btnLogout").click(function(){
					location.href = "logout.jsp";
				});
				
				$("#btnLoginCheck").click(function(){
					location.href="loginCheck.jsp";
				});
			})
		</script>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			if(id.equals(pw)){
				// ID와 암호가 같으면 로그인에 성공한 것으로 판단.
				response.addCookie(Cookies.createCookie("AUTH", id, "/", -1));
				
		%>	
			<h3>로그인에 성공하였습니다.</h3>
			<button type="button" id="btnLogout">로그아웃</button></a>
			<button type="button" id="btnLoginCheck">로그인 체크</button></a>
		<%}else{%>
			<script type="text/javascript">
				alert("로그인에 실패하였습니다.");
				history.go(-1);
			</script>
		<%} %>
		
	</body>
</html>
