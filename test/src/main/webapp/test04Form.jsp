<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="member.Member"/>
<form action=test04Pro.jsp>
		<h1>회원 입력 폼</h1>
		<hr>
		<table>
			<tr>
				<td>아이디 : <input type=text name=userid></td>
			</tr>
			<tr>
				<td>이름 : <input type=text name=name></td>
			</tr>
			<tr>
				<td>나이 : <input type=text name=age></td>
			</tr>
			<tr>
				<td>전화번호 : <input type=text name=phone></td>
			</tr>
			<tr>
			<td><input type=submit value=입력완료></td>
			</tr>
		</table>
	</form>
</body>
</html>