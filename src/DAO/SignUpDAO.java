package DAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import conn.dbcon;
import util.SignUp;

import java.sql.*;

/**
 * Servlet implementation class SignUpDAO
 */
@WebServlet("/SignUpDAO")
public class SignUpDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SignUpDAO() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String kk=null;
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		String fname=request.getParameter("fname"); 
		String email=request.getParameter("Email"); 
		String pass=request.getParameter("Pass"); 
		String utype=request.getParameter("utype"); 
		int i = SignUp.signup(fname, email, pass, utype);
		System.out.println(i);
		response.sendRedirect("login.jsp");
		if(i>0)  
		kk="You are successfully registered..."; 
		else
		kk="not registered successfully....";
		
	}

}
