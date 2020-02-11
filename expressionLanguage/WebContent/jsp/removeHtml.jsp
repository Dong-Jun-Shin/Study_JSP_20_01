<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="myTag" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>HTML 태그 제거</title>
		
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
		<myTag:removeHtml trim="true" length="50" trail="...">
		<a href="a">난 a태그로 감싸진 주소다!</a>
		<div>
			<p>
				가나다라!<br />
				마바사!<br />
				타타타타!<br />
			</p>
		</div>
		</myTag:removeHtml>
		
		<c:set var="dateEL" value='<%=new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm").format(new Date()) %>' />
		
		<myTag:removeHtml length="17" trail="..." trim="true">
			<u>현재 시간</u>은 <b>${dateEL }</b> 입니다.
		</myTag:removeHtml>
		
	</body>
</html>
