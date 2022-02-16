<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<form action="frgPassword" method="get">
<label>User Name</label><br>
<input readonly="readonly" name="user"><br>
<label>New Password</label><br>
<input type="password" name="password" placeholder="New password" required="required"><br>
<label>Confirm Password</label><br>

<input type="password" name="cfmpassword" placeholder="Confirm Password" required="required"><br>
<input type="submit" value="SUBMIT">
</form>
</body>
</html>