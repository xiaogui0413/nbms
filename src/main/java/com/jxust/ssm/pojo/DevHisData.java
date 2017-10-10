package com.jxust.ssm.pojo;

/**
 * 
 * @author GuiqiHu
 * @date 2017年9月22日
 * @description 实时数据类，用于记录实时数据
 */
public class DevHisData {
	private int sn;						/****** 编号******/
	private int nDevType;				/****** 设备类型******/    
	private int nSubtype;				/****** 设备子类型******/ 
	private int nDevAddr;				/****** 设备地址******/ 
	private String sDevID;              /****** 设备ID******/ 
	private int nLocaMode;              /****** 定位方式 1:LBS基站定位 2:GPS定位 ******/
	private String sDevName;            /****** 设备名称 ******/
	private double x_pos;				/****** 经度******/
	private double y_pos;				/****** 纬度******/
	private double fHop; 				/****** 可信度，米******/
	private double fBatteryVolt;		/****** 电池电压******/
	private double fRSOC;				/****** 剩余电量 (百分比)******/
	private double fVolt;				/****** 供电电压******/
    private String samplingTime;		/****** 数据采集时间******/
	private String sRemark;				/****** 备注******/
	private String Spare1;				/****** 备用字段1******/
	private String Spare2;				/****** 备用字段2******/
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
	public int getnDevAddr() {
		return nDevAddr;
	}
	public void setnDevAddr(int nDevAddr) {
		this.nDevAddr = nDevAddr;
	}
	public String getsDevID() {
		return sDevID;
	}
	public void setsDevID(String sDevID) {
		this.sDevID = sDevID;
	}
	public int getnLocaMode() {
		return nLocaMode;
	}
	public void setnLocaMode(int nLocaMode) {
		this.nLocaMode = nLocaMode;
	}
	public String getsDevName() {
		return sDevName;
	}
	public void setsDevName(String sDevName) {
		this.sDevName = sDevName;
	}
	public double getX_pos() {
		return x_pos;
	}
	public void setX_pos(double x_pos) {
		this.x_pos = x_pos;
	}
	public double getY_pos() {
		return y_pos;
	}
	public void setY_pos(double y_pos) {
		this.y_pos = y_pos;
	}
	public double getfHop() {
		return fHop;
	}
	public void setfHop(double fHop) {
		this.fHop = fHop;
	}
	public double getfBatteryVolt() {
		return fBatteryVolt;
	}
	public void setfBatteryVolt(double fBatteryVolt) {
		this.fBatteryVolt = fBatteryVolt;
	}
	public double getfRSOC() {
		return fRSOC;
	}
	public void setfRSOC(double fRSOC) {
		this.fRSOC = fRSOC;
	}
	public double getfVolt() {
		return fVolt;
	}
	public void setfVolt(double fVolt) {
		this.fVolt = fVolt;
	}
	public String getSamplingTime() {
		return samplingTime;
	}
	public void setSamplingTime(String samplingTime) {
		this.samplingTime = samplingTime;
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
		return "DevHisData [sn=" + sn + ", nDevType=" + nDevType + ", nSubtype=" + nSubtype + ", nDevAddr=" + nDevAddr
				+ ", sDevID=" + sDevID + ", nLocaMode=" + nLocaMode + ", sDevName=" + sDevName + ", x_pos=" + x_pos
				+ ", y_pos=" + y_pos + ", fHop=" + fHop + ", fBatteryVolt=" + fBatteryVolt + ", fRSOC=" + fRSOC
				+ ", fVolt=" + fVolt + ", samplingTime=" + samplingTime + ", sRemark=" + sRemark + ", Spare1=" + Spare1
				+ ", Spare2=" + Spare2 + "]";
	}
	
}
