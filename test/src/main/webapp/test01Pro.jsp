<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test01 처리</title>
</head>
<body>
<h1>원의 면적/원의 둘레를 계산합니다.</h1><hr>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>

<%
double r=Double.parseDouble(request.getParameter("number"));
double pi=3.14;
double n=(r*pi);
double m=Math.pow(n,2);

%>
반지름:<%=r%><br>
원의 면적:<%=m%><br>
원의 둘레:<%=n%><br>
</body>
</html>