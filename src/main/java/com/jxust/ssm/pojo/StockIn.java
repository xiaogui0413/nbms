package com.jxust.ssm.pojo;

public class StockIn {
	private int sn;
	private int nDevType;
	private int nSubtype;
	private String sDevID;
	private String sDevLabel;
	private String sDevName;
	private String sStockIntType;
	private String sStorageName;
	private String sSupplierName;
	private String sRegistrant;
	private String StorageTime;
	private String sRemark;
	private String Spare1;
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
	public String getsStockIntType() {
		return sStockIntType;
	}
	public void setsStockIntType(String sStockIntType) {
		this.sStockIntType = sStockIntType;
	}
	public String getsStorageName() {
		return sStorageName;
	}
	public void setsStorageName(String sStorageName) {
		this.sStorageName = sStorageName;
	}
	public String getsSupplierName() {
		return sSupplierName;
	}
	public void setsSupplierName(String sSupplierName) {
		this.sSupplierName = sSupplierName;
	}
	public String getsRegistrant() {
		return sRegistrant;
	}
	public void setsRegistrant(String sRegistrant) {
		this.sRegistrant = sRegistrant;
	}
	public String getStorageTime() {
		return StorageTime;
	}
	public void setStorageTime(String storageTime) {
		StorageTime = storageTime;
	}
	public String getsRemark() {
		return sRemark;
	}
	public void setsRemark(String sRemark) {
		this.sRemark = sRemark;
	}
	public String getSpare1() {
		return Spare1;
	}
	public void setSpare1(String spare1) {
		Spare1 = spare1;
	}
	public String getSpare2() {
		return Spare2;
	}
	public void setSpare2(String spare2) {
		Spare2 = spare2;
	}
	@Override
	public String toString() {
		return "StockIn [sn=" + sn + ", nDevType=" + nDevType + ", nSubtype=" + nSubtype + ", sDevID=" + sDevID
				+ ", sDevLabel=" + sDevLabel + ", sDevName=" + sDevName + ", sStockIntType=" + sStockIntType
				+ ", sStorageName=" + sStorageName + ", sSupplierName=" + sSupplierName + ", sRegistrant=" + sRegistrant
				+ ", StorageTime=" + StorageTime + ", sRemark=" + sRemark + ", Spare1=" + Spare1 + ", Spare2=" + Spare2
				+ "]";
	}

}
