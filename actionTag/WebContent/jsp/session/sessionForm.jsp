<%@page import="com.exam.MemberVO"%>
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
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<style type="text/css">
			strong{
				display: inline-block;
				width: 90px;
			}
		
			div{
				width: 600px;
				margin: 10px 20px;
			}
			
			input {
				width: 350px;
				height: 25px;
			}
			
			button {
				width: 210px;
				height: 30px;
				margin: 0px 0px;
			}
		</style>
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#send").click(function(){
					if(checkExp($("#user_id"), "아이디")) return;
					if(checkExp($("#user_password"), "비밀번호")) return;
					
					$("#loginForm").attr({
						"action" : "session.jsp",
						"method" : "post"
					});
					
					$("#loginForm").submit();
				});
				
				$("#logoutBtn").click(function(){
					$("#logout").attr({
						"action" : "logout.jsp",
						"method" : "post"
					});
					
					$("#logout").submit();
				})
				
				function checkExp(elem, sort){
					var spaceExp = /\s/g;
					var idExp = /^[a-zA-Z]{6,20}$/g;
					
					var pwExp1 = /[a-zA-Z]/g;
					var pwExp2 = /[0-9]/g;
// 					var pwExp3 = /(\w+)[0-9]+[a-zA-Z]+(\w+)/g; //수량 한정자 활용 해보기 (문자+숫자 안됨)
					
					var expStr = "";
					var expBool = true;
					
					if(sort == "아이디"){
						expStr = "영문";
						expBool = !idExp.test(elem.val());
					}else if(sort == "비밀번호"){
						expStr = "숫자와 영문";
						expBool = !(pwExp1.test(elem.val()) && pwExp2.test(elem.val()) && elem.val().length >= 8);
// 						expBool = !(pwExp3.test(elem.val()) && elem.val().length >= 8); // 수량 한정자 활용 해보기
					}

					if(elem.val().replace(spaceExp, "")==""){
						alert(sort + "를 입력해주세요.");
						elem.val("");
						elem.focus();
						return true;
					}
					
					if(expBool){
						alert(expStr + "으로 8~20자리 사이 문자를 구성해주세요.");
						elem.focus();
						return true;
					}
					
					return false;
				}
			})
		</script>
	</head>
	<body>
		<%-- 세션이 설정되지 않은 경우 --%>
<%-- 		<%if(session.getAttribute("id") == null){ %>  <!-- 각각 속성이 저장된 경우, 사용  --> --%>
		<%if(session.getAttribute("member") == null){ %>
		<form name="loginForm" id="loginForm">
			<div><strong>아이디</strong><input type="text" placeholder=" 영문으로 입력해 주세요.(최소 8~20자리까지 가능)" name="user_id" id="user_id" maxlength="20"></div>
			<div><strong>비밀번호</strong><input type="password" placeholder=" 영문과 숫자로 입력해 주세요. (최소 8~20자리까지 가능)" name="user_password" id="user_password" maxlength="20"></div>
			<div>
				<button type="button" id="send">로그인</button>
				<button type="reset">취소</button>
			</div>
		</form>
		<%}else { %>
			<form id="logout">
				<div>
					<label>
					
<%-- 						<%=session.getAttribute("name") %> --%>
<%-- 						(<%=session.getAttribute("id") %>)님 반갑습니다.  <!--각각 속성이 저장된 경우, 사용--> --%>

						<%=((MemberVO)session.getAttribute("member")).getUser_email() %><br />
						<%=((MemberVO)session.getAttribute("member")).getUser_name() %>
						(<%=((MemberVO)session.getAttribute("member")).getUser_id() %>)님 반갑습니다.
					</label>
					<button type="button" id="logoutBtn">로그아웃</button>
				</div>
			</form>
		<%
		  }
		%>
	</body>
</html>
