package com.jxust.ssm.pojo;

public class SubType {
	private int id;
	private String code;
	private String name;
	private String detail;
	private String image_path;
	private int parentCode;
	
	public int getParentCode() {
		return parentCode;
	}
	public void setParentCode(int parentCode) {
		this.parentCode = parentCode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	@Override
	public String toString() {
		return "SubType [id=" + id + ", code=" + code + ", name=" + name + ", detail=" + detail + ", image_path="
				+ image_path + ", parentCode=" + parentCode + "]";
	}

}
