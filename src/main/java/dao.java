import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dao
{
	static String url=null,user,pass;
	public dao(String url,String user,String pass) 
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      this.url=url;
      this.user =user;
      this.pass=pass;
	} 
	
	public Connection getConnetion()
	{
		Connection con=null;
		try 
		{
		   return DriverManager.getConnection(url,user,pass);
		   
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	 public ResultSet getData(String qry)
	 {
		 ResultSet s=null;
	        try{ Class.forName("com.mysql.jdbc.Driver");
			 Connection co=DriverManager.getConnection("jdbc:mysql://localhost/employee_manager","root","");
	         PreparedStatement ps=co.prepareStatement(qry);
	         s=ps.executeQuery();
	         return s;	
	        }
	        catch(Exception e)
	        {
	        	e.printStackTrace();        }
	        finally
	        {
	        	
	        }
		 
		 return s;
	 }
}
