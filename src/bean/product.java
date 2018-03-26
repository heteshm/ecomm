package bean;

public class product
{
 	private  int ID;
 	private String name;
 	private String descp;
 	private  int Price;
 	private  int SC_id;
 	private  int CDID;
 	private String P_FNAME;
 	private int qty;
 	
 	public product() {
		// TODO Auto-generated constructor stub
	}
 	
 	
 	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String i) {
		this.name =i ;
	}
	public String getDescp() {
		return descp;
	}
	@Override
	public String toString() {
		return "product [ID=" + ID + ", name=" + name + ", descp=" + descp + ", Price=" + Price + ", SC_id=" + SC_id
				+ ", CDID=" + CDID + ", P_FNAME=" + P_FNAME + ", qty=" + qty + "]";
	}


	public void setDescp(String descp) {
		this.descp = descp;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public int getSC_id() {
		return SC_id;
	}
	public void setSC_id(int sC_id) {
		SC_id = sC_id;
	}
	public int getCDID() {
		return CDID;
	}
	public void setCDID(int cDID) {
		CDID = cDID;
	}
	public String getP_FNAME() {
		return P_FNAME;
	}
	public void setP_FNAME(String p_FNAME) {
		P_FNAME = p_FNAME;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public product(int iD, String name, String descp, int price, int sC_id, int cDID, String p_FNAME, int qty) {
		ID = iD;
		this.name = name;
		this.descp = descp;
		Price = price;
		SC_id = sC_id;
		CDID = cDID;
		P_FNAME = p_FNAME;
		this.qty = qty;
	}
	
}
