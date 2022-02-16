<%@page import="java.net.http.HttpRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="userTracker.jsp" %>
	

<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<link rel="stylesheet" href="style.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg  navbar-dark bg-primary ">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">Dashboard</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="EmployeeData.jsp">Employee</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="AddEmployee.jsp">Add Employee</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="MonthWise.jsp">MonthWise(salary)</a></li>
					<li class="nav-item">
					<form action="departmentPopuoModal.jsp">
						<button type="submit" class="btn btn-dark btn-update"
							data-bs-toggle="modal" id="btnEdit" data-bs-target="#daprt"
							data-bs-whatever="@mdo">Department Wise report</button> </form>
					</li>
				</ul>
                 <form class="d-flex mx-2" action="employee_search.jsp" method="post">
                    <input class="input mx-2 text-white" name="mobile_no" placeholder="Enter mobile of employee" />
					<input class="btn btn-success" value="Search" type="submit">
				</form>
				<form class="d-flex" action="SessionDestroy" method="post">
					<input class="btn btn-dark" value="Logout" type="submit">
				</form>
			</div>
		</div>
	</nav>


 <%-- <div class="modal fade" id="daprt" tabindex="-1"
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
									<option>Select Department</option>
									<%
								try
								{
									Class.forName("com.mysql.jdbc.Driver");
									Connection co=DriverManager.getConnection("jdbc:mysql://loaclhost:3306/employee_manager","root","");
								    PreparedStatement ps=co.prepareStatement("Select * from department_table");
								    ResultSet set=ps.executeQuery();
								    while(set.next())
								    {
								    	%>
									<option value="<%=set.getString("department")%>"><%=set.getString("department")%></option>
									<%
								    }
								}
								catch (Exception ex)
								{
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
	
 --%>
</body>