package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import conn.dbcon;

public class Summery
{
	public static int summery(int id)
	{
		
		
		Connection con=dbcon.getConnection();
		int i = 0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("delete from CART where U_ID= ? ");
			ps.setInt(1, id);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return i;
		
	}
}
