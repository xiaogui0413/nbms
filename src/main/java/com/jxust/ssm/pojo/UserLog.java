package com.jxust.ssm.pojo;

public class UserLog {
			
			private int id;
			private String create_time;
			private String operator;
			private String content;
			private String ip;
			private String remark;
			
			public int getId() {
				return id;
			}
			public void setId(int id) {
				this.id = id;
			}
			public String getCreate_time() {
				return create_time;
			}
			public void setCreate_time(String create_time) {
				this.create_time = create_time;
			}
			public String getOperator() {
				return operator;
			}
			public void setOperator(String operator) {
				this.operator = operator;
			}
			public String getContent() {
				return content;
			}
			public void setContent(String content) {
				this.content = content;
			}
			public String getIp() {
				return ip;
			}
			public void setIp(String ip) {
				this.ip = ip;
			}
			public String getRemark() {
				return remark;
			}
			public void setRemark(String remark) {
				this.remark = remark;
			}
			@Override
			public String toString() {
				return "UserLog [id=" + id + ", create_time=" + create_time + ", operator=" + operator + ", content="
						+ content + ", ip=" + ip + ", remark=" + remark + "]";
			}

}
