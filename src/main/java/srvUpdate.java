

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class srvUpdate
 */
@WebServlet("/srvUpdate")
public class srvUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public srvUpdate() {
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
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		String emp_name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String mobile_no=request.getParameter("mobile_no");
		String dept=request.getParameter("department");
		float salary=Float.parseFloat(request.getParameter("salary"));
		float y_salary=salary*12;
		dao d=new dao("jdbc"
				+ ":mysql:"
				+ "//localhost/employee_manager",
				"root","");
		Connection con = d.getConnetion();
		try {
			
			Statement stp = con.createStatement();
			 String UniqInsertRecords="INSERT INTO department_table (department) SELECT * FROM (SELECT '"+dept+"'AS department)"
			 		           + " AS temp WHERE NOT EXISTS (SELECT department FROM department_table WHERE department = '"+dept+"') LIMIT 1";
			stp.executeUpdate(UniqInsertRecords);
			PreparedStatement ps = con.prepareStatement("update employee set emp_name=?,gender=?,mobile_no=?,department=?,salary=?,yearly_salary=? where emp_id=?");
			ps.setString(1,emp_name);
			ps.setString(2, gender);
			ps.setString(3, mobile_no);
			ps.setString(4, dept);
			ps.setFloat(5, salary);
			ps.setFloat(6, y_salary);
			ps.setInt(7, id);
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
		else
		{
			response.sendRedirect("login.html");
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
