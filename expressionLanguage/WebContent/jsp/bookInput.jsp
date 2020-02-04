<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Insert title here</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="../js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#bookForm").submit(function(){
					if(checkExp($("#title"), "책제목")) return;
					if(checkExp($("#author"), "책저자")) return;
					if(checkExp($("#publisher"), "출판사")) return;
					
					$("#bookForm").submit();
				});
			})
		</script>
	</head>
	<body>
		<form name="bookForm" id="bookForm" method="post" action="bookResult.jsp">
			<label>책제목 : </label><input type="text" name="title" id="title" /><br />
			<label>책저자 : </label><input type="text" name="author" id="author" /><br />
			<label>출판사 : </label><input type="text" name="publisher" id="publisher" /><br />
			<button type="submit">등록</button>
		</form>
	</body>
</html>
