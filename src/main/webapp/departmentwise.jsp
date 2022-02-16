<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Department Report</title>
<style>
.totalCnt {
	display: flex;
	justify-content: space-between; border : 1px solid #000;
	width: 200px;
	position: absolute;
	right: 20px;
	top: 50px;
	padding:20px;
	border: 1px solid #000
}
</style>
</head>
<body>
	<div class="rightside">
		<%!ResultSet set,set2;%>
		<%
				float M;
				
					String d=request.getParameter("department");
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee_manager", "root", "");
					PreparedStatement ps = con.prepareStatement("Select * from employee where department=?");
					ps.setString(1, d);
					set = ps.executeQuery();
					PreparedStatement ps2 = con.prepareStatement("Select count(*) as count from employee where department=?");
					ps2.setString(1, d);
					set2=ps2.executeQuery();
					set2.next();
					ResultSetMetaData h = set.getMetaData();
					int count=set2.getInt("count");
					
					
					%>
		<h2 style="text-align: center;" class="mt-3 my-3 text-capitalize"><%=d%>
			report
		</h2>
		<h4 class="text-end m-5 p-2 totalCnt">
			Total count :<%=count %></h4>
		<table id="myTable" class="table table-success table-striped mt-3 ">
			<tbody>
				<tr>
					<th class="text-uppercase">Sr.no</th>
					<%
							String cnm="";
							for (int i = 1; i <= h.getColumnCount(); i++) {
								if (i==2) {
									
									cnm ="Employee Name";
								} else if(i==4) {
									cnm="Mobile No.";
									
								}
								else
								{
									continue;
								}
							%>
					<th class="text-uppercase"><%=cnm%></th>
					<%
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
					<!-- Id,it will not visible beacuse its not permitted to updated -->
					<td class="d-none"><%=set.getInt("emp_id")%></td>
					<td><%=set.getString("emp_name")%></td>
					<td><%=set.getString("mobile_no") %></td>

					<!--  <td><button	class="btn btn-outline-secondary text-uppercase">edit</button></td>-->
					<br>
				</tr>
				<%
						}
 						%>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>