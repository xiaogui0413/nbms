package com.jxust.ssm.pojo;

public class UserData {
	private String id;
	private String clerkName; // 用户名
	private int clerkType; // 角色
	private String password; // 密码
	private String gsm_Phone;
	private String contact;
	private String address;
	private String memo;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClerkName() {
		return clerkName;
	}
	public void setClerkName(String clerkName) {
		this.clerkName = clerkName;
	}
	public int getClerkType() {
		return clerkType;
	}
	public void setClerkType(int clerkType) {
		this.clerkType = clerkType;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGsm_Phone() {
		return gsm_Phone;
	}
	public void setGsm_Phone(String gsm_Phone) {
		this.gsm_Phone = gsm_Phone;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "UserData [id=" + id + ", clerkName=" + clerkName + ", clerkType=" + clerkType + ", password=" + password
				+ ", gsm_Phone=" + gsm_Phone + ", contact=" + contact + ", address=" + address + ", memo=" + memo + "]";
	}
	
	
}
