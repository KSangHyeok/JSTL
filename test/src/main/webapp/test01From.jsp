
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test01 폼</title>
</head>
<body>
<form method=GET action=test01Pro.jsp>
	<h1>원의 면적/원의 둘레 계산 프로그램</h1>
	<table>
		<tr>
			<td>반지름입력:<input type=text id=number name=number></td><td><input type=submit value="계산"></td>
		</tr>

	</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit',function(){
	$('#number').val();
	return true;
})
</script>
</html>