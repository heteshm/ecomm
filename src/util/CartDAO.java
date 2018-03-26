package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.product;
import conn.dbcon;

public class CartDAO {

	 static Connection con=dbcon.getConnection();
	 
	 public static ArrayList<product> selectCart(int usid)
	 {
		 PreparedStatement st1=null;
		  ResultSet rs1=null;

		 ArrayList<product> ap=new ArrayList<>();
		 try
		 {
			 String sql1 = "select CAID,PID from CART where U_ID=?";
			 st1 = con.prepareStatement(sql1);
			 st1.setInt(1, usid);
			 rs1 = st1.executeQuery();

			 if(rs1!=null)
			 {
				 product p=null;
				 while(rs1.next())
				 {
					 p=new product();
					 p.setID(rs1.getInt(2));
					 p=selectProduct(p);
					 if(p!=null)
						 ap.add(p);
					 p=null;
				 }
			 }
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return ap;
	 }
	 
	 private static product selectProduct(product p)
	 {
		 PreparedStatement st1=null;
		  ResultSet rs1=null;

		 try
		 {
			 String sql2 = "select * from PRODUCT WHERE id =?";
				st1 = con.prepareStatement(sql2);
				st1.setInt(1, p.getID());
				rs1 = st1.executeQuery();
				if(rs1!=null)
				{
				while (rs1.next())
				{
						p.setName(rs1.getString(2));
						p.setPrice(rs1.getInt(4));
						p.setP_FNAME(rs1.getString(7));
				}
				}
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 
		 return p;
	 }
	 
}
