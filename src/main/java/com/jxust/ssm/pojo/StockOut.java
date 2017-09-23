package com.jxust.ssm.pojo;

public class StockOut {
	private int sn;
	private int nDevType;
	private int nSubtype;
	private String sDevID;
	private String sDevLabel;
	private String sDevName;
	private String sStockOutType;
	private String sStorageName;
	private String sUnitName;
	private String sResponsiblePerson;
	private String sTelphone;
	private String sRegistrant;
	private String StockOutTime;
	private String sRemark;
	private int state;
	private String Spare2;
	public int getSn() {
		return sn;
	}
	public void setSn(int sn) {
		this.sn = sn;
	}
	public int getnDevType() {
		return nDevType;
	}
	public void setnDevType(int nDevType) {
		this.nDevType = nDevType;
	}
	public int getnSubtype() {
		return nSubtype;
	}
	public void setnSubtype(int nSubtype) {
		this.nSubtype = nSubtype;
	}
	public String getsDevID() {
		return sDevID;
	}
	public void setsDevID(String sDevID) {
		this.sDevID = sDevID;
	}
	public String getsDevLabel() {
		return sDevLabel;
	}
	public void setsDevLabel(String sDevLabel) {
		this.sDevLabel = sDevLabel;
	}
	public String getsDevName() {
		return sDevName;
	}
	public void setsDevName(String sDevName) {
		this.sDevName = sDevName;
	}
	public String getsStockOutType() {
		return sStockOutType;
	}
	public void setsStockOutType(String sStockOutType) {
		this.sStockOutType = sStockOutType;
	}
	public String getsStorageName() {
		return sStorageName;
	}
	public void setsStorageName(String sStorageName) {
		this.sStorageName = sStorageName;
	}
	public String getsUnitName() {
		return sUnitName;
	}
	public void setsUnitName(String sUnitName) {
		this.sUnitName = sUnitName;
	}
	public String getsResponsiblePerson() {
		return sResponsiblePerson;
	}
	public void setsResponsiblePerson(String sResponsiblePerson) {
		this.sResponsiblePerson = sResponsiblePerson;
	}
	public String getsTelphone() {
		return sTelphone;
	}
	public void setsTelphone(String sTelphone) {
		this.sTelphone = sTelphone;
	}
	public String getsRegistrant() {
		return sRegistrant;
	}
	public void setsRegistrant(String sRegistrant) {
		this.sRegistrant = sRegistrant;
	}
	public String getStockOutTime() {
		return StockOutTime;
	}
	public void setStockOutTime(String stockOutTime) {
		StockOutTime = stockOutTime;
	}
	public String getsRemark() {
		return sRemark;
	}
	public void setsRemark(String sRemark) {
		this.sRemark = sRemark;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getSpare2() {
		return Spare2;
	}
	public void setSpare2(String spare2) {
		Spare2 = spare2;
	}
	@Override
	public String toString() {
		return "StockOut [sn=" + sn + ", nDevType=" + nDevType + ", nSubtype=" + nSubtype + ", sDevID=" + sDevID
				+ ", sDevLabel=" + sDevLabel + ", sDevName=" + sDevName + ", sStockOutType=" + sStockOutType
				+ ", sStorageName=" + sStorageName + ", sUnitName=" + sUnitName + ", sResponsiblePerson="
				+ sResponsiblePerson + ", sTelphone=" + sTelphone + ", sRegistrant=" + sRegistrant + ", StockOutTime="
				+ StockOutTime + ", sRemark=" + sRemark + ", state=" + state + ", Spare2=" + Spare2 + "]";
	}

}
