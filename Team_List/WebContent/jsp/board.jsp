<%@page import="java.util.ArrayList"%>
<%@page import="team.board.BoardDAO"%>
<%@page import="team.board.BoardVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
	BoardDAO bdao = BoardDAO.getInstance();
	ArrayList<BoardVO> list = bdao.getBoardList();
	int counter = list.size();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>자유 게시판 글 목록</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<link rel="stylesheet" type="text/css" href="../css/board_free.css">

		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#more").click(function(){
					location.href = "board_form.jsp";
				})
				
// 				//검색 부분
// 				$("#searchBtn").click(function(){
// 					$.ajax({
// 						url: "",
// 						type: "post",
// 						data: "keyword=" + $("#search").val() + "&sort=" + $("#sort > option:selected").val(),
// 						dataType: "text",
						
// 						success: function(data){
							
// 						},
						
// 						error: function(xhr, textStatus, errorThrown){
							
// 						}
// 					})
// 				})
			})
		</script>
	</head>
	<body>
		<div class="container">
		<!-- 게시판 제목이 출력될 곳 -->
			<h1 class="title">자유 게시판 글 목록</h1>
		
			<div class="search">
				<label>검색조건</label>
				<select name="sort" id="sort">
					<option>전체</option>
					<option value="b_title">제목</option>
					<option value="b_writer">글쓴이</option>
				</select>
				<input type="text" placeholder="검색어를 입력하세요." name="search" id="search" />
				<button type="button" name="searchBtn" id="searchBtn">검색</button>
			</div>
			
			<div class="example">
				<table>
					<thead>
						<tr>
							<th class="no">번호</th>
							<th class="subject">제목</th>
							<th class="writer">글쓴이</th>
							<th class="date">작성일시</th>
							<th class="hit">조회수</th>
						</tr>
					</thead>
					<tbody id="board_list">
						<!-- 목록이 추력될 곳 -->
						<%
						if(counter > 0){
							for(int i = 0; i < counter; i++){ 
								BoardVO bvo = list.get(counter-(i+1));
						%>
								<tr class="list">
									<td class="no"><%=bvo.getB_num() %></td>
									<td class="left subject"><a href="detail.jsp?b_num=<%=bvo.getB_num() %>"><%=bvo.getB_title() %></a></td>
									<td class="writer"><%=bvo.getB_writer() %></td>
									<td class="date"><%=bvo.getB_reg_date().subSequence(0, 10) %></td>
									<td class="hit"><%=bvo.getB_hits() %></td>
								</tr>
						<%
							} 
						}
						%>
					</tbody>
				</table>
			</div>
			
			<!-- 게시물 수 출력될 곳 -->
			<div class="exec">
				게시판: <span><%=counter %></span>건
			</div>
			
			<div class="plus">
				<input type="button" id="more" value="글쓰기" />
			</div>
		</div>	
	</body>
</html>


<!-- --------DB -->
<!-- 1. 게시판 테이블 생성 (구조 잡고 생성, 항목 5개 이상) -->

<!-- --------Java -->
<!-- 2. VO 작성 (테이블 구조) -->
<!-- 3. DAO 작성 (등록, 전체조회, 부분조회) + (수정, 삭제) -->

<!-- --------Front -->
<!-- 4. '게시판 상세페이지' 만들기 (해당되는 상세한 내용, 입력) -->
<!-- 5. 입력 클릭 시, 나올 '입력Form' 생성 -->