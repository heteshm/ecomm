package util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import conn.dbcon;

public class CartOp
{
	
	
	public CartOp() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static int cartop(String qty,String pid,String name)
	{
		int i = 0;
		Connection con=dbcon.getConnection();
		CallableStatement cs;
		try {
			
			cs = con.prepareCall("{call PROCEDURE1(?,?,?)}");
			cs.setString(1, name);
			cs.setInt(2, Integer.parseInt(pid));
			cs.setInt(3, Integer.parseInt(qty));
			i=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		return i;	
	}

	
}
