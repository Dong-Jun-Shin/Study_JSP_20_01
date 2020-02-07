<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>JSTL Core: out</title>
		
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
		<h2>JSTL Core Tag: out (p.312 예제)</h2>
		<%
			FileReader reader = null;
			try{
				String path = request.getParameter("path");
				reader = new FileReader(getServletContext().getRealPath(path));
		%>
		<pre>
		소스 코드 = <%= path %>
		<c:out value="<%= reader%>" escapeXml="true" />
		</pre>
		<%
			} catch(IOException ex){
		%>
		에러: <%=ex.getMessage() %>
		<%
			}finally{
				if(reader != null)
					try{
						reader.close();
					}catch(IOException ex){}
			}
		%>
	</body>
</html>
