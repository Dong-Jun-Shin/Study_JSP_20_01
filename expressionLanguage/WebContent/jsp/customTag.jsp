<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="bodyOutput" uri="/WEB-INF/tlds/customTag.tld" %> --%>
<%@ taglib prefix="bodyOutput" uri="http://myTags.com" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>커스텀 태그 : customTag</title>
		
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
		<bodyOutput:body>난 태그다!<br /></bodyOutput:body>
		<bodyOutput:body>난 바디다!</bodyOutput:body>
		
		<!-- 표현식과 EL은 중복사용 안됨 -->
		<!-- EL과 EL은 중복사용 가능 -->
<%-- 		<bodyOutput:body>난 태그다!<%= "난 표현식 출력!" %></bodyOutput:body> --%>

		<bodyOutput:StringOutput>난 출력스트림인 StringWriter를 이용한 바디다!<br/></bodyOutput:StringOutput>
		<br />
		
		<bodyOutput:add num1="1" num2="5" />
		
	</body>
</html>
