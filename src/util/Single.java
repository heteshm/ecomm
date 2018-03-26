package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Seller.Product;
import bean.product;
import conn.dbcon;

public class Single 
{

	
	static Connection con = dbcon.getConnection();
	 public static product pdp (product p) throws SQLException
	 {	
		 
		 try
		 {
		
		 String sql = "select NAME,DESCP,PRICE,P_FNAME,QTY from PRODUCT where ID=?";
		 PreparedStatement st = con.prepareStatement(sql);
		 st.setInt(1,p.getID());
		 ResultSet rs = st.executeQuery();
		if(rs!=null)
		{
		 while (rs.next())
		 {
			 String name=rs.getString(1);
			 System.out.println(rs.getString(1)+": "+rs.getString(2)+" "+rs.getInt(3)+" "+rs.getString(4)+" "+rs.getInt(5));
			 p.setName(name);
			 p.setDescp(rs.getString(2));
			 p.setPrice(rs.getInt(3));
			 p.setP_FNAME(rs.getString(4));
			 p.setQty(rs.getInt(5));
		 }
		 }
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
             System.out.println(p);
		 return p;
		 
	 }
	 
}

