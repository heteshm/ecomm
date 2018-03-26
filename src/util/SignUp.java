package util;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.User;
import conn.dbcon;

public class SignUp
{
	private static HttpServletResponse response;

	public static int signup(String fname, String email,String pass,String utype) throws IOException
	{	
		Connection con=dbcon.getConnection();
		@SuppressWarnings("unused")
		String kk = null;
		int i = 0;
		PreparedStatement ps=null;
		String str="insert into USERS values (USERID.nextval,?,?,?,?)" ;
		
		
		try {
			ps=con.prepareStatement(str);
			ps.setString(1, fname);
			ps.setString(2,  email);
			ps.setString(3, pass);
			ps.setString(4,  utype);
			i = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
		
		
		
	}
	
	
	
}
