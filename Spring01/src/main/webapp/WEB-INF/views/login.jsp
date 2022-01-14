<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Login</h1>
<form method=GET action="/edu/doLogin" id=frmLogin>
<table>
<tr>
<td>아이디<input type=text id=userid name=userid value=""></td>
</tr>
<tr>
<td>비밀번호<input type=password id=passcode name=passcode value=""></td>
</tr>
<tr>
<td><input type=submit value="로그인"><input type=reset value="취소"></td>
</tr>
</table>
</form>
<img src="animal/cat1.jfif" width='500px'>
</body>
</html>