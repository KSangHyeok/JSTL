<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body align=center>
<form method=post action='/ncs7/modify' id=frmModify>
<input type=hidden id=post_id name=post_id value="${post.id}">
<table style='border-collapse: collapse;' align=center>
<tr><td>제목</td><td><input type=text value="${post.title}" id=title name=title></td></tr>
<tr><td>작성자</td><td><input type=text value="${post.name}" id=name name=name></td></tr>
<tr><td>내용</td>
<td><textarea id=content name=content rows=10 cols=50>${post.content}</textarea>
<tr>
	<td><input type=button id=btnCancel name=btnCancel value='목록보기'></td>
	<td align=right>
		<input type=submit id=btnFinish name=btnFinish value='수정완료'>
		<input type=button id=btnList name=btnList value='취소'></td>	
</tr>
</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnCancel,#btnList',function(){
	document.location='/ncs7/list';
	return false;
})
.on('submit','#frmModify',function(){
	$('#post_id').val($.trim($('#post_id').val()));
	if($('#post_id').val()==''){
		alert('게시물 번호가 없습니다.');
		return false;
	}
	$('#title').val($.trim($('#title').val()));
	$('#name').val($.trim($('#name').val()));
	$('#content').val($.trim($('#content').val()));
	if($('#title').val()=='' || $('#name').val()=='' || $('#content').val()==''){
		alert('비어있는 입력란이 있습니다.');
		return false;
	}
	return true;
})
;
// update mvc_board set title='',name='',content='' where id=x
</script>
</html>