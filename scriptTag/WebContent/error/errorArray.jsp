<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>ArrayIndexOfBounds-error</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			#imgView{
				width: 100%;
				height: 100%;
			}
			
			img{
				width: 100%;
				height: 100%;
			}
		</style>
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">

		</script>
	</head>
	<body>
		<div id="wrapper">
			<!-- head와 img를 다 지워서 512KB 이하를 만들면, 익스플로러에서 자체적인 오류페이지를 보여준다. -->
			<div id="imgView">
				<img src="../image/errorArray.png" />
			</div>
		</div>
	</body>
</html>