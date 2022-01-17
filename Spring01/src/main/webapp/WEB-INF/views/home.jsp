<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
   <title>Home</title>
</head>
<body>
<%-- <c:if test="${id==null}"> --%>
<!-- <a href="/edu/login">로그인</a> -->
<!-- <a href="/edu/signon">회원가입</a> -->
<%-- </c:if> --%>

<%-- <c:if test="${id!=null }"> --%>
<%-- ${id} &nbsp;&nbsp;<a href='/edu/logout'>로그아웃</a> --%>
<%-- </c:if> --%>
<h1>${userid}</h1><br>
<h1>${passcode}</h1>
</body>

</html>