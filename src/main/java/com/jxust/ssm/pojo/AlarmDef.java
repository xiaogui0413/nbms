package com.jxust.ssm.pojo;

public class AlarmDef {
	private int id;            /****** id******/ 
	private int nDevType;                    /****** 设备类型******/    
	private int nSubtype;                     /****** 设备子类型******/
	private String sDevName;               /****** 名称 ******/ 
	private int alarmId;                      /****** 告警ID ******/
	private String signalName;              /****** 告警名称 ******/
	private String meanings;              /****** 告警描述 ******/
	private int levelFlag;                         /****** 告警等级 ******/	
	private double highLimit;                      /****** 告警上限 ******/
	private double lowLimit;                     /****** 告警下限 ******/
	private boolean allowSound;                     /****** 允许声音告警 ******/
	private boolean allowSms;                       /****** 允许短信告警 ******/
	private boolean allowEmail;                    /****** 允许Email告警 ******/
	private boolean maskAnyway;                      /****** 无条件屏蔽告警 ******/
	private String sRemark;              /****** 备注******/
	private String Spare1;                 /****** 备用字段1 ******/
	private String Spare2;                 /****** 备用字段2 ******/
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public double getHighLimit() {
		return highLimit;
	}
	public void setHighLimit(double highLimit) {
		this.highLimit = highLimit;
	}
	public double getLowLimit() {
		return lowLimit;
	}
	public void setLowLimit(double lowLimit) {
		this.lowLimit = lowLimit;
	}
	public boolean isAllowSound() {
		return allowSound;
	}
	public void setAllowSound(boolean allowSound) {
		this.allowSound = allowSound;
	}
	public boolean isAllowSms() {
		return allowSms;
	}
	public void setAllowSms(boolean allowSms) {
		this.allowSms = allowSms;
	}
	public boolean isAllowEmail() {
		return allowEmail;
	}
	public void setAllowEmail(boolean allowEmail) {
		this.allowEmail = allowEmail;
	}
	public boolean isMaskAnyway() {
		return maskAnyway;
	}
	public void setMaskAnyway(boolean maskAnyway) {
		this.maskAnyway = maskAnyway;
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
		return "AlarmDef [id=" + id + ", nDevType=" + nDevType + ", nSubtype=" + nSubtype + ", sDevName=" + sDevName
				+ ", alarmId=" + alarmId + ", signalName=" + signalName + ", meanings=" + meanings + ", levelFlag="
				+ levelFlag + ", highLimit=" + highLimit + ", lowLimit=" + lowLimit + ", allowSound=" + allowSound
				+ ", allowSms=" + allowSms + ", allowEmail=" + allowEmail + ", maskAnyway=" + maskAnyway + ", sRemark="
				+ sRemark + ", Spare1=" + Spare1 + ", Spare2=" + Spare2 + "]";
	}

}
