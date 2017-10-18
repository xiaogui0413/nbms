package com.jxust.ssm.pojo;

/**
 * 
 * @author GuiqiHu
 * @date 2017年9月22日
 * @description 实时数据类，用于记录实时数据
 */
public class DevRealtimeData {
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
	private double nRSOC;				/****** 剩余电量 (百分比)******/
	private double fVolt;				/****** 供电电压******/
	private int nAlarm;					/****** 告警状态　1:告警  0:正常******/
	private int nState;					/****** 在线状态　1:在线  0:不在线******/
    private String SamplingTime;		/****** 数据采集时间******/
    private String sIPAddr;				/****** IP地址******/
    private int nPort;					/****** 端口号******/
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
	public double getnRSOC() {
		return nRSOC;
	}
	public void setnRSOC(double nRSOC) {
		this.nRSOC = nRSOC;
	}
	public double getfVolt() {
		return fVolt;
	}
	public void setfVolt(double fVolt) {
		this.fVolt = fVolt;
	}
	public int getnAlarm() {
		return nAlarm;
	}
	public void setnAlarm(int nAlarm) {
		this.nAlarm = nAlarm;
	}
	public int getnState() {
		return nState;
	}
	public void setnState(int nState) {
		this.nState = nState;
	}
	public String getSamplingTime() {
		return SamplingTime;
	}
	public void setSamplingTime(String samplingTime) {
		SamplingTime = samplingTime;
	}
	public String getsIPAddr() {
		return sIPAddr;
	}
	public void setsIPAddr(String sIPAddr) {
		this.sIPAddr = sIPAddr;
	}
	public int getnPort() {
		return nPort;
	}
	public void setnPort(int nPort) {
		this.nPort = nPort;
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
		return "DevRealtimeData [sn=" + sn + ", nDevType=" + nDevType + ", nSubtype=" + nSubtype + ", nDevAddr="
				+ nDevAddr + ", sDevID=" + sDevID + ", nLocaMode=" + nLocaMode + ", sDevName=" + sDevName + ", x_pos="
				+ x_pos + ", y_pos=" + y_pos + ", fHop=" + fHop + ", fBatteryVolt=" + fBatteryVolt + ", nRSOC=" + nRSOC
				+ ", fVolt=" + fVolt + ", nAlarm=" + nAlarm + ", nState=" + nState + ", SamplingTime=" + SamplingTime
				+ ", sIPAddr=" + sIPAddr + ", nPort=" + nPort + ", sRemark=" + sRemark + ", Spare1=" + Spare1
				+ ", Spare2=" + Spare2 + "]";
	}
	
}
