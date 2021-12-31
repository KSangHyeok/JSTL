<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:set var="now" value="<%=new java.util.Date() %>" /> --%>
<%-- <c:out value="${now}" /> --%>
<%-- <jsp:useBean id="now" class="java.util.Date" /> --%>
<%-- <c:out value="${now}" /> --%>
<%-- <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초" /> --%>
default:<c:out value="${now}" /><br>
Korea KST: <fmt:formatDate value="${now}"
			type="both" dateStyle="full" timeStyle="full" /><br>
		<fmt:timeZone value="GMT">
Korea GMT: <fmt:formatDate value="${now}"
			type="both" dateStyle="full" tymeStyle="full" /><br>
		</fmt:timeZone>
	<fmt:tumeZone value="GMT-8">
Korea GMT-8: <fmt:formatDate value="${now}"
			type="both" dateStyle="full" timeStyle="full" /><br>
	</fmt:tumeZone>
</body>
</html>