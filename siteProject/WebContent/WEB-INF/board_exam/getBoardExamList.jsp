<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Board_exam 예제</title>
		
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
		
		<script type="text/javascript" src="/siteProject/include/js/common.js"></script>
		<script type="text/javascript" src="/siteProject/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/siteProject/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				// 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
				$(".goDetail").click(function(){
					// 속성을 부여해서 식별을 비교적 단순하게 함.
// 					var num = $(this).parents("tr").children().eq(0).html();
					var num = $(this).parents("tr").attr("data-num");
// 					console.log("num = " + num);
					
					$("#num").val(num);
					$("#detailForm").attr({
						"method" : "post",
						"action" : "/siteProject/board_exam/detailBoard.do"
					})
					
					$("#detailForm").submit();
				})
				
				// 글쓰기 버튼 클릭시 처리 이벤트
				$("#writeForm").click(function(){
					location.href = "/siteProject/board_exam/insertForm.do";
				});
			})
		</script>
	</head>
	<body>
		<div class="contentContainer container-fluid">
			<div class="text-center"><h3>글목록</h3></div>
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="num" id="num">
			</form>
			<div class="pull-right">
				<form class="form-inline" action="">
					<div class="form-group">
					  	<label for="keyword">검색조건</label>
					  	<select name="search" id="search" class="form-control input-sm">
					  		<option value="all">전체</option>
					  		<option value="title">제목</option>
					  		<option value="content">내용</option>
					  		<option value="author">작성자</option>
					  	</select>
					  	<input type="text" name="keyword" id="keyword" class="form-control input-sm" placeholder="검색어를 입력해주세요" />
					  	<button type="button" class="btn btn-warning btn-sm form-control" id="boardSearchBtn">검색</button>
				  	</div>
			  	</form>
		  	</div>
			<%-- 리스트 시작 --%>
			<div id="boardExamList">
				<table summary="게시판 예제 리스트" class="table table-hover">
					<colgroup>
						<col width="10%" />
						<col width="50%" />
						<col width="15%" />
						<col width="13%" />
						<col width="12%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty list }">
								<c:forEach var="bvo" items="${list }">
									<tr class="tac" data-num="${bvo.num}">
										<td>${bvo.num }</td>
										<td class="tal"><span class="goDetail">${bvo.title }</span></td>
										<td>${bvo.author }</td>
										<td>${bvo.writeday }</td>
										<td>${bvo.readcnt }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<td colspan="5" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<%-- 글쓰기 버튼 출력 시작 --%>
			<div class="contentBtn text-right">
				<input type="button" value="글쓰기" id="writeForm" class="btn btn-primary btn-sm"/>
			</div>
		</div>
	</body>
</html>
