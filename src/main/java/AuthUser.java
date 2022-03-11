

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AuthUser
 */
@WebServlet("/AuthUser")
public class AuthUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AuthUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 RequestDispatcher r=request.getRequestDispatcher("CatcheDistroyer");
		 r.include(request, response);
		 response.setContentType("text/html");
		String usr=request.getParameter("user");
		String pwd=request.getParameter("password");
		int cnt=validateuser(usr, pwd);
//		if(user.equals(usr) && pass.equals(pwd))
		if(cnt>0)
		{
			HttpSession session=request.getSession();
			session.setAttribute("user", usr);
			response.sendRedirect("index.jsp");
		}
		else	
		{
			response.getWriter().write("<h2 id=\"msg\" style='border:1px solid #fff; margin:10px; color:black;text-align:center;margin:10px margin-top:15px;;padding:10px; display:flex; align-item=center;'> Invalid credential.!</h2></div>");
			
			RequestDispatcher rd = request.getRequestDispatcher("NewLogin.html");
			
			rd.include(request, response);
			

		}
	}


	private int  validateuser(String name,String pass)
	{
		Connection con;
		PreparedStatement ps;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/employee_manager", "root", "");
			ps = con.prepareStatement("Select count(*) as res from admin_user where user=? and password=?");
			ps.setString(1, name);
			ps.setString(2, pass);
			ResultSet set = ps.executeQuery();
			if(set.next())
			{
				return set.getInt(1);
			}

		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return 0;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
