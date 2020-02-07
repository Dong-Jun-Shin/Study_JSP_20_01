<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>JSTL functions Tag</title>
		
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
		<h2>JSTL Function Tag: functions</h2>
		<c:set var="str1" value="test String" />
		<c:set var="str2" value="<strong>여기</strong>를 클릭해서 다운로드"/>
		<p>str1 출력 : ${str1 }</p>    <!-- test String -->
		<p>str2 출력 : ${str2 }</p>    <!-- 여기를 클릭해서 다운로드(태그적용x) -->		
		<p>str2 출력 : ${fn:escapeXml(str2) }</p>    <!-- 여기를 클릭해서 다운로드(태그적용x) -->
		
		<c:if test="${fn:contains(str1, 'test') }">    <!-- true -->
			<p>test 문자열 포함됨</p>
		</c:if>
		
		<p>indexOf(str1, 't') : ${fn:indexOf(str1, 't') }</p>    <!-- 0 -->
		<p>length(str2) : ${fn:length(str2) }</p>    <!-- 20 -->
		
		<c:set var="spStr" value="${fn:split(str1, ' ') }" />    <!-- [0]: test, [1]: String -->
		<p>fn:split(str1, ' ') 수행 후 첫째 원소값 : ${spStr[0]}</p>    <!-- test -->
		<p>fn:split(str1, ' ') 수행 후 둘째 원소값 : ${spStr[1]}</p>    <!-- String -->
		<p>join(str1, '-') : ${fn:join(spStr, '-') }</p>    <!-- test-String -->
		
		<p>replace(str1, 'test', '테스트') : ${fn:replace(str1, 'test', '테스트') }</p>    <!-- 테스트 String -->
		<p>startsWith(str1, 'test') : ${fn:startsWith(str1, 'test') }</p>    <!-- true -->
		
		<p>substring(str1, 0, 3) : ${fn:substring(str1, 0, 3) }</p>    <!-- tes -->
		<p>substringAfter(str1, ' ') : ${fn:substringAfter(str1, ' ') }</p>    <!-- String -->
		<p>toLowerCase(str1) : ${fn:toLowerCase(str1) }</p>    <!-- test string -->
		<p>toUpperCase(str1) : ${fn:toUpperCase(str1) }</p>    <!-- TEST STRING -->
	</body>
</html>
