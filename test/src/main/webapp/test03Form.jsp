<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method=GET action=test03Pro.jsp>
<h1>로그인 폼</h1><hr>

<table>
<tr><td>아이디 : <input type=text id=text name=text></td></tr>
<tr><td>비밀번호 : <input type=password id=password name=password></td></tr>
<tr><td><input type=submit value='로그인'><input type=reset value='취소'></td></tr>
</table>
</form>
</body>

<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit',function(){
	if($('#text').val()=="aaa1111" && $('#password').val()=="1234"){		
		return true;
	}
})
</script>
</html>