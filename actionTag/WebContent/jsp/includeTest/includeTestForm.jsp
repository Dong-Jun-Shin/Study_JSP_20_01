<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>include Form Test</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">

		</script>
	</head>
	<body>
		<form method="post" action="includeTest.jsp">
			<dl>
				<dd>
					<label for="name">이름</label>
					<input id="name" name="name" type="text" placeholder="홍길동" autofocus required />
				</dd>
				<dd>
					<label for="pageName">포함할 페이지</label>
					<input id="pageName" name="pageName" type="text" value="includedTest.jsp" readonly required/>
				</dd>
				<dd>
					<button type="submit" id="send">전송</button>
				</dd>
			</dl>
		</form>
	</body>
</html>
