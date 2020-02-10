<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"
	description="원하는 곱셈표를 출력"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="begin" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="end" rtexprvalue="true" type="java.lang.Integer"%>

<jsp:doBody var="bodyData" />

<%
	String str = "background: #";
	for (int i = 0; i < 6; i++) {
		str += Integer.toHexString((int) (Math.random() * 4) + 11);
	}
%>

<c:set var="str" value="" />

<c:if test="${empty begin }">
	<c:set var="begin" value="2" />
</c:if>

<c:if test="${empty end }">
	<c:set var="end" value="9" />
</c:if>

<c:set var="result" value="0" />
<c:forEach var="i" begin="${begin }" end="${end }" step="1">
	<tr>
		<td style="<%=str%>">${i }단</td>
		<c:forEach var="j" begin="1" end="9" step="1">
			<c:set var="result" value="${i*j }" />
			<td>${i }* ${j } = ${result }</td>
		</c:forEach>
	</tr>
</c:forEach>
