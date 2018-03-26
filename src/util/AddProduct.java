package util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class AddProduct 
{
	public static int addproduct (String pname , String pdesc , int pprice , String dropscat ,String dbFileName, String pcat , int qty ) 
	{
		int i = 0;
		Connection con = conn.dbcon.getConnection();
		
		try {
			CallableStatement cs=con.prepareCall("{call P_ITEM(?,?,?,?,?,?,?)}");
			cs.setInt(3, pprice);
			cs.setString(4,dropscat);
			cs.setString(5, pcat );
			cs.setString(6, dbFileName);
			cs.setInt(7,qty);
			
			cs.setString(1, pname );
			cs.setString(2, pdesc);
			
			 i=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return i;
		
	}
}
