<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appoval Page</title>
</head>
<body>

<div class="col-md-12">

			<div class="rightside">
				<%!ResultSet set1;%>
				<%
				/* HttpSession s = request.getSession(false);
				String user = (String) s.getAttribute("user");
				float M;

				if (user != null) { */
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee_manager", "root", "");
				PreparedStatement ps = con.prepareStatement("Select * from admin_user");
				/* set1 = ps.executeQuery(ResultSet.TYPE_SCROLL_SENSITIVE); */
				set1 = ps.executeQuery();
				ResultSetMetaData h = set1.getMetaData();
				%>
				<h2 style="text-align: center;" class="mt-3 my-3 text-uppercase"><%=h.getTableName(1)%></h2>
				<table id="myTable" class="table table-success table-striped mt-3 ">

					<tbody>

						<tr>
							<th class="text-uppercase">Sr.no</th>
							<%
							for (int i = 1; i <= h.getColumnCount(); i++) {
								if (i == 1 || i == 7) {
									continue;
								} else {
									String cnm = "";
									if (i == 6) {
								cnm = h.getColumnName(i);
								cnm += " / month";

									} else if (i == 2) {
								cnm = "Employee Name";
									} else {
								cnm = h.getColumnName(i);
									}
							%>
							<th class="text-uppercase"><%=cnm%></th>
							<%
							}
							}
							%>
							<th>EDIT</th>
							<th>DELETE</th>
						</tr>
						<%
						int records = -1;
						while (set1.next()) {
							records++;
							int tmp = records;
						%>
						<tr class="selected">

							<td><%=tmp + 1%></td>
							
							<td class="d-none"><%=set1.getInt("emp_id")%></td>
							<!-- it will not visible beacuse its not permitted to updated -->
							<td><%=set1.getString("emp_name")%></td>
							<td><%=set1.getString("gender")%></td>
							<td><%=set1.getString("mobile_no")%></td>
							<td><%=set1.getString("Department")%></td>
							<td><%=set1.getDouble("salary")%></td>
							<td>
								<button type="button" class="btn btn-primary btn-update"
									data-bs-toggle="modal" id="btnEdit" data-bs-target="#frmEdit"
									data-bs-whatever="@mdo">Edit</button>
							</td>
							<!--  <td><button	class="btn btn-outline-secondary text-uppercase">edit</button></td>-->
							<td><form action="srvDelete? method="get">
									<input type="hidden"id="idD" name="emp_Id" class="d-none" value="<%=set1.getInt("emp_id") %>"> 
									<button  type="submit"
										class="btn btn-outline-danger text-uppercase">Delete</button>
								</form></td>
							<br>
						</tr>
						<%
						}
						/* } */
						/*  else { */

						/* response.sendRedirect("login.html");
						} */
						%>

					</tbody>
				</table>

			</div>
		</div>

</body>
</html>