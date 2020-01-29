package com.champion.mvc01;

import java.sql.Timestamp;

public class PlaceCommentDTO {

	String pname,id,content;
	int pid ; 
	Timestamp place_date;
	
	
	@Override
	public String toString() {
		return "PlaceCommentDTO [pname=" + pname + ", id=" + id + ", content=" + content + ", pid=" + pid
				+ ", place_date=" + place_date + "]";
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public Timestamp getPlace_date() {
		return place_date;
	}
	public void setPlace_date(Timestamp place_date) {
		this.place_date = place_date;
	} 
	
	
	
}
