<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless" 
description="두 수의 합 구하기"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="begin" required="true" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="end" required="true" rtexprvalue="true" type="java.lang.Integer"%>

<%--
<%@ variable name-given="sum" variable-class="java.lang.Integer" scope="NESTED"%>
<c:set var="sum" value="0" ></c:set>
<c:forEach var="addNum" begin="${begin }" end="${end }" step="1">
	<!--만든 변수의 값을 변경하는데 c:set 사용-->
	<c:set var="sum" value="${sum + addNum }" />
</c:forEach>
<!--
<div>
	${begin }에서 ${end }까지의 합 : ${sum }
</div> 
-->
<jsp:doBody />
 --%>

<%@ variable name-given="beginValue" variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="endValue" variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="sum" variable-class="java.lang.Integer" scope="AT_END"%>

<%
	int sum = 0;
	for(int i=begin; i<=end; i++){
		sum+=i;
	}
	
	this.getJspContext().setAttribute("beginValue", begin);
	this.getJspContext().setAttribute("endValue", end);
	this.getJspContext().setAttribute("sum", sum);
%>

