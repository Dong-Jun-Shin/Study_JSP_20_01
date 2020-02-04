<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>표현 언어의 연산자</title>
		
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
		<ul>
			<li><h3>표현식 = 값</h3></li>
			<li><p>\${문자열} = ${"JAVA"}</p></li>
			<li><p>\${2 + 5} = ${2 + 5}</p></li>
			<li><p>\${4 / 5} = ${4 / 5}</p></li>
			<li><p>\${7 mod 5} = ${7 mod 5}</p></li>
			<li><p>\${2 &lt; 3} = ${2 < 3}</p></li>
			<li><p>\${3.1 le 3.2} = ${3.1 le 3.2}</p></li>
			<li><p>\${3 lt 5 and 8 gt 10} = ${3 lt 5 and 8 gt 10}</p></li> <!-- lt : less than(<), gt : greater than(>) -->
			<li><p>\${header["host"]} = ${header["host"]}</p></li>	<!-- header가 가지고 있는 host(localhost:8080) -->
			</ul>
			
			<h3>표현언어 연산자 empty 확인</h3>
			<p>\${null} = ${null}</p>	<!-- 빈 값 -->
			<p>\${n} = ${n}</p>	<!-- 빈 값 -->
	
			<p>\${empty null} = ${empty null}</p>
			<p>\${empty n} = ${empty n}</p>	<!-- null -->
	
			<p>\${param.user} = ${param.user}</p> <!-- request에 있는 parameter 값 -->
			<p>\${empty param.user} = ${empty param.user}</p>
	</body>
</html>
