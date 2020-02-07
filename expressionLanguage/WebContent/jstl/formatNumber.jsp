<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>formatNumber</title>
		
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
		<c:set var="price" value="10000" />
		숫자: ${numberType }
		<br />
		<p>
			<fmt:formatNumber value="${price }" type="number" var="numberType" />
			<br />
			통화: <fmt:formatNumber value="${price }" type="currency" currencySymbol="$" />
			<br />
			퍼센트(true): <fmt:formatNumber value="${price }" type="percent" groupingUsed="true" />
			<br />
			퍼센트(false): <fmt:formatNumber value="${price }" type="percent" groupingUsed="false" />
			<br />
			패턴(0표기): <fmt:formatNumber value="${price }" type="currency" pattern="00000000.00" />
			<br />
			패턴(0표기x): <fmt:formatNumber value="${price }" type="currency" pattern="#####,000.00" />
			<br />
		</p>
		
		<p>
			<!-- 최대 정수 3자리까지 표시 -->
			<fmt:formatNumber value="4578.8743" type="number" maxIntegerDigits="3" />
			<br />
			<!-- 최소 소수점 2자리까지 표시, 쉼표 표시 안함 -->
			<fmt:formatNumber value="2" type="number" minIntegerDigits="2" groupingUsed="false" />
			<br />
			<!-- 최대 정수 2자리까지 표시, 쉼표 표시 안함 -->
			<fmt:formatNumber value="4578.8743" type="number" maxIntegerDigits="2" groupingUsed="false" />
			<br />
			<!-- 최소 소수점 1자리까지 표시 -->
			<fmt:formatNumber value="4578" type="number" minFractionDigits="1"/>
		</p>
		
		<h4>parseNumber 태그</h4>
		<p>
			<!-- 최소 소수점 2자리까지 표시, 쉼표 표시 안함 -->
			<fmt:parseNumber value="1,234.56" pattern="0,000.000" var="num1" />
			<fmt:parseNumber value="123" var="num2" />
			
			<!-- 패턴 적용하려면 fmt 사용 -->
			<fmt:formatNumber type="number" value="${num1 + num2 }" /><br />
			
			
			${num1 + num2 }<br />
			${num1 }<br />
			${num2 }
		</p>
	</body>
</html>
