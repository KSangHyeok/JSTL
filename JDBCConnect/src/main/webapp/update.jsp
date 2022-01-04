<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
  Connection conn=null;
  PreparedStatement pstmt=null;
  // insert 할땐 resultset 이 필요없음, statement도 preparedStatement 로 써야함  
  
  String url="jdbc:oracle:thin:@localhost:1521:orcl";
  //1521 DB서버로 접속 이 url이 무조건 있어야함 **
  String userid="ora_user";
  String passcode="human123";
  String sql="update menu set name=?,price=? where name=?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//update.jsp?newname=africabean&price=3000&name=americano
try{
// 	if(request.getParameter("name")==null || request.getParameter("price")==null ||
// 			request.getParameter("name")==request.getParameter("newname")){
// 		out.println("적절한값이 주어지지않았습니다");
// 		return;
// 	}
   Class.forName("oracle.jdbc.driver.OracleDriver"); // driver (ojdbc6.jar)
   conn=DriverManager.getConnection(url,userid,passcode); // db접속에 실패하면 null이 나옴
   pstmt=conn.prepareStatement(sql);
   
   pstmt.setString(1,request.getParameter("newname"));
   pstmt.setInt(2,Integer.parseInt(request.getParameter("price")));
   pstmt.setString(3,request.getParameter("name"));
   
   pstmt.executeUpdate();  // insert 할때 필요한 실행코드
} catch(Exception e){
   e.printStackTrace();
} finally {
   if(pstmt!=null) pstmt.close();
   if(conn!=null) conn.close();
//    request.getRequestDispatcher("controlmenu.jsp").forward(request,response);
   response.sendRedirect("controlmenu.jsp");
}
%>
</body>
</html>