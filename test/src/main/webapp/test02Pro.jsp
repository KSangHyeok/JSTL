<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test02 처리</title>
</head>
<style>
table {border-collapse:collapse;}
td {border:1px solid black;}
</style>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	%>
	<table>
		<tr>
			<td>이름</td>
			<td>
			<%=request.getParameter("name")%><br>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
			<%=request.getParameter("age")%><br>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
			<%=request.getParameter("number")%><br>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
			<%=request.getParameter("adress")%><br>
			</td>
		</tr>
	</table>
</body>
</html>