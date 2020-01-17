<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title></title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
   </head>
   <body>
      <fieldset>
         <legend><strong>회원정보</strong></legend>
         <table>
            <tr>
               <td>아이디</td>
               <td>&nbsp;<%= request.getParameter("id")%></td>
            </tr>   
            <tr>
               <td>비밀번호</td>
               <td>&nbsp;<%= request.getParameter("pw")%></td>
            </tr>   
            <tr>
               <td>이름</td>
               <td>&nbsp;<%= request.getParameter("name")%></td>
            </tr>   
            <tr>
               <td>성별</td>
               <td>&nbsp;<%= request.getParameter("gender")%></td>
            </tr>   
            <tr>
               <td>생일</td>
               <td>&nbsp;<%= request.getParameter("birth")%></td>
            </tr>   
            <tr>
               <td>이메일</td>
               <td>&nbsp;<%= request.getParameter("email")%></td>
            </tr>   
            <tr>
               <td>전화번호</td>
               <td>&nbsp;<%= request.getParameter("num") + " " + request.getParameter("phone")%></td>
            </tr>   
         </table>
      </fieldset>
   </body>
</html>