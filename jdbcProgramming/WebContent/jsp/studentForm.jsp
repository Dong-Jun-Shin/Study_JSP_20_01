<%@page import="com.student.SubjectVO"%>
<%@page import="com.student.SubjectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SubjectDAO sdao = SubjectDAO.getInstance();
	ArrayList<SubjectVO> list = sdao.getSubjectList();
	int size = list.size();
	
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>등록 페이지</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<style type="text/css">
			table {
				width: 450px;
				text-align: center;
			}
			
			table, tr {
				border: 1px solid black;
				border-collapse: collapse;
			}
			
			td{
				padding: 10px 0px;
			}
			
			tr > td:nth-child(1){
				font-weight: bold;
			}
			
			input, select {
				width: 60%;
				height: 25px;
			}
		</style>
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="../js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				// "학과명" 선택에 따른 제어
				$("#s_num").change(function(){
					if($("#s_num > option:selected").index() > 0){
						$.ajax({
							url: "/jdbcProgramming/jsp/result.jsp",
							type: "post",
							data: "s_num=" + $("#s_num").val(),
							datatype: "text",
							
							success: function(data){
								$("#sd_num").val(data);
							},
						
							error: function(xhr, textStatus, errorThrown){
								alert("잠시후에 다시 시도해 주세요.");
							}
						});
					}else{
						$("#sd_num").val("");
					}
				});
				
				// 아이디 중복체크
				//버튼식
// 				$("#idBtn").click(function(){
// 					$.ajax({
// 						url: "idCheck.jsp",
// 						type: "post",
// 						data: "sd_id=" + $("#sd_id").val(),
// 						datatype: "text",
						
// 						success: function(data){
// 							console.log(data);
// 							console.log(typeof(data));
							
// 							if(data=="0"){
// 								alert("사용 가능한 아이디입니다!");
// 								$("#idBtn").attr({"disabled" : "disabled"});
// 							}else{
// 								alert("이미 사용중인 아이디입니다!");
// 							}
// 						},
						
// 						error: function(xhr, textStatus, errorThrown){
// 							alert("잠시후에 다시 시도해 주세요.");	
// 						}
// 					});
// 				});

				//키 입력 체크식
				$("#sd_name").keyup(function(){
					if($("#sd_id").val().replace(/\s/g,"")!=""){
						$.ajax({
							url: "idCheck.jsp",
							type: "post",
							data: "sd_id=" + $("#sd_id").val(),
							dataType: "text",
							
							success: function(data){
								if(parseInt(data)==1){
									//alert("중복된 아이디 입니다. 다시 입력해주세요.");
									$("#sd_id").val("");
									$("#sd_id").attr("placeholder", "중복된 아이디입니다. 다시 입력해 주세요.");
								}
							},
							
							error: function(xhr, textStatus, errorThrown){
								alert("잠시 후에 다시 시도해 주세요.");
							}
						})
					}else{
						$("#sd_id").val("");
						$("#sd_id").attr("placeholder", "아이디를 입력해주세요!");
					}
				})
				
				// "입력완료" 버튼 제어
				$("#insertBtn").click(function(){
					if($("#s_num > option:selected").index() == 0){
						alert("학과명 선택해 주세요.");
						return;
					}
					if(checkExp($("#sd_id"), "아이디")) return;
					if(checkExp($("#sd_name"), "학생이름")) return;
					if(checkExp($("#sd_birth"), "생년월일")) return;
					if(checkExp($("#sd_passwd"), "비밀번호")) return;
					if(checkExp($("#sd_phone"), "전화번호")) return;
					if(checkExp($("#sd_email"), "이메일")) return;
					if(checkExp($("#sd_address"), "학생주소")) return;
					
					$("#studentForm").attr({
						"method" : "post",
						"action" : "studentPro.jsp"
					});
					
					$("#studentForm").submit();
				});
				
				// "다시쓰기" 버튼 제어
				$("#resetBtn").click(function(){
					$("#student").each(function(){
						this.reset();
					});
				});
			});
		</script>
	</head>
	<body>
		<form name="studentForm" id="studentForm">
			<table>
				<colgroup>
					<col width="100"></col>
					<col width="300"></col>
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">학생 정보 등록</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>학생 번호</td>
						<td><input type="text" placeholder="학과명을 선택하면 자동으로 부여" name="sd_num" id="sd_num" readonly="readonly" maxlength="8"/> </td>
					</tr>	
					<tr>
						<td>학 과 명</td>
						<td>
							<select name="s_num" id="s_num">
								<option>학과를 선택해 주세요</option>
								<% for(SubjectVO svo : list){ %>
								<option value="<%=svo.getS_num() %>"><%=svo.getS_name() %></option>	
								<%} %>
							</select>
						</td>
					</tr>	
					<tr>
						<td>아 이 디</td>
						<td>
							<input type="text" name="sd_id" id="sd_id" maxlength="14"/>
							<button type="button" name="idBtn" id="idBtn" >ID체크</button>
						</td>
						
					</tr>	
					<tr>
						<td>학생 이름</td>
						<td><input type="text" name="sd_name" id="sd_name" maxlength="8"/></td>
					</tr>	
					<tr>
						<td>생년 월일</td>
						<td><input type="date" name="sd_birth" id="sd_birth"/></td>
					</tr>	
					<tr>
						<td>비밀 번호</td>
						<td><input type="password" name="sd_passwd" id="sd_passwd"/></td>
					</tr>	
					<tr>
						<td>전화 번호</td>
						<td><input type="text" name="sd_phone" id="sd_phone"/></td>
					</tr>	
					<tr>
						<td>이 메 일</td>
						<td><input type="email" name="sd_email" id="sd_email" maxlength="35"/></td>
					</tr>	
					<tr>
						<td>학생 주소</td>
						<td><input type="text" name="sd_address" id="sd_address" maxlength="50"/></td>
					</tr>	
					<tr>
						<td colspan="2">
							<button type="button" name="insertBtn" id="insertBtn">입력완료</button>
							<button type="button" name="resetBtn" id="resetBtn">다시쓰기</button>
							<button type="button" name="listBtn" id="listBtn">목록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>
