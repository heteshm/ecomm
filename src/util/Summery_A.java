package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.order;
import bean.product;
import conn.dbcon;

public class Summery_A 
{
	public static ArrayList<order> summeryA(String name, int Id)
	{
		 Connection con=dbcon.getConnection();
		 order O = null;
		 ArrayList<order> ap = new ArrayList<>();
		 
		try {
			String sql = "select USERID from USERS where UNAME =?";
	 		PreparedStatement st;
			st = con.prepareStatement(sql);
			st.setString(1, name);
	 		ResultSet rs = st.executeQuery();
	 		int a = 0;
	 		int i = 0;
	 		int qtytotel = 0;
	 		while(rs.next())
	 		{
	   			a = rs.getInt(1);		
	 		}
	 		String sql1 = "SELECT NAME,LOCALITY,ADDRESS,CITY,U_ID from ORDER_DETAIL where CID = ?";
	 		PreparedStatement st1 = con.prepareStatement(sql1);
	 		st1.setInt(1, Id);
	 		ResultSet rs1 = st1.executeQuery();
	 		while(rs1.next()&& i < 1)
	 		{	
	 			O = new order();
	 			 O.setNAME(rs1.getString("NAME"));
	 			O.setLOCALITY( rs1.getString("LOCALITY"));
	 			O.setADD( rs1.getString("ADDRESS"));
	 			O.setCITY( rs1.getString("CITY"));
	 			O.setU_ID(rs1.getInt("U_ID"));
	 			ap.add(O);
	 			++i;		
		}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
 		
	return ap;
}
}