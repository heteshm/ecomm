package util;

import java.sql.*;
import java.util.ArrayList;
import bean.product;
import conn.dbcon;

public class OrderDAO
{
	public static ArrayList<product> orderdao(String name)
	{	
		ArrayList<product> ap = new ArrayList<>();
		int a = 0;
		product p = null;
		Connection con=dbcon.getConnection();
		String sql = "select USERID from USERS where UNAME =?";
		PreparedStatement st;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, name);
			ResultSet rs = st.executeQuery();
			int amount = 0;

			while(rs.next())
			{
			  a = rs.getInt(1);		
			}

			System.out.println(a);
			String sql1 = "select CAID,PID,QTY from CART where U_ID="+ a + "";
			PreparedStatement st1 = con.prepareStatement(sql1);
			ResultSet rs1 = st1.executeQuery();

			while(rs1.next())
			{
				int b = rs1.getInt(2);
				int c = rs1.getInt(1);
				int d = rs1.getInt(3);
				String sql2 = "select * from PRODUCT WHERE id ="+ b +"";
				PreparedStatement st3 = con.prepareStatement(sql2);
				ResultSet rs2 = st3.executeQuery();
				while (rs2.next())
				{		
					    p=new product();
						p.setID(rs2.getInt(1));
						p.setName( rs2.getString(2));
						p.setPrice(rs2.getInt(4));
						p.setP_FNAME(rs2.getString(7));
						p.setQty(d);
						ap.add(p);
			
		}
	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ap;
	}}
