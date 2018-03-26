<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="conn.dbcon" %>
    <%@ page import ="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>-delete-</title>
</head>
<body>
<%
	int id  = Integer.parseInt( request.getParameter("id"));
	Connection con=dbcon.getConnection();
	PreparedStatement ps = con.prepareStatement("delete from CART where PID = ? ");
	ps.setInt(1, id);

	int i = ps.executeUpdate();
	if(i==0)
	{
		System.out.println("yes");
	response.sendRedirect(request.getHeader("referer"));
	
	}
	else
	{
		System.out.println("No");
		response.sendRedirect(request.getHeader("referer"));	
		
	}
%>
</body>
</html>