<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pagefile = request.getParameter("page");
	if(pagefile==null){
		pagefile="newitem";
	}
	String pagefileEx = ".jsp";
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Template Page</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<link rel="stylesheet" type="text/css" href="/actionTag/css/template.css" />
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<header>
					<nav><jsp:include page="top.jsp" /></nav>
				</header>
			</div>
			<div id="sidebar">
				<section>
					<%-- <jsp:include page="login.jsp" /> --%>
					<jsp:include page="left.jsp" />
				</section>
			</div>
			<div id="contents">
				<section>
					<jsp:include page="<%=pagefile + pagefileEx %>" />
				</section>
			</div>
			<div id="footer">
				<footer>
					<jsp:include page="bottom.jsp" />
				</footer>
			</div>
		</div>
	</body>
</html>
