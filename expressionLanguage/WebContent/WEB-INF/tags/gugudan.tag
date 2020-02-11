<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"
	description="원하는 곱셈표를 출력"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="begin" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="end" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="color" rtexprvalue="true" type="java.lang.String"%>

<%-- 태그의 몸체를 가져온다. (JspFragment 객체와 같다.) --%>
<jsp:doBody var="bodyData" />

<%-- attribute 디렉티브는 pageContext에 속성값을 설정하는 것 --%>
<%
	JspContext jc = this.getJspContext();

	String str = "background: ";
	if(jc.getAttribute("color")==null){
		str += "#";
		for (int i = 0; i < 6; i++) {
			str += Integer.toHexString((int) (Math.random() * 4) + 11);
		}
	}else{
		str += jc.getAttribute("color").toString();
	}
%>

<c:if test="${empty begin }">
	<c:set var="begin" value="2" />
</c:if>

<c:if test="${empty end }">
	<c:set var="end" value="9" />
</c:if>


<h3>${bodyData }</h3>
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
