

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
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
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
		  String sql="delete from menu where code=?";
		  //String sql="insert into roomajax(roomcode,name,type,howmany,howmuch) "+
		  //				"values(seq_roomajax.nextval,?,?,?,?)";
		  String result_flag="";
		  
		  try {
		  Class.forName("oracle.jdbc.driver.OracleDriver"); 		  
		   conn=DriverManager.getConnection(url,userid,passcode); 
		   pstmt=conn.prepareStatement(sql);
		   
		   
		   pstmt.setInt(1,Integer.parseInt(request.getParameter("_menucode")));
		  
		   
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
