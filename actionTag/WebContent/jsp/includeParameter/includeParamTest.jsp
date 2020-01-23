<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>include Parameter Test</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<% request.setCharacterEncoding("UTF-8"); %>
		
		<%
			String name = "홍길동";
			String pageName = "includedParamTest.jsp";
		%>
		포함하는 페이지 includeParamTest.jsp 입니다.<br>
		포함되는 페이지에 파라미터 값을 전달합니다.<br>
		<hr />
		<jsp:include page="<%=pageName %>">
			<jsp:param name="name" value="<%=name %>"/>
			<jsp:param name="pageName" value="<%=pageName %>"/>
		</jsp:include>
		includeParamTest.jsp의 나머지 내용입니다.
	</body>
</html>
