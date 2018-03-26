package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbcon {

	
	public static Connection getConnection()
	{
		Connection con=null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			 con = DriverManager.getConnection("jdbc:oracle:thin:@106.51.0.187:1521:oracle","HITESH","hitesh");
		
			if (con!= null)
			{
				 System.out.println("Connected to database");
			}
			else
			{
				 System.out.println("null");
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	/*public static void main(String arr[]) {
		dbcon gg=new dbcon();
		Connection con=gg.getConnection();
		if(con!=null)
			System.out.println("success");
		else
			System.out.println("no");
		
	}*/
}

