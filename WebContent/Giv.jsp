<%@page import="util.Giv"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page  import ="conn.dbcon" %>
    <%@page  import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
if (session.getAttribute("name") == null || (session.getAttribute("name") == ""))
{
	
	response.sendRedirect("login.jsp");
	
}
else
{
int a = 0 ;
String id=request.getParameter("id");
String name = (String)session.getValue("name");
System.out.println(name);
int i = Giv.giv(name, id);
if(i>0)
{
response.sendRedirect("Cart.jsp");
}
else
{
System.out.println("it dont");	
}

}
%>
</body>
</html>