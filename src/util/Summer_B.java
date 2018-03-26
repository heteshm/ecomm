package util;

import java.sql.*;
import java.util.ArrayList;

import bean.order;
import bean.product;
import conn.dbcon;

public class Summer_B 
{
	public static ArrayList<product> summeryb( int Id)
	{
		
		 Connection con=dbcon.getConnection();
		 product p = null;
		 ArrayList<product> ap1 = new ArrayList<>();
		 
		 PreparedStatement ps;
		try {
			ps = con.prepareStatement("select PID, QTY from CART where U_ID =?");
			 ps.setInt(1,Id);
	         ResultSet rs3 = ps.executeQuery();
	         while(rs3.next())
	         {
	         	int pid = rs3.getInt(1);
	         	int qty = rs3.getInt(2);
	         	PreparedStatement ps1 = con.prepareStatement("select *from PRODUCT where ID = ? ");
	         	ps1.setInt(1,pid);
	         	ResultSet rs4 = ps1.executeQuery();
	         	while(rs4.next())
	         	{
	         		p = new product();
	   				p.setName( rs4.getString(2));
	   				p.setPrice( rs4.getInt(4));
	   				p.setQty(qty);
	   				ap1.add(p);	
		
	}
}
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}return ap1;
	}
}