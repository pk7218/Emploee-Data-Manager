<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<%@page import="java.sql.*"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<style>
#sltColor
{
color:black;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="d-flex justify-content-center bg-light mt-5 p-5">
	<form action="departmentwise.jsp" class="p-5" style="border: 1px solid black;">
		     <label>Department:</label><br>
		     <select name="department">
			<option id="sltColor">Select Department</option>
			<%
          Class.forName("com.mysql.jdbc.Driver");
										Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_manager", "root", "");
										PreparedStatement prepareds = connection.prepareStatement("Select * from department_table");
										ResultSet resultset = prepareds.executeQuery();
										
										while (resultset.next()) {
											%>

			<option style="color:black!important" value="<%=resultset.getString("department")%>"><%=resultset.getString("department")%></option>
			<%
											}
										 %>

		</select>

		<button type="submit" class="btn btn-dark btn-update">Report</button>
	</form>
	
	
	</div>
	



	<%-- <div class="d-flex justify-content-center">
		<button type="button"
			class="btn btn-dark btn-update mt-5 d-flex justify-content-center"
			data-bs-toggle="modal" id="btnEdit" data-bs-target="#daprt"
			data-bs-whatever="@mdo">Department Wise report</button>
		<div class="modal fade" id="daprt" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Dapartment
							Detail..!</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="departmentwise.jsp" method="post">

							<div class="mb-3">
								<div class="input-grp mt3">
									<select name="department"
										style="border: 1px solid black; color: #000;">

										<%
										try {
										%>
										<option>Select Department</option>
										<%
										Class.forName("com.mysql.jdbc.Driver");
										Connection connection = DriverManager.getConnection("jdbc:mysql://loaclhost:3306/employee_manager", "root", "");
										PreparedStatement prepareds = connection.prepareStatement("Select * from department_table");
										ResultSet resultset = prepareds.executeQuery();
										while (resultset.next()) {
										%>
										<option value="<%=resultset.getString("department")%>"><%=resultset.getString("department")%></option>
										<%
										}
										} catch (Exception ex) {
										/* FileWriter file=new FileWriter("Error_log.text",true);
										try
										{
											
										    file.write(ex.getStackTrace()+"  date and time: "+new SimpleDateFormat("yyyy-MM-dd,HH:mm:ss").format(Calendar.getInstance().getTime()));

										}
										catch(Exception e)
										{
											file.write(ex.getStackTrace()+"  date and time: "+new SimpleDateFormat("yyyy-MM-dd,HH:mm:ss").format(Calendar.getInstance().getTime()));
											file.close();	
										} */
										}
										%>
									</select>

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
		
		 --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>