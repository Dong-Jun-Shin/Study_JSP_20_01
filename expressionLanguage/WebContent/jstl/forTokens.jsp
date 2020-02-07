<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>JSTL Core: forTokens</title>
		
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
		<h2>JSTL Core Tag: forTokens</h2>
		<h3>forTokens의 delims에 들어간 구분자는 다 제외되고, 그 위치에서 분리된다.(삭제 용도도 겸으로 활용 가능)</h3>
		<p>
			<c:forTokens var="token" items="소설/역사/인문/정치/미술/종교/여해/과학/만화/건강" delims="/">
				${token }
			</c:forTokens>
		</p>
		<<hr />
		
		<c:set var="str" value="JSTL은 표준태그로서 코어, XML, 국제화, SQL, 함수 관련 태그로 구성된다." />
		<p>${str}</p><hr />
		위 문장은 forTokens의 속성 delims="_,.은로서된다" 지정으로 다음 단어로 나뉘어진다.<hr />
		<p>
			<c:forTokens var="token" items="${str }" delims=" ,.은로서된다" varStatus="status">
				${status.count }. ${token } <br />
			</c:forTokens>
		</p>
	</body>
</html>
