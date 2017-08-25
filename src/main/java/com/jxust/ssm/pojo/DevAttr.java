package com.jxust.ssm.pojo;

import java.util.Date;

/**
 * @author GuiqiHu
 *
 * @date 2017年8月22日 下午2:37:15
 */
public class DevAttr {
	private int sn;
	private int nDevType;
	private int nSubtype;
	private String sDevID;
	private int nLocaMode;
	private String sDevName;
	private Double x_pos;
	private Double y_pos;
	private Double fHop;
	private Double fBatteryVolt;
	private Double nRSOC;
	private int nAlarm;
	private int nState;
	private Date SamplingTime;
	private String sIPAddr;
	private int nPort;
	private String sRemark;
	private String Spare1;
	private String Spare2;
	/**
	 * @return the sn
	 */
	public int getSn() {
		return sn;
	}
	/**
	 * @param sn the sn to set
	 */
	public void setSn(int sn) {
		this.sn = sn;
	}
	/**
	 * @return the nDevType
	 */
	public int getnDevType() {
		return nDevType;
	}
	/**
	 * @param nDevType the nDevType to set
	 */
	public void setnDevType(int nDevType) {
		this.nDevType = nDevType;
	}
	/**
	 * @return the nSubtype
	 */
	public int getnSubtype() {
		return nSubtype;
	}
	/**
	 * @param nSubtype the nSubtype to set
	 */
	public void setnSubtype(int nSubtype) {
		this.nSubtype = nSubtype;
	}
	/**
	 * @return the sDevID
	 */
	public String getsDevID() {
		return sDevID;
	}
	/**
	 * @param sDevID the sDevID to set
	 */
	public void setsDevID(String sDevID) {
		this.sDevID = sDevID;
	}
	/**
	 * @return the nLocaMode
	 */
	public int getnLocaMode() {
		return nLocaMode;
	}
	/**
	 * @param nLocaMode the nLocaMode to set
	 */
	public void setnLocaMode(int nLocaMode) {
		this.nLocaMode = nLocaMode;
	}
	/**
	 * @return the sDevName
	 */
	public String getsDevName() {
		return sDevName;
	}
	/**
	 * @param sDevName the sDevName to set
	 */
	public void setsDevName(String sDevName) {
		this.sDevName = sDevName;
	}
	/**
	 * @return the x_pos
	 */
	public Double getX_pos() {
		return x_pos;
	}
	/**
	 * @param x_pos the x_pos to set
	 */
	public void setX_pos(Double x_pos) {
		this.x_pos = x_pos;
	}
	/**
	 * @return the y_pos
	 */
	public Double getY_pos() {
		return y_pos;
	}
	/**
	 * @param y_pos the y_pos to set
	 */
	public void setY_pos(Double y_pos) {
		this.y_pos = y_pos;
	}
	/**
	 * @return the fHop
	 */
	public Double getfHop() {
		return fHop;
	}
	/**
	 * @param fHop the fHop to set
	 */
	public void setfHop(Double fHop) {
		this.fHop = fHop;
	}
	/**
	 * @return the fBatteryVolt
	 */
	public Double getfBatteryVolt() {
		return fBatteryVolt;
	}
	/**
	 * @param fBatteryVolt the fBatteryVolt to set
	 */
	public void setfBatteryVolt(Double fBatteryVolt) {
		this.fBatteryVolt = fBatteryVolt;
	}
	/**
	 * @return the nRSOC
	 */
	public Double getnRSOC() {
		return nRSOC;
	}
	/**
	 * @param nRSOC the nRSOC to set
	 */
	public void setnRSOC(Double nRSOC) {
		this.nRSOC = nRSOC;
	}
	/**
	 * @return the nAlarm
	 */
	public int getnAlarm() {
		return nAlarm;
	}
	/**
	 * @param nAlarm the nAlarm to set
	 */
	public void setnAlarm(int nAlarm) {
		this.nAlarm = nAlarm;
	}
	/**
	 * @return the nState
	 */
	public int getnState() {
		return nState;
	}
	/**
	 * @param nState the nState to set
	 */
	public void setnState(int nState) {
		this.nState = nState;
	}
	/**
	 * @return the samplingTime
	 */
	public Date getSamplingTime() {
		return SamplingTime;
	}
	/**
	 * @param samplingTime the samplingTime to set
	 */
	public void setSamplingTime(Date samplingTime) {
		SamplingTime = samplingTime;
	}
	/**
	 * @return the sIPAddr
	 */
	public String getsIPAddr() {
		return sIPAddr;
	}
	/**
	 * @param sIPAddr the sIPAddr to set
	 */
	public void setsIPAddr(String sIPAddr) {
		this.sIPAddr = sIPAddr;
	}
	/**
	 * @return the nPort
	 */
	public int getnPort() {
		return nPort;
	}
	/**
	 * @param nPort the nPort to set
	 */
	public void setnPort(int nPort) {
		this.nPort = nPort;
	}
	/**
	 * @return the sRemark
	 */
	public String getsRemark() {
		return sRemark;
	}
	/**
	 * @param sRemark the sRemark to set
	 */
	public void setsRemark(String sRemark) {
		this.sRemark = sRemark;
	}
	/**
	 * @return the spare1
	 */
	public String getSpare1() {
		return Spare1;
	}
	/**
	 * @param spare1 the spare1 to set
	 */
	public void setSpare1(String spare1) {
		Spare1 = spare1;
	}
	/**
	 * @return the spare2
	 */
	public String getSpare2() {
		return Spare2;
	}
	/**
	 * @param spare2 the spare2 to set
	 */
	public void setSpare2(String spare2) {
		Spare2 = spare2;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "DevAttr [sn=" + sn + ", nDevType=" + nDevType + ", nSubtype=" + nSubtype + ", sDevID=" + sDevID
				+ ", nLocaMode=" + nLocaMode + ", sDevName=" + sDevName + ", x_pos=" + x_pos + ", y_pos=" + y_pos
				+ ", fHop=" + fHop + ", fBatteryVolt=" + fBatteryVolt + ", nRSOC=" + nRSOC + ", nAlarm=" + nAlarm
				+ ", nState=" + nState + ", SamplingTime=" + SamplingTime + ", sIPAddr=" + sIPAddr + ", nPort=" + nPort
				+ ", sRemark=" + sRemark + ", Spare1=" + Spare1 + ", Spare2=" + Spare2 + "]";
	}

}
