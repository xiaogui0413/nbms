package com.jxust.ssm.pojo;

public class AlarmData {
	
	private int sn;
	private int nDevType;                     /****** 设备类型******/    
	private int nSubtype;                     /****** 设备子类型******/ 
	private int nDevAddr;                     /****** 设备地址******/ 
	private String sDevID;                    /****** 设备ID******/ 
	private int nLocaMode;                    /****** 定位方式 1:LBS基站定位 2:GPS定位 ******/
	private String sDevName;                  /****** 设备名称 ******/
	private int alarmId;                      /****** 告警ID ******/
	private String signalName;                /****** 告警名称 ******/
	private String meanings;                  /****** 告警描述 ******/
	private int levelFlagint;                 /****** 告警等级 ******/	
	private String tmOccureddatetime;         /****** 告警发生时间 ******/
	private String value;                     /****** 当前值 ******/
	private int state;                        /****** 告警状态　0:恢复　1:告警；2:超限告警 3:低限告警  ******/
	private String tmRestoreddatetime;        /****** 告警恢复时间 ******/
	private String sRemark;                   /****** 备注******/
	private String Spare1;                    /****** 备用字段1 ******/
	private String Spare2;                    /****** 备用字段2 ******/
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
	public int getAlarmId() {
		return alarmId;
	}
	public void setAlarmId(int alarmId) {
		this.alarmId = alarmId;
	}
	public String getSignalName() {
		return signalName;
	}
	public void setSignalName(String signalName) {
		this.signalName = signalName;
	}
	public String getMeanings() {
		return meanings;
	}
	public void setMeanings(String meanings) {
		this.meanings = meanings;
	}
	public int getLevelFlagint() {
		return levelFlagint;
	}
	public void setLevelFlagint(int levelFlagint) {
		this.levelFlagint = levelFlagint;
	}
	public String getTmOccureddatetime() {
		return tmOccureddatetime;
	}
	public void setTmOccureddatetime(String tmOccureddatetime) {
		this.tmOccureddatetime = tmOccureddatetime;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getTmRestoreddatetime() {
		return tmRestoreddatetime;
	}
	public void setTmRestoreddatetime(String tmRestoreddatetime) {
		this.tmRestoreddatetime = tmRestoreddatetime;
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
		return "AlarmData [sn=" + sn + ", nDevType=" + nDevType + ", nSubtype=" + nSubtype + ", nDevAddr=" + nDevAddr
				+ ", sDevID=" + sDevID + ", nLocaMode=" + nLocaMode + ", sDevName=" + sDevName + ", alarmId=" + alarmId
				+ ", signalName=" + signalName + ", meanings=" + meanings + ", levelFlagint=" + levelFlagint
				+ ", tmOccureddatetime=" + tmOccureddatetime + ", value=" + value + ", state=" + state
				+ ", tmRestoreddatetime=" + tmRestoreddatetime + ", sRemark=" + sRemark + ", Spare1=" + Spare1
				+ ", Spare2=" + Spare2 + "]";
	}

}
