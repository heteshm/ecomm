package util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import conn.dbcon;

public class Giv//Add to cart
{
	public static int giv(String name , String id)
	{
		Connection con=dbcon.getConnection();
		int i = 0;
		CallableStatement cs;
		try {
			cs = con.prepareCall("{call PROCEDURE1(?,?)}");
			cs.setString(1, name);
			cs.setInt(2, Integer.parseInt(id));
			 i=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
