<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="myFirstTag" uri="/WEB-INF/tlds/outputCustomTag.tld" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>커스텀 태그 - outputCustomTag</title>
		
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
		<h3 align="center">첫 커스텀 태그 예제</h3>
		<div>
			<hr />
			<!-- 태그 같이 사용 가능 -->
			<myFirstTag:output value="난 출력하겠다<br/>" />
			
			<!-- 선택 옵션은 제어 필요 -->
			<myFirstTag:output value="난 출력하겠다" addValue="이건 선택이다."/><br/>
			<myFirstTag:output value="1234" addValue="이건 선택이다."/><br/>
			
			<!-- EL 사용은 'rtexprValue'가 true일 때, 가능 -->
<%-- 		<% pageContext.setAttribute("str", "Java"); %> --%>
			<c:set var="str" value="난  c:set을 이용해서 정의된 str변수이다!" />
			<myFirstTag:output value="${str }"/><br/>
		</div>
	</body>
</html>
