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
String sql="select * from menu";

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
      border:2px solid black;
   }
   *{
      font-family: 'Gowun Batang', serif;
   }
</style>
<body>
<table>
<thead>
	<tr><th>메뉴명</th><th>가격</th></tr>
</thead>
<tbody>
<%
try{
   Class.forName("oracle.jdbc.driver.OracleDriver");  
   conn=DriverManager.getConnection(url,userid,passcode); 
   stmt=conn.createStatement(); 
   rs=stmt.executeQuery(sql); 
   while(rs.next()){      
      String name=rs.getString("name");
      int price=rs.getInt("price");     
      out.println("<tr><td>"+name+"</td><td>"+price+"</td></tr>");
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
<form method="GET" action="" id=frmMenu>
<table>
<tr>
	<td>현재메뉴명</td><td><input type=text id=name name=name></td>
</tr>
<tr>
	<td>메뉴명</td><td><input type=text id=newname name=newname></td>
</tr>
<tr>
	<td>가격</td><td><input type=number id=price name=price></td>
</tr>
<tr>
	<td><input type=submit value='전송'></td><td><input type=reset value='비우기'></td>
</tr>
</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmMenu',function(){
	if($('#name').val()!=''){	// update or delete
		if($('#newname').val()!=''){	//updqte
			//action="update.jsp"
			$('#frmMenu').prop('action','update.jsp');
		// update.jsp?newname=xxxx&name=yyyy&price=wwww
		} else {	//delete
			//action="delete.jsp"
			$('#frmMenu').prop('action','delete.jsp');
		//delete.jsp?newname=&name=xxxx&price=yyyy
		}
	}else {	//insert
		if($('#newname').val()!='' && $('#price').val()!=''){
			// action="addmenu.jsp"
			$('#frmMenu').prop('action','addmenu.jsp');
			//addmenu.jsp?newname=xxxx&price=yyyy
		}else{
			alert('메뉴명과 가격이 모두 입력되어야 합니다.');
			return false;
		}
	}
	return true;	
});
</script>
</html>