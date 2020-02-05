<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>EL 내장객체 cookie</title>
		
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
		<h2>표현언어 내장객체 cookie 이용</h2>
		<%
			Cookie cookie = new Cookie("userId", "javajsp");
			response.addCookie(cookie);
		%>
		<hr />
		<h4>스크립트릿에서 직접 Cookie 이용</h4>
		<%
			Cookie[] cs = request.getCookies();
		
			if(!(cs == null)){
				for(Cookie ck : cs){
					if(ck.getName().equals("userId")) 
						out.println("ck.getValue() 값 : " + ck.getValue());
				}
			}
		%>
		<hr />
		
		<h4>표현언어 내장객체 cookie 이용</h4>
		\${cookie.userId.value} = ${cookie.userId.value}
		
		<h2>\${header} : 결과</h2>
		<p> 요청정보 헤더의 정보들을 이름과 값으로 저장하고 있는 Map 객체.</p>
		<p>${header} </p>
		<hr />
		\${header["user-agent"]} = ${header["user-agent"]}
	</body>
</html>
