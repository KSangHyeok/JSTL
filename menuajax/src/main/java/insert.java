

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insert
 */
@WebServlet("/insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		  PreparedStatement pstmt=null;
		 
		  String url="jdbc:oracle:thin:@localhost:1521:orcl";		 
		  String userid="ora_user";
		  String passcode="human123";
		  String sql="insert into menu values(seq_menu.nextval,?,?)";
		  //String sql="insert into roomajax(roomcode,name,type,howmany,howmuch) "+
		  //				"values(seq_roomajax.nextval,?,?,?,?)";
		  String result_flag="";
		  
		  try {
		  Class.forName("oracle.jdbc.driver.OracleDriver"); 
		  request.setCharacterEncoding("utf-8");
		  response.setContentType("text/html, charset=utf-8");
		   conn=DriverManager.getConnection(url,userid,passcode); 
		   pstmt=conn.prepareStatement(sql);
		   
		   pstmt.setString(1,request.getParameter("_menuname"));		   		
		   pstmt.setInt(2,Integer.parseInt(request.getParameter("_price")));		  
		   
		   pstmt.executeUpdate(); 
		   result_flag="OK";
		  }catch(Exception e) {
			  result_flag="FAIL";
			  e.printStackTrace();
		  }finally {
			  try {
				   if(pstmt!=null) pstmt.close();
				   if(conn!=null) conn.close();
			  }catch (SQLException e){
				  e.printStackTrace();
			  }
		  }
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
