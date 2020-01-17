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
		<%--
			get방식은 server.xml에서 설정해서, 이미 적용되어 있음.
			post방식은 설정이 안 되어 있어서, .setCharacterEncoding() 필요  		
			<% request.setCharacterEncoding("UTF-8"); %> 
		--%>
		<h2> 메소드 get 방식에서 한글 처리</h2>
		<p> 한글 성명 : <%= request.getParameter("korname") %></p>
		<p> 영문 성명 : <%= request.getParameter("engname") %></p>
	</body>
</html>
