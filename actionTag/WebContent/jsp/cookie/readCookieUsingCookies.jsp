<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "util.Cookies" %>
<%
	Cookies cookies = new Cookies(request);
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
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		name 쿠키 = <%= cookies.getValue("name") %> <br />
		<%
			if(cookies.exists("id")){
				out.print("id 쿠키 = ");
				out.println(cookies.getValue("id"));
			}
		
			out.println("<br /><br />" + cookies.toString(request));
		%>
	</body>
</html>
