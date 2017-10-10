package com.jxust.ssm.pojo;

public class Type {
	private int id;
	private String code;
	private String name;
	private String detail;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "Type [id=" + id + ", code=" + code + ", name=" + name + ", detail=" + detail + "]";
	}

}
