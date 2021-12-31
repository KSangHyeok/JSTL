<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:if test="${param.color==1}"> --%>
<!-- 	<span style="color:red">빨강</span> -->
<%-- </c:if> --%>
<%-- <c:if test="${param.color==2}"> --%>
<!-- 	<span style="color:green">초록</span> -->
<%-- </c:if> --%>
<%-- <c:if test="${param.color==3}"> --%>
<!-- 	<span style="color:blue">파랑</span> -->
<%-- </c:if> --%>
<%-- <c:if test="${param.color==4}"> --%>
<!-- 	<span style="color:black">까망</span> -->
<%-- </c:if> --%>
<%-- <c:if test="${param.color==null}"> --%>
<!-- 	<span style="color:purple">파라미터없음</span> -->
<%-- </c:if> --%>

<%-- <c:choose> --%>
<%-- 	<c:when test="${param.color==1}" > --%>
<!-- 		<span style="color:red">빨강</span> -->
<%-- 	</c:when> --%>
<%-- 	<c:when test="${param.color==2}" > --%>
<!-- 		<span style="color:green">초록</span> -->
<%-- 	</c:when> --%>
<%-- 	<c:when test="${param.color==3}" > --%>
<!-- 		<span style="color:blue">파랑</span> -->
<%-- 	</c:when> --%>
<%-- 	<c:when test="${param.color==''}" > --%>
<!-- 		<span style="color:black">까망</span> -->
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<!-- 		<span style="color:purple">파라미터 없음</span> -->
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>

<c:catch var="errmsg">
	<c:out value="Hello World" /><br>
	<c:out value="Good Morning Vietname" /><br>
	<c:out value="${1/0}" /><br>
	<%=1/0 %>
	<c:out value="GoodBye Yellow Brick Road" /><br>
</c:catch>
Error:[<c:out value="${errmsg}" />]

<%-- <c:set var="n" value="http://xaexal.cafe24.com/ncs/ncs.php?class=ncs7?name="/> --%>
<%-- <c:out value="${n}" default="7"/> --%>

<%-- <c:url value="http://www.oracle.com" var="oracle" /> --%>
<%-- <c:out value="${oracle}" /> --%>
<%-- <c:redirect url="${n}" /> --%>
</body>
</html>