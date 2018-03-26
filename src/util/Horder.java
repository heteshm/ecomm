package util;

import java.sql.*;
import java.util.ArrayList;

import bean.User;
import bean.product;
import conn.dbcon;

public class Horder 
{
	public static ArrayList <product> horder(String name) 
	{	
		int a = 0;
		product p = null;
		
		ArrayList<product> ap=new ArrayList<>();
		Connection con=dbcon.getConnection();
		String sql = "select USERID from USERS where UNAME =?";
		PreparedStatement st;
		try {
			st = con.prepareStatement(sql);
		
		st.setString(1, name);
		ResultSet rs = st.executeQuery();

		while(rs.next())
		{
		  a = rs.getInt(1);		
		}

		System.out.println(a);
		String sql1 = "select P_ID from ORDER_DETAIL where U_ID ="+ a + "";
		PreparedStatement st1 = con.prepareStatement(sql1);
		ResultSet rs1 = st1.executeQuery();

		while(rs1.next())
		{
			int b = rs1.getInt(1);

			System.out.println(b);
			String sql2 = "select * from PRODUCT WHERE ID = ?";
			PreparedStatement st3 = con.prepareStatement(sql2);
			st3.setInt(1,b);
			ResultSet rs2 = st3.executeQuery();
			while (rs2.next())
			{		
				   p=new product();
					p.setID(rs2.getInt(1)); 
					p.setName( rs2.getString(2));
					p.setPrice(rs2.getInt(4));
					p.setP_FNAME(rs2.getString(7));
					ap.add(p);
					
		
	}
}} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		return ap;
	}
	
}
