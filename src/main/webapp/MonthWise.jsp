<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<title></title>
</head>
<body>
	<div class="rightside">
				
				<%
				
				float M;
				
				/* if (user != null) { */
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee_manager", "root", "");
					PreparedStatement ps = con.prepareStatement("Select * from employee");
					ResultSet set = ps.executeQuery();
					ResultSetMetaData h = set.getMetaData();
					
				%>
				<h2 style="text-align: center;" class="mt-3 text-uppercase">Salary Report</h2>
				<table id="myTable" class="table table-success table-striped">

					<tbody>

						<tr>
							<th class="text-uppercase">Sr.no</th>
							<%
							
							for (int i = 1; i <= h.getColumnCount(); i++) {
								if (i==1||i==3||i==5) {
									continue;
								} else {
									String cnm = "";
									if (i == 6) {
								cnm = h.getColumnName(i);
								cnm += " / month";

									} 
									else if (i == 2) {
								cnm = "Employee Name";
									}
									else {
								cnm = h.getColumnName(i);
									}
							%>
							<th class="text-uppercase"><%=cnm%></th>
							<%
							}
							}
							%>
							
						</tr>
						<%
						int records = -1;
						while (set.next()) {
							records++;
							int tmp = records;
						%>
						<tr class="selected">

							<td><%=tmp + 1%></td>
							<td class="d-none"><%=set.getInt("emp_id")%></td>
							<!-- it will not visible beacuse its not permitted to updated -->
							<td><%=set.getString("emp_name")%></td>
							
							<td><%=set.getString("mobile_no")%></td>
							
							<td><%=set.getDouble("salary")%></td>
							<td><%=set.getDouble("yearly_salary")%></td>
							
							<!--  <td><button	class="btn btn-outline-secondary text-uppercase">edit</button></td>-->
							
							<br>
						</tr>
						<%
						}
         				/* } */
						/* else {
							
						response.sendRedirect("login.html");
						} */
 						%>

					</tbody>
				</table>

			</div>
		</div>
</body>
</html>