<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="myTag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>원하는 곱셈표를 출력합니다.</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			table, td{
				border: 1px solid black;
			}
		
			table{
				margin: 0px auto;
				border-collapse: collapse;
			}
			
			td{
				 padding: 5px;
			}
		</style>
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<h4>태그 파일을 이용한 커스텀 태그 : gugudan</h4>
		<hr />
		
		<h3>구구단 (2단에서 9단까지)</h3>
		<table>
			<myTag:gugudan />
		</table>
		<hr />

		<h3>구구단 (2단에서 5단까지)</h3>
		<table>
			<myTag:gugudan end="5"/>
		</table>
		<hr />
		
		<h3>구구단 (3단에서 7단까지)</h3>
		<table>
			<myTag:gugudan begin="3" end="7" />
		</table>
		<hr />
	</body>
</html>
