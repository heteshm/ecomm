package bean;

public class User 
{
	private int USERID ;
	private String UNAME;
	private String EMAIL;
	private String PASS;
	private String UTYPE;
	public User(int uSERID, String uNAME, String eMAIL, String pASS, String uTYPE)
	{
		USERID = uSERID;
		UNAME = uNAME;
		EMAIL = eMAIL;
		PASS = pASS;
		UTYPE = uTYPE;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public int getUSERID() 
	{
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public String getUNAME() {
		return UNAME;
	}
	public void setUNAME(String uNAME) {
		UNAME = uNAME;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPASS() {
		return PASS;
	}
	public void setPASS(String pASS) {
		PASS = pASS;
	}
	public String getUTYPE() {
		return UTYPE;
	}
	public void setUTYPE(String uTYPE) {
		UTYPE = uTYPE;
	}
	
}
