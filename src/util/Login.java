package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.User;
import conn.dbcon;

public class Login {

	public static User login( String email)
	{
		Connection con=dbcon.getConnection();
	       
		PreparedStatement ps=null;
		
		User u=new User();
		
		try {
			ps = con.prepareStatement("select PASS,UTYPE,UNAME from USERS where EMAIL=?");
			ps.setString(1, email);
			//ps.setString(2, Pass);
			ResultSet rs=ps.executeQuery();
			
			 
			while(rs.next())	
			{
				u.setPASS(rs.getString(1));
				u.setUTYPE(rs.getString(2));
				u.setUNAME(rs.getString(3));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return u;
	}
	
}
