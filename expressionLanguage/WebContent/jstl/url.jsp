<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>JSTL Core: url</title>
		
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
		<!-- url 링크 생성 -->
		<c:url var="site" value="paramhandle.jsp" />
		
		<!-- url 쿼리스트링 파라미터 추가 -->
		<c:url var="page" value="paramhandle.jsp" >
			<c:param name="userName" value="홍길동" />
		</c:url>
		
		<p>\${site } = ${site }</p>
		<p><a href="${page }">${page }</a></p>
		<%-- <c:redirect url="${page } /> --%>
		
		<!-- Context부터 URI 잡기 -->
		<c:url var="student" value="/jsp/selectstudent.jsp" context="/jdbcProgramming" />
		<p><a href="${student }">${student}</a></p>
		</body> 
	</body>
</html>
