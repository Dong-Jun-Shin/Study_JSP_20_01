<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String pageName = request.getParameter("pageName");
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Insert title here</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#frm").attr({
					"method":"get",
					"action":"<%=pageName%>"
				})
				
				$("frm").submit();
			});
		</script>
	</head>
	<body>
			<!-- 정보를 전달하는 첫번째 방법 hidden 타입과 get메서드 사용-->
			<% String name = request.getParameter("name"); %>
			<form id="frm">
				<input type="hidden" value="<%=name%>">
			</form>
		
			<!-- 정보를 전달하는 두번째 방법 / 액션태그 사용 -->
<!-- 		포함하는 페이지 includeTest.jsp입니다.<br /> -->
<!-- 		이용해주셔서 감사합니다.<br /><hr /> -->
<!-- 		<!-- pageName = includedTest.jsp --> -->
<%-- 		<jsp:include page="<%=pageName %>"></jsp:include> --%>
<!-- 		<br /> <hr />includeTest.jsp의 나머지 내용입니다. -->
	</body>
</html>
