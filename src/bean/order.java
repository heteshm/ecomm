package bean;

public class order
{
	private int ORDER_ID;
	private String NAME;
	private int AMOUNT;
	private String LOCALITY;
	private String ADD;
	private String CITY;
	private String STATE;
	private int U_ID;
	private int P_ID;
	
	public order() {
		// TODO Auto-generated constructor stub
	}
	
	public order(int oRDER_ID, String nAME, int aMOUNT, String lOCALITY, String aDD, String cITY, String sTATE,
			int u_ID, int p_ID) 
	{
		ORDER_ID = oRDER_ID;
		NAME = nAME;
		AMOUNT = aMOUNT;
		LOCALITY = lOCALITY;
		ADD = aDD;
		CITY = cITY;
		STATE = sTATE;
		U_ID = u_ID;
		P_ID = p_ID;
	}
	public int getORDER_ID() {
		return ORDER_ID;
	}
	public void setORDER_ID(int oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getAMOUNT() {
		return AMOUNT;
	}
	public void setAMOUNT(int aMOUNT) {
		AMOUNT = aMOUNT;
	}
	public String getLOCALITY() {
		return LOCALITY;
	}
	public void setLOCALITY(String lOCALITY) {
		LOCALITY = lOCALITY;
	}
	public String getADD() {
		return ADD;
	}
	public void setADD(String aDD) {
		ADD = aDD;
	}
	public String getCITY() {
		return CITY;
	}
	public void setCITY(String cITY) {
		CITY = cITY;
	}
	public String getSTATE() {
		return STATE;
	}
	public void setSTATE(String sTATE) {
		STATE = sTATE;
	}
	public int getU_ID() {
		return U_ID;
	}
	public void setU_ID(int u_ID) {
		U_ID = u_ID;
	}
	public int getP_ID() {
		return P_ID;
	}
	public void setP_ID(int p_ID) {
		P_ID = p_ID;
	}
	
	
}
