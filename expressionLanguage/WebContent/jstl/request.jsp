<%@page import="java.util.Arrays"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<%-- fmt:requestEncoding으로 대체 가능
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8;");
%>
--%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>기술 정보 이력서</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			*{
				padding: 5px;
			}
			
			fieldset{
				width: 600px;
				height: 100%;
				border: 3px solid black;
				padding-bottom: 30px;
			}
			
			legend{
				color: skyblue;
				font-size: 30px;
				font-weight: bold;
				margin-left: 30px;
			}
			
			table{
				width: 90%;
				height: 230px;
				margin: 0px auto;
			}
			
			table, td {
				border: 1px solid black;
				border-collapse: collapse;
			}
			
			tr > td:nth-child(1) {
				width: 30%;
				background-color: lightgray;
				text-align: center;
			}
			
			tr > td:nth-child(2) {
				padding-left: 20px;
			}
		</style>
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#btnSubmit").click(function(){
					//get방식으로 다른 페이지에 정보를 넘겨줄 때, 쿼리스트링을 이용
<%-- 					location.href = "request1.jsp?name=<%=request.getParameter("name")%>&birth=<%=request.getParameter("birth")%>"; --%>

					//post방식을 위한 form 다루기
					$("#dataForm").attr({
						"method" : "post",
						"action" : "request1.jsp"
					});
					
					$("#dataForm").submit();
				})	
			})
		</script>
	</head>
	<body>
		<!-- post방식으로 전달하는 방법 -->
		<form id="dataForm">
			<input type="hidden" name="name" value="${param.name }">
			<input type="hidden" name="birth" value="${param.birth }">
		</form>
		<fieldset>
			<legend>기술정보 이력서 <button type="button" id="btnSubmit">개인정보</button></legend>
			<table>
<!-- 				<tr> -->
<!-- 					<td>이름</td> -->
<%-- 					<td><%= request.getParameter("name") %></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>생년월일</td> -->
<%-- 					<td><%= request.getParameter("birth") %></td> --%>
<!-- 				</tr> -->
				<tr>
					<td>학력</td>
					<td>
						${param.scholarship}
					</td>
				</tr>
				<tr>
					<td>학과(전공)</td>
					<td>
						${param.major }&nbsp;
						<c:if test="${!empty param.grad}">
							${param.grad }
						</c:if>
					</td>
				</tr>
				<tr>
					<td>사용가능 플랫폼</td>
					<td>
						<c:forEach var="plat" items="${paramValues.platform }">
							${plat },&nbsp;
						</c:forEach>
					</td>
<%-- 				<td><%= Arrays.toString(request.getParameterValues("platform")) %></td> --%>
				</tr>
				<tr>
					<td>사용가능 언어</td>
					<td>
						[
						<c:forEach var="plat" items="${paramValues.language }">
							${plat },&nbsp;
						</c:forEach>
						]						
					</td>
				</tr>
			</table>
		</fieldset>
		<br />
		<fieldset>
			<!-- 
				requestScope는 생존범위 속성 맵으로 request 속성을 가져오기 위해 사용한다.
				request는  pageContext를 통해 접근할 수 있는데, 이는 page의 정보를 담고 있어서로 추측된다.
				기타 나머지 페이지 관련 정보를 읽을 때도 pageContext를 통해서 읽어온다.
			-->
			<legend>요청 정보</legend>
			<table>
				<tr>
					<td>요청방식</td>
					<td>${pageContext.request.method}</td>
<%-- 					<td><%= request.getMethod() %></td> --%>
				</tr>
				<tr>
					<td>프로토콜</td>
					<td>${pageContext.request.protocol}</td>
<%-- 					<td><%= request.getProtocol() %></td> --%>
				</tr>
				<tr>
					<td>IP 주소</td>
					<td>${pageContext.request.remoteAddr }
<%-- 					<td><%=	request.getRemoteAddr()%></td> --%>
				</tr>
				<tr>
					<td>컨텐츠 타입</td>
					<td>${pageContext.request.contentType}</td>
<%-- 					<td><%= request.getContentType() %></td> --%>
				</tr>
				<tr>
					<td>인코딩</td>
					<td>${pageContext.request.characterEncoding}</td>
<%-- 					<td><%= request.getCharacterEncoding() %></td> --%>
				</tr>
				<tr>
					<td>요청  URI<br />요청 URL</td>
					<td>${pageContext.request.requestURI}<br />${pageContext.request.requestURL}</td>
<%-- 					<td><%= request.getRequestURI() %><br /><%= request.getRequestURL() %></td> --%>
				</tr>
				<tr>
					<td>서버이름</td>
					<td>${pageContext.request.serverName}</td>
<%-- 					<td><%= request.getServerName() %></td> --%>
				</tr>
				<tr>
					<td>서버포트</td>
					<td>${pageContext.request.serverPort}</td>
<%-- 					<td><%= request.getServerPort() %></td> --%>
				</tr>
			</table>
		</fieldset>
	</body>
</html>
