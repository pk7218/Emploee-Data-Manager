<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<%@ include file="navbar.jsp"%>
<%
String t = request.getParameter("flg");
if (t != null) {
%><
<script>
alert(Records Saved.!);
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddEmployee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
span {
	color: red;
}

.label {
	margin-top: 4px;
}
</style>

</head>
<body>
	<div class="container-fluid" style="background: #CDDCDC;">
		<div class="hero">
			<fieldset style="border: 1px solid white; padding: 18px;">
				<legend style="margin-top: -20px;">Employee Details </legend>
				<form id ="frm"action="srvAddEmployee" method="get">
					<div class="row ">
						<div class="input-grp mt-3">
							<input type="text" class="input mt-1" id="name" name="name"
								style="border: 1px solid black; color: #000;" required>
							<p id="error_name"></p>
							<label for="name" class="label"
								style="color: black; margin-left: 7px;">Full Name.<span>*</span></label>
						</div>
						<div class="input-grp mt-3">
							<input type="text" class="input mt-1" id="dep" name="department"
								style="border: 1px solid black; color: #000;" required>
							<p id="error_dept"></p>
							<label for="dep" class="label"
								style="color: black; margin-left: 7px;">Department<span>*</span></label>
						</div>

						<div class="input-grp mt-3">
							<input type="text" class="input mt-1" id="mobile"
								name="mobile_no" style="border: 1px solid black; color: #000;"
								required>
							<p id="error_mobile"></p>
							<label for="mobile" class="label"
								style="color: black; margin-left: 7px;">Mobile No.<span>*</span></label>
						</div>

						<div class="input-grp mt-3">
							<input type="text" class="input mt-1" id="salary" name="salary"
								style="border: 1px solid black; color: #000;" required>
							<p id="error_salary"></p>
							<label for="salary" class="label"
								style="color: black; margin-left: 7px;">Salary<span>*</span></label>
						</div>
						<div class="input-grp mt-3">
							<select name="gender" id="gender" class="mt-1"
								style="border: 1px solid black; color: #000;">
								<option value="No">Select Gender<span style="color: red;">*</span></option>
								<option value="Male">Male</option>
								<Option value="Female">Female</Option>
							</select>
							<p id="error_gender"></p>
						</div>
						<!-- experiment  -->
						<div class="input-grp mt3 d-none">
							<select name="dep" style="border: 1px solid black; color: #000;">
								<%--  <%
							/* 	dao d = new dao("jdbc:mysql://localhost/employee", "root","");
								Connection con = d.getConnetion(); */
								<%-- Class.forName("com.mysql.jdbc.Driver");
								Connection con=DriverManager.getConnection("jdbc:mysql://localhost/employee_manager","root","");
								PreparedStatement ps = con.prepareStatement("select * from admin_user");
								ResultSet set = ps.executeQuery();
								String dep=null;
								while (set.next())
								{
									
							%>
								<option value=<%=set.getString("department")%>><%=set.getString("department")%></option>
							
						</div>
						<%
						}
						%> --%>
								<option value="HR Department" class="optn">HR
									Department</option>
								<option value="HR Department">HR Department</option>
								<option value="HR Department">HR Department</option>
								<option value="HR Department">HR Department</option>
								<option value="HR Department">HR Department</option>
							</select>
						</div>
						<!-- end -->
						<button type="submit" class="btn-dark" style="color: #fff;">SUBMIT</button>
				</form>
			</fieldset>
		</div>
	</div>

	<script type="text/javascript" src="formValidation.js"></script>
	<script>
	/**
	 * 
	 */
	 $(document).ready(function() {
	     var flg=false;
	    $('#name').focusout(function(){

	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_name','#name')
	           
	        }else {

	            if(empName.length>=6 && empName.length<=25)
	           {
	           
	            	  hide('#error_name','#name');
	            	  
	           
	          }
	          else{

	            err_msg('Employee name must  between 6 and 20 character.!','#error_name','#name');
	           
	        }
	        }
	      	        
	    });
	    
	   $('#name').on('input',function(){
	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_name','#name')
	           
	        }else {

	            if(empName.length>=6 && empName.length<=25)
	           {
	           
	            hide('#error_name','#name');
	           
	          }
	          else{

	            err_msg('Employee name must  between 6 and 20 character.!','#error_name','#name');
	           
	        }
	        }
	    }); 
	
	    $('#dep').focusout(function(){

	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_dept','#dep')
	           
	        }else {

	            if(empName.length>=5)
	           {
	           
	            hide('#error_dept','#dep');
	           
	          }
	          else{

	            err_msg('More than 6 character must be.!','#error_dept','#dep');
	           
	        }
	        }
	    });
	    /*  */
	    $('#dep').on('input',function(){
	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('this field is required.!','#error_dept','#dep')
	           
	        }else {

	        	 if(empName.length>=5)
	           {
	           
	            hide('#error_dept','#dep');
	           
	          }
	          else{

	            err_msg('More than 6 character must be.!!','#error_dept','#dep');
	           
	        }
	        }
	    });
	    /*  department validation*/
	    /*salary validation  */
	    $('#salary').focusout(function(){

	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_salary','#salary')
	           
	        }
	        else {
	            hide('#error_salary','#salary');
	        }
	    });
	    
	    $('#salary').on('input',function(){
	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('this field is required.!','#error_salary','#salary')
	           
	        }else {
	            hide('#error_salary','#salary');
	        }

	    });
	    $('#salary').bind('keyup paste', function(){
	        this.value = this.value.replace(/[^0-9.]/g, '');
	  });
	    /*salary validation  */
	    /* mobile validation  */
	    $('#mobile').focusout(function(){

	        var empName=$(this).val();
	        
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_mobile','#mobile')
	           
	        }
	        else{
	     if(empName.length>1 && empName.length==10)
        {
        	hide('#error_mobile','#mobile');
        }
	    
        else{
        	 err_msg('Mobile no should 10 digit.!',"#error_mobile",'#mobile')
        }
	   }
	    });
	    
	    $('#mobile').on('input',function(){
	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('this field is required.!','#error_mobile','#mobile')
	        }
	        else
	        {
	         if(empName.length>1 && empName.length==10)
	        {
	        	hide('#error_mobile','#mobile');
	        	
	        }
	        else{
	        	 err_msg('Mobile no should 10 digit.!',"#error_mobile",'#mobile')
	        }
	        }
	    });
	    
	    $('#mobile').bind('keyup paste', function(){
	        this.value = this.value.replace(/[^0-9]/g, '');
	  });
	    /* mobile validation */
	    
	    /* gender validation */
	    
	     $('#gender').focusout(function(){

	        var gender=$(this).val();
	        if(gender!="No")
	        {
	        	 hide('#error_gender','#gender');
	        	
	           
	        }
	        else {
	        	err_msg('This field is required.!','#error_gender','#gender')
	            	 
	        }      
	    });
	    /*  $('#gender').on('input',function(){

		        var gender=$(this).val();
		        if(gender=="No")
		        {
		            err_msg('This field is required.!','#error_gender','#gender')
		           
		        }
		        else {
		            	  hide('#error_gender','#gender');
		        }      
		    }); */
	    function err_msg(msg,eid,inputcolor){
	    	 $(eid).text(msg).show();
	    	 $(eid).css('color','red').css('font-size','.8em');
	    	 $(inputcolor).css('border-color','red'); 
	         flg=false;
	    }
	    function hide(eid,inputcolor){
	        $(eid).hide();
	       $(inputcolor).css('border-color','black');
	        
	    }
	    
	    function frmsubmit()
	    {
          if(flg && document.getElementById("name").val()!="" 
        		  && document.getElementById("mobile").val()!=""
        		 && document.getElementById("dep").val()!=""
        		 && document.getElementById("salary").val()!=""
        		 && document.getElementById("gender").val()!="No")
        	  document.getElementById("frm").submit();
	    } 

	 });

	
	</script>

	<!-- bootstrap js imported online -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>