<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tagdir : 폴더경로, 폴더 단위로 그 아래 있는 파일 명이 태그이름이 된다.--%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>커스텀 태그 - 태그 파일(.tag .tagx)</title>
		
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
		<h3>태그 파일을 만든 커스텀 태그 예제</h3>
		<div>
			<hr />
			<mytag:output value="Hello Custom Tag using Tag File !!!" color="red"/><br />
			<mytag:output value="태그 파일을 이용한 커스텀 태그"></mytag:output>
			<hr />
			
			<mytag:now />
			<hr />
			
			<mytag:sum begin="1" end="10" >
				1에서 10까지 합: ${sum }
			</mytag:sum>
			<hr />

			<mytag:sum begin="10" end="100" />
				${beginValue }에서 ${endValue }까지 합: ${sum }
			<hr />
			
			<%-- body-content가 empty여도 속성의 fragment가 true이면 작동은 한다. --%>
			<mytag:header_frag level="2">
				<jsp:attribute name="title">난 몸통을 전달받아 출력하는 태그!</jsp:attribute>
			</mytag:header_frag>
			<hr />
		</div>
	</body>
</html>
