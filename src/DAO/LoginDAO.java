package DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import javax.servlet.http.HttpSession;
import bean.User;
import conn.dbcon;
import util.Login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import conn.dbcon;
@WebServlet("/LoginDAO")
public class LoginDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginDAO() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  HttpSession session = request.getSession();
		  response.setContentType("text/html");  
			PrintWriter out = response.getWriter();
			String email =request.getParameter("Email"); 
			String Pass = request.getParameter("Password");
			String utype= "buyer";
		
        
		User u=Login.login(email);
		
		
		
			if(Pass.equals(u.getPASS()))
			{
//			out.println(kk);
			session.setAttribute("name",u.getUNAME());
//			session.setMaxInactiveInterval(100);
			System.out.println("welcome " + email);
				 if(u.getUTYPE().equals(utype))
				 {
					 response.sendRedirect("index.jsp");
				 }
				 else
				 {
					 response.sendRedirect("Seller.jsp");
					 
				 }
		
			}
			else
			{	
				out.println("<script type=\"text/javascript\">");
				out.println("alert('username or password is incorrect');");
				out.println("location='login.jsp';");
				out.println("</script>");
				response.sendRedirect("login.jsp");
				
			}
		

		
		
		
		
		
	
		
			
}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

