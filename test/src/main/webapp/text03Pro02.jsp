<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 확인</h1><hr>
<table>
<tr><td>아이디 : <%=session.getAttribute("text") %></td></tr>
<tr><td>비밀번호 : <%=session.getAttribute("password") %></td></tr>
</table>
</body>
<script>
alert("aaa1111님 환영합니다.");
</script>
</html>