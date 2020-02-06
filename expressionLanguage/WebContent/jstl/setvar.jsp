<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>JSTL Core: set</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<h2>JSTL Core Tag: set</h2>
		<c:set var="setStr" value="set Tag 테스트입니다." />
		\${setStr} = ${setStr} <br />
		
		<c:set var="n">
			24
		</c:set>
		\${n } = ${n } <br />
		
		<c:set var="d">
			31.54
		</c:set>
		\${d } = ${d } <br />
		\${n + d } = ${n + d } <br />
		
		<c:set var="b" value="true" />
		\${!b } = ${!b } <br />
		
		<%--
			session.setAttribute("str", "Hello set Tag!!!");
			out.print(session.getAttribute("str"));
		 --%>
		<c:set var="str" value="Hello set Tag!!!" scope="session" />
		\${str } = ${str } <br />
		\${sessionScope.str} = ${sessionScope.str} <br />
		
	</body>
</html>
