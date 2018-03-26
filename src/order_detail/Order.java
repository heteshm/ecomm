package order_detail;

import java.io.IOException;
import java.util.Random;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.dbcon;
import java.sql.*;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		Connection con=dbcon.getConnection();
		int a = 0;
		int amount = 0;
		HttpSession session = request.getSession(); 
		String name = (String)session.getValue("name");
		System.out.println(name);
		PreparedStatement ps1=null;
		int qty = 0;
		Random rand = new Random();
		int  n = rand.nextInt(50) + 1;
		
		try {
			
			String sql = "select USERID from USERS where UNAME =?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, name);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
			  a = rs.getInt(1);		
			}

			System.out.println(a);
			String sql1 = "select CAID,PID from CART where U_ID=?";
			PreparedStatement st1 = con.prepareStatement(sql1);
			st1.setInt(1, a);
			ResultSet rs1 = st1.executeQuery();


			while(rs1.next())
			{
				int CAID = rs1.getInt(1);
				int PAID = rs1.getInt(2);
				
//				System.out.println(CAID);
//				System.out.println(PAID);
//				String sql2 = "select * from PRODUCT WHERE id =?";
//				PreparedStatement st3 = con.prepareStatement(sql2);
//				st3.setInt(PAID, 1);
//				ResultSet rs2 = st3.executeQuery();
//				while (rs2.next())
//				{
//								int pid = rs2.getInt(1);
//								int Price = rs2.getInt(4);
//								qty = rs2.getInt(8);
//								qty = qty - 1;
//								amount = amount + Price;
//								String sql3 = "update PRODUCT set QTY = "+qty +"where ID = "+pid+"";
//								PreparedStatement st4 = con.prepareStatement(sql3);
//								int k = st4.executeUpdate();
//								if(k>0)
//								{
//									System.out.println("success");
//								}
//								else
//								{
//									System.out.println("failed");
//								}
//				
//				}
				PreparedStatement ps=null;
				response.setContentType("text/html");  
				response.getWriter();
				String fname=request.getParameter("fname"); 
				String local=request.getParameter("local"); 
				String add=request.getParameter("add"); 
				String city=request.getParameter("city"); 
				String state=request.getParameter("state");
				
				System.out.println(fname);
				System.out.println(local);
				System.out.println(add);
				System.out.println(city);
				System.out.println(state);
				System.out.println(PAID);
				String str="insert into ORDER_DETAIL values (ORDER_D.nextval,?,?,?,?,?,?,?,?,?)";
				ps=con.prepareStatement(str);
				ps.setString(1, fname);
				ps.setInt(2,  amount);
				ps.setString(3, local);
				ps.setString(4,  add);
				ps.setString(5, city);
				ps.setString(6,state );
				ps.setInt(7, a);
				ps.setInt(8, PAID);
				ps.setInt(9,n);
			    
				int j = ps.executeUpdate();
				if(j>0)
				{
					System.out.println("yes");
//					out.println("<script>");
//					out.println("alert('please login to continue shopping...');");
//					out.println("location ='order.jsp'");
//					out.println("</script>");
					
				}
				else
				{
					System.out.println("No");
					
				}
				
			
			
			}
			
			
			
		}
			
			catch (SQLException e)
			{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	
		
		
		response.sendRedirect("Summery.jsp?id="+ n +"");	
	}
	
}
