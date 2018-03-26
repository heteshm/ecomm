package bean;

public class SUBCATEGORIES
{
	private int SCID;
	private String SNAME;
	private int CID;
	public int getSCID() {
		return SCID;
	}
	public void setSCID(int sCID) {
		SCID = sCID;
	}
	public String getSNAME() {
		return SNAME;
	}
	public void setSNAME(String sNAME) {
		SNAME = sNAME;
	}
	public int getCID() {
		return CID;
	}
	public void setCID(int cID) {
		CID = cID;
	}
	public SUBCATEGORIES() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SUBCATEGORIES(int sCID, String sNAME, int cID) {
		SCID = sCID;
		SNAME = sNAME;
		CID = cID;
	}
}
