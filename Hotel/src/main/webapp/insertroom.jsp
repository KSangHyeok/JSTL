<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>

<%!
  Connection conn=null;
  PreparedStatement pstmt=null;
 
  String url="jdbc:oracle:thin:@localhost:1521:orcl";
 
  String userid="ora_user";
  String passcode="human123";
  String sql="insert into room values(seq_room.nextval,?,?,?,?)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
// 	if(request.getParameter("name")==null || request.getParameter("math")==null ||
// 			request.getParameter("korean")==null){
// 		out.println("적절한값이 주어지지않았습니다");
// 		return;
// 	}
   Class.forName("oracle.jdbc.driver.OracleDriver"); 
   conn=DriverManager.getConnection(url,userid,passcode); //
   pstmt=conn.prepareStatement(sql);
   
   pstmt.setString(1,request.getParameter("name"));
   pstmt.setInt(2,Integer.parseInt(request.getParameter("type")));
   pstmt.setInt(3,Integer.parseInt(request.getParameter("howmany")));
   pstmt.setInt(4,Integer.parseInt(request.getParameter("howmuch")));
   
   pstmt.executeUpdate(); 
} catch(Exception e){
   e.printStackTrace();
} finally {
   if(pstmt!=null) pstmt.close();
   if(conn!=null) conn.close();
//    request.getRequestDispatcher("controlmenu.jsp").forward(request,response);
	response.sendRedirect("controlroom.jsp");
}
%>
</body>
</html>