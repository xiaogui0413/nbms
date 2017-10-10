package com.jxust.ssm.pojo;

public class DevAlarm {
	  private int sn;
	  private int nDevType;
	  private int nSubtype;
	  private int nDevAddr;
	  private String sDevID;
	  private int nLocaMode;
	  private String sDevName;
	  private int alarmId;
	  private String signalName;
	  private String meanings;
	  private int levelFlag;
	  private String tmOccured;
	  private String value;
	  private int state;
	  private String tmRestored;
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
	public int getLevelFlag() {
		return levelFlag;
	}
	public void setLevelFlag(int levelFlag) {
		this.levelFlag = levelFlag;
	}
	public String getTmOccured() {
		return tmOccured;
	}
	public void setTmOccured(String tmOccured) {
		this.tmOccured = tmOccured;
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
	public String getTmRestored() {
		return tmRestored;
	}
	public void setTmRestored(String tmRestored) {
		this.tmRestored = tmRestored;
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
		return "DevAlarm [sn=" + sn + ", nDevType=" + nDevType + ", nSubtype=" + nSubtype + ", nDevAddr=" + nDevAddr
				+ ", sDevID=" + sDevID + ", nLocaMode=" + nLocaMode + ", sDevName=" + sDevName + ", alarmId=" + alarmId
				+ ", signalName=" + signalName + ", meanings=" + meanings + ", levelFlag=" + levelFlag + ", tmOccured="
				+ tmOccured + ", value=" + value + ", state=" + state + ", tmRestored=" + tmRestored + ", sRemark="
				+ sRemark + ", Spare1=" + Spare1 + ", Spare2=" + Spare2 + "]";
	}

}
