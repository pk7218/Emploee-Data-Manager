import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class srvDelete
 */
@WebServlet("/srvDelete")
public class srvDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public srvDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session=request.getSession(false);
		String user=(String)session.getAttribute("user");
		if(user!=null)
		{
		
		int id=Integer.parseInt(request.getParameter("emp_Id"));
         System.out.println(request.getParameter("emp_Id"));
		dao d=new dao("jdbc"
				+ ":mysql:"
				+ "//localhost/employee_manager",
				"root","");
		Connection con = d.getConnetion();
		try {
			PreparedStatement ps = con.prepareStatement("delete from  employee where emp_id=?");
			ps.setInt(1, id);
			int flg= ps.executeUpdate();
			if(flg==0)
			{
				response.sendRedirect("EmployeeData.jsp?flg= "+flg);
			}
			else
			{
				response.sendRedirect("EmployeeData.jsp?flg= "+flg);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else {
			session.invalidate();
			response.sendRedirect("login.html");
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
