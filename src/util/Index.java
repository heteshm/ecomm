package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.product;
import conn.dbcon;

public class Index 
{
	public static ArrayList<product> index()
	{	
			ArrayList<product> ap=new ArrayList<>();
			product p = null;
		 	Connection con=dbcon.getConnection();
     		Statement st;
		try {
			st = con.createStatement();
			 String sql = "select ID,NAME,PRICE,P_FNAME from PRODUCT ";
	         ResultSet rs = st.executeQuery(sql);
	         int i = 0;
	         while (rs.next()&& i<=6) 
	         {	
	        	 p=new product();
	        	 p.setID(rs.getInt(1));
	             p.setName( rs.getString(2));
	             p.setPrice(rs.getInt(3));
	             p.setP_FNAME(rs.getString(4));
	             ++i;
	             ap.add(p);
	             p=null;
	         }
	        }
	         catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ap;
		
	}
}
