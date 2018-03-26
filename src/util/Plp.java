package util;

import java.util.ArrayList;
import java.sql.*;

import bean.product;
import conn.dbcon;

public class Plp
{
	public static ArrayList<product> plp(String id)
	{	
	ArrayList<product> ap=new ArrayList<>();
	Connection con=dbcon.getConnection();
	product p = null;
		try {
			String stmnt="select * from PRODUCT where SC_ID ="+id+"";
			PreparedStatement ps;
		ps = con.prepareStatement(stmnt);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			{
			 p=new product();
			p.setID(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setDescp(rs.getString(3));
			p.setPrice(rs.getInt(4));
			p.setP_FNAME(rs.getString(7));
			 ap.add(p);
             p=null;
	} }catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	
		return ap;	
	}

	}
