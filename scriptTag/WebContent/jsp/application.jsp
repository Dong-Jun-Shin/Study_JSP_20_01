<%@page import="java.util.Set"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>application.jsp 내장객체 예제</title>
		
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
		<h4> application 내장객체 예제 </h4>
		<%
			String serverInfo = application.getServerInfo();	
			String realPath = application.getRealPath("/");		
		%>
		Server: <%= serverInfo %><br />						<!-- 서버 정보 -->
		서블릿 버전 : <%= application.getMajorVersion() %>.		<!-- 서블릿 버전 앞자리 -->
		<%= application.getMinorVersion() %><br />			<!-- 서블릿 버전 뒷자리 -->
		Path of Document: <%= realPath %><br />				<!-- 현재 application 객체가 있는 프로젝트의 경로 -->
		
		<%
			Set<String> list = application.getResourcePaths("/");	// WebContent 아래 폴더들
		
			if(list != null){
				Object[] obj = list.toArray();
				
				for(Object o : obj){
					out.print(o + "<br />");
				}
			}
		%>
	</body>
</html>
