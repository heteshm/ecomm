package order_detail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.dbcon;
import util.CartOp;

/**
 * Servlet implementation class Add_cart
 */
@WebServlet("/Add_cart")
public class Add_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_cart() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession() ;
		if (session.getAttribute("name") == null || (session.getAttribute("name") == ""))
		{
			
			response.sendRedirect("login.jsp");
			
		}
		else
		{
		int a = 0 ;
		String id=request.getParameter("id");
		String name = (String)session.getAttribute("name");
		System.out.println(name);
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		String pid=request.getParameter("id"); 
		String qty=request.getParameter("qty"); 
		System.out.println(pid);
		System.out.println(qty);
		
			int i = CartOp.cartop(qty, pid, name);
			if(i>0)
			{
			response.sendRedirect("Cart.jsp");
			}
			else
			{
				System.out.println("not happening");
			}	
		}
	
	}

}
