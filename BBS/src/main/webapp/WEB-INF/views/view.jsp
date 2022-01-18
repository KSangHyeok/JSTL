<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
td, th{ border:1px solid blue;}
</style>
<body>
<table style='border-collapse: collapse;'>
<tr><td>제목</td><td><input type=text value="${post.title}" readonly></td></tr>
<tr><td>작성자</td><td><input type=text value="${post.name}" readonly></td></tr>
<tr><td>내용</td>
<td><textarea id=content name=content rows=10 cols=50 readonly>${post.content}</textarea><tr>
<td colspan=2> <input type=button id=btnCancel name=btnCancel value='목록보기'></td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnCancel',function(){
	document.location='/ncs7/list';
	return false;
})
;

</script>
</html>