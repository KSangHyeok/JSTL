<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

String url="jdbc:oracle:thin:@localhost:1521:orcl"; 
String userid="ora_user";
String passcode="human123";
String sql="select * from room order by roomcode";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   table{
      border-collapse:collapse;  
         
   }
   td{
/*        border:2px solid red;  */
      border-style: dotted;
       background-color:yellow;
     
   }
   *{
      font-family: 'Gowun Batang', serif;
   }
   input{
   	  background-color:black;
   	  color:white;
   }
</style>
<body>
<table>
<thead>
	<tr><th>객실코드</th><th>객실이름</th><th>객실타입</th><th>객실인원</th><th>객실가격</th></tr>
</thead>
<tbody>
<%
try{
   Class.forName("oracle.jdbc.driver.OracleDriver");  
   conn=DriverManager.getConnection(url,userid,passcode); 
   stmt=conn.createStatement(); 
   rs=stmt.executeQuery(sql); 
   while(rs.next()){
	  int roomcode=rs.getInt("roomcode");
      String name=rs.getString("name");
      int type=rs.getInt("type");
      int howmany=rs.getInt("howmany");
      int howmuch=rs.getInt("howmuch");
      out.println("<tr><td>"+roomcode+"</td><td>"+name+"</td><td>"+type+"</td><td>"+howmany+"</td><td>"+
      				howmuch+"</td></tr>");
   }
} catch(Exception e){
   e.printStackTrace();
} finally{
   if(rs!=null) rs.close();
   if(stmt!=null) stmt.close();
   if(conn!=null) conn.close();
}
%>
</tbody>
</table>
<form method="GET" action="" id=frmroom>
<table>
<tr>
	<td>객실코드</td><td><input type=number id=roomcode name=roomcode></td>
</tr>
<tr>
	<td>객실명</td><td><input type=text id=name name=name></td>
</tr>
<tr>
	<td>객실타입</td><td><input type=number id=type name=type></td>
</tr>
<tr>
	<td>숙박인원</td><td><input type=number id=howmany name=howmany></td>
</tr>
<tr>
	<td>숙박비용</td><td><input type=number id=howmuch name=howmuch></td>
</tr>
<tr>
	<td align=center><input type=submit value='전송'></td><td align=center><input type=reset value='비우기'></td>
</tr>
</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmroom',function(){
	if($('#roomcode').val()!=''){
		if($('#name').val()=='' && $('#type').val()=='' && $('#howmany').val()=='' && $('#howmuch').val()==''){
			$('#frmroom').prop('action','deleteroom.jsp');
		}else{
			$('#frmroom').prop('action','updateroom.jsp');
		}
	}else if($('#roomcode').val()==''){
		if($('#name').val()!='' && $('#type').val()!='' && $('#howmany').val()!='' && $('#howmuch').val()!=''){
			$('#frmroom').prop('action','insertroom.jsp');
		}
	}
})
</script>
</html>
