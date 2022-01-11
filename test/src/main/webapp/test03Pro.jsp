<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%session.setAttribute("text",request.getParameter("text")); %>
<%session.setAttribute("password",request.getParameter("password")); %>
<%response.sendRedirect("text03Pro02.jsp"); %>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>

</html>