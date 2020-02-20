<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>My page</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="/siteProject/image/icon.png" />
		<link rel="apple-touch-icon" href="/siteProject/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<link rel="stylesheet" type="text/css"
		href="/siteProject/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css"
		href="/siteProject/include/dist/css/bootstrap-theme.css" />
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="/siteProject/include/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/siteProject/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/siteProject/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				
			})
		</script>
	</head>
	<body>
		<h3 style="text-align: center;">My Page</h3>
		<div style="width: 90%; margin: 0px auto;">
			<%-- 비밀번호 확인 버튼 및 버튼 추가 시작 --%>
			<form class="form-inline" name="my_info" id="my_info">
				<table class="table table-bordered .table-hover" style="width: 500px; margin: 20px auto;">
					<colgroup>
						<col width="25%" />
						<col width="75%" />
					</colgroup>
					<tbody>
						<tr>
							<td class="success text-center" style="line-height: 50px;">회원 아이디</td>
<%-- 							<td>${member.m_id }</td> --%>
							<td class="text-center" style="line-height: 50px;">test용 구현되면 삭제하고 주석풀기</td>
						</tr>
						<tr>
							<td class="success text-center" style="padding: 20px;">비밀번호</td>
							<td class="text-center" style="padding: 20px;"><input type="password" name="m_passwd" id="m_passwd"/></td>
						</tr>
						<tr>
							<td class="success text-center" style="line-height: 50px;">회원명</td>
<%-- 							<td>${member.m_name }</td> --%>
							<td class="text-center" style="line-height: 50px;">test용 구현되면 삭제하고 주석풀기</td>
						</tr>
						<tr>
							<td class="success text-center" style="line-height: 50px;">이메일</td>
<%-- 							<td>${member.m_email }</td> --%>
							<td class="text-center" style="line-height: 50px;">test용 구현되면 삭제하고 주석풀기</td>
						</tr>
						<tr>
							<td class="success text-center" style="line-height: 50px;">전화번호</td>
<%-- 							<td>${member.m_tel }</td> --%>
							<td class="text-center" style="line-height: 50px;">test용 구현되면 삭제하고 주석풀기</td>
						</tr>
						<tr>
							<td class="success text-center" style="line-height: 50px;">회원가입일</td>
<%-- 							<td>${member.reg_date }</td> --%>
							<td class="text-center" style="line-height: 50px;">test용 구현되면 삭제하고 주석풀기</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center" style="line-height: 50px;">
								<button type="button" class="btn btn-warning" id="updateBtn" >회원수정</button>
								<button type="button" class="btn btn-warning" id="deleteBtn" >회원탈퇴</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</body>
</html>
