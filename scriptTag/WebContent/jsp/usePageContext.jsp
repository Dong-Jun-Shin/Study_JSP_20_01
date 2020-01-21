<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>pageContext 기본 객체</title>
		
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
		<%
			HttpServletRequest httpRequest = (HttpServletRequest)pageContext.getRequest();
		%>
		<p>
			request 기본 객체와 pageContext.getRequest()의 동일 여부 : 
			<%= request == httpRequest %>
		</p>
		<p>
			pageContext.getOut() 메서드를 사용한 데이터 출력 : 
			<% pageContext.getOut().println("안녕하세요!"); %>
		</p>
		<% 
			application.setAttribute("page", pageContext);
		%>
	</body>
</html>
