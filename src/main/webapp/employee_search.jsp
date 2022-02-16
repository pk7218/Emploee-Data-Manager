<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<%@include file="navbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student data</title>
<link href="style.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
tbody tr td, th {
	padding: 8px;
	border: 1px solid black;
}

.a, .a:hover {
	text-decoration: none;
	color: #fff;
	cursor: pointer;
}

.modal-header {
	background: #0B5ED7;
	color: #fff;
}

/* .custom-color {
	background: #42BBFC;
}

th {
	color: black;
}

table {
	align-self: center;
	margin-top: -50px;
} */
</style>

</head>
<body>

	<div class="row container-fluid">

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
				PreparedStatement ps = con.prepareStatement("Select * from employee where mobile_no=?");
				/* set1 = ps.executeQuery(ResultSet.TYPE_SCROLL_SENSITIVE); */
				ps.setString(1, request.getParameter("mobile_no"));
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
							<td><form action="srvDelete" method="get">
									<input id="idD" name="emp_Id" class="d-none">
									<button id="btnDelete"
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


		<div class="modal fade" id="frmEdit" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Edit Detail..!</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<form action="srvUpdate" method="post">
							<div class="mb-3 d-none">
								<label for="id" class="col-form-label text-dark">Id</label> <input
									type="text" name="id" class="form-control" id="id">
							</div>
							<div class="mb-3">
								<label for="employee-name" class="col-form-label text-dark">Name:</label>
								<input type="text" name="name" class="form-control"
									id="employee-name">
							</div>
							<div class="mb-3">
								<label class="col-form-label text-dark">Gender:</label> <input
									name="gender" id="gender" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label for="Mob_no" class="col-form-label text-dark">Mobile
									No:</label> <input name="mobile_no" type="text" class="form-control"
									id="mobile_no">
							</div>
							<div class="mb-3">
								<label for="department" class="col-form-label text-dark">Department:</label>
								<input name="department" type="text" class="form-control"
									id="department">
							</div>
							<div class="mb-3">
								<label for="Salary" class="col-form-label text-dark">Salary:</label>
								<input type="text" style="text-align: left !important;"
									name="salary" class="form-control" id="salary">
							</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			// code to read selected table row cell data (values).
			$("#myTable").on('click', '#btnEdit', function() {
				// get the current row
				let currentRow = $(this).closest("tr");
				let id = currentRow.find("td:eq(1)").text();//this will for for hidden field
				let employee = currentRow.find("td:eq(2)").text(); // get current row 1st TD value(eloyee)
				let gender = currentRow.find("td:eq(3)").text(); // get current row 2nd TD
				let mobile_no = currentRow.find("td:eq(4)").text();
				let dept = currentRow.find("td:eq(5)").text(); // get current row 1st TD value
				let salary = currentRow.find("td:eq(6)").text(); // get current row 2nd TD
				$("#id").val(id);
				$("#employee-name").val(employee);
				$("#gender").val(gender);
				$("#mobile_no").val(mobile_no);
				$("#department").val(dept);
				$("#salary").val(salary);

			});

			
		});
		
		$("#myTable").on('click', '#btnDelete', function() {
			let currentRow = $(this).closest("tr");
			let id = currentRow.find("td:eq(1)").text();
			$("#idD").val(id);

		});
		

		/*
		function tbl()
		{
			
		
			var table=getElementById('myTable');
			for(int i=0;i<table.rows.length;i++)
				{
				
				  table.rows[i].onclick=function()
				  {
					 	  rIndex=table.rowsIndex;
					 	alert( table.cells(1).innnerHTML;)
					 	alert( table.cells(2).innnerHTML;)
					 	alert( table.cells(3).innnerHTML;)
					 	alert( table.cells(4).innnerHTML;)
					 	
					 	alert(rIndex)
					 	alert( this.cells().innnerHTML;)
					 	alert( this.cells(1).innnerHTML;)
					 	
						  document.getElementById("name").value=this.cells(1).innnerHTML.text;
						  document.getElementById("gender").value=this.cells(2).innnerHTML.text;
						  document.getElementById("mobile_no").value=this.cells(3).innnerHTML.text;
						  document.getElementById("department").value=this.cells(4).innnerHTML.text;
						  document.getElementById("salary").value=this.cells(5).innnerHTML.text;
				  }
				}
		
		} */
	</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>  

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>