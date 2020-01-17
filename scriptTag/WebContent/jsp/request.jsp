<%@page import="java.util.Arrays"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8;");
%>
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
			<input type="hidden" name="name" value="<%= request.getParameter("name") %>">
			<input type="hidden" name="birth" value="<%= request.getParameter("birth") %>">
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
						<%=	request.getParameter("scholarship")%>
					</td>
				</tr>
				<tr>
					<td>학과(전공)</td>
					<td>
						<%= request.getParameter("major")%>&nbsp;
						<%
							if(request.getParameter("grad")!=null){
								out.print(request.getParameter("grad"));
							}
						%>
					</td>
				</tr>
				<tr>
					<td>사용가능 플랫폼</td>
					<td><%= Arrays.toString(request.getParameterValues("platform")) %></td>
				</tr>
				<tr>
					<td>사용가능 언어</td>
					<td>
						<!--  배열을 확인하는 방법 (직접 서술, Arrays 클래스의 toString() 활용-->
						
						<!-- 직접 서술 -->
						<%
							String[] langStr = request.getParameterValues("language"); 
							String str = "[";
							
							for(int i = 0 ; i < langStr.length; i++){
								str += langStr[i];
								if(i < langStr.length-1) str += ", ";
							}

							// foreach문을 활용한 예시
// 							int i = 0;
// 							for(String forms : langStr) {
// 								str += forms;
// 								if(i++ < langStr.length-1) str += ", ";
// 							}

							str += "]";
							
							
							out.print(str);
						%>
						
						<!-- Array 클래스 활용 -->
						<%= Arrays.toString(request.getParameterValues("language")) %>
					</td>
				</tr>
			</table>
		</fieldset>
		<br />
		<fieldset>
			<legend>요청 정보</legend>
			<table>
				<tr>
					<td>요청방식</td>
					<td><%= request.getMethod() %></td>
				</tr>
				<tr>
					<td>프로토콜</td>
					<td><%= request.getProtocol() %></td>
				</tr>
				<tr>
					<td>IP 주소</td>
					<td>
						<%=	request.getRemoteAddr()%>
					</td>
				</tr>
				<tr>
					<td>컨텐츠 타입</td>
					<td><%= request.getContentType() %></td>
				</tr>
				<tr>
					<td>인코딩</td>
					<td><%= request.getCharacterEncoding() %></td>
				</tr>
				<tr>
					<td>요청  URI<br />요청 URL</td>
					<td><%= request.getRequestURI() %><br /><%= request.getRequestURL() %></td>
				</tr>
				<tr>
					<td>서버이름</td>
					<td><%= request.getServerName() %></td>
				</tr>
				<tr>
					<td>서버포트</td>
					<td><%= request.getServerPort() %></td>
				</tr>
			</table>
		</fieldset>
	</body>
</html>
