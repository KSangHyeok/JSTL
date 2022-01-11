<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>
<jsp:useBean id="member" class="member.Member"/>
<jsp:setProperty name="member" property="userid" />
<jsp:setProperty name="member" property="name" />
<jsp:setProperty name="member" property="age" />
<jsp:setProperty name="member" property="phone" />
	<table border="1">
		<tr>
			<td colspan=2 width=700px>회원 정보 확인</td>
					</tr>
		<tr>
			<td width=50%>회원아이디</td>
			<td>
				<jsp:getProperty name="member" property="userid" />
			</td>
		</tr>
		<tr>
			<td>회원 이름</td>
			<td>
				<jsp:getProperty name="member" property="name" />
			</td>
		</tr>
		<tr>
			<td>회원 나이</td>
			<td>
				<jsp:getProperty name="member" property="age" />
			</td>
		</tr>
		<tr>
			<td>회원 전화</td>
			<td>
				<jsp:getProperty name="member" property="phone" />
			</td>
		</tr>
	</table>
</body>
</html>