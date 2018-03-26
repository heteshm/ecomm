package bean;

public class categories 

{
	private int CDID;
	private String CNAME;
	private int CTLNO;
	public categories(int cDID, String cNAME, int cTLNO)
	{
		CDID = cDID;
		CNAME = cNAME;
		CTLNO = cTLNO;
	}
	public int getCDID() {
		return CDID;
	}
	public void setCDID(int cDID) {
		CDID = cDID;
	}
	public String getCNAME() {
		return CNAME;
	}
	public void setCNAME(String cNAME) {
		CNAME = cNAME;
	}
	public categories() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCTLNO() {
		return CTLNO;
	}
	public void setCTLNO(int cTLNO) {
		CTLNO = cTLNO;
	}
	
}
