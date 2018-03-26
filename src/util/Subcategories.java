package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.SUBCATEGORIES;
import conn.dbcon;

public class Subcategories 
{
   public static ArrayList< SUBCATEGORIES> sub(int cid)
  {
	   	Connection con = dbcon.getConnection();
	   	ArrayList<SUBCATEGORIES> pp = new ArrayList<>();
	   	PreparedStatement ps3;
	   	SUBCATEGORIES S = null;
		try {
			ps3 = con.prepareStatement("select SCID,sname from SUBCATEGORIES where CID = ? ");
			ps3.setInt(1,cid);
			ResultSet rs2=ps3.executeQuery();
			while(rs2.next())
			{
				S = new SUBCATEGORIES();
				S.setSCID(rs2.getInt(1));
				S.setSNAME(rs2.getString(2));
				pp.add(S);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	   
	   
	   
	   
	   
	   return pp;
	   
  
  
}}
