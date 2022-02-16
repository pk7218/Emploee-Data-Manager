<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% HttpSession usertracker=request.getSession(false);
String userVarification = (String) usertracker.getAttribute("user");
  if(userVarification==null)
  {
	  response.sendRedirect("login.html");
  }
%>