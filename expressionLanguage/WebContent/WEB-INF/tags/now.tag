<%@tag import="java.util.Date"%>
<%@tag import="java.text.SimpleDateFormat"%>
<%@ tag language="java" pageEncoding="UTF-8" body-content="tagdependent"
	description="오늘 날짜 출력"%>

<% 
	Date nowDate = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
	String formatDate = dateFormat.format(nowDate);
%>
<div>
	<jsp:doBody /><%=formatDate %>
</div>