package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.categories;
import conn.dbcon;

public class Categories 
{
	public static ArrayList <categories> categorie()
	{
	ArrayList<categories> ap = new ArrayList<>();	
	categories C = null;
	Connection con = dbcon.getConnection();
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("select  CDID,CNAME from CATEGORIES order by cdid asc");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
	
			C = new categories();
			C.setCNAME(rs.getString(2));
			C.setCDID(rs.getInt(1));
			ap.add(C);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ap;
	
}
}