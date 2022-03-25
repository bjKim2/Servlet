package com.javalec.oneline.dto;

import java.sql.Timestamp;

public class ODto {
	
	
	//field
	int seq;
	String name;
	String title;
	Timestamp date;
	
	
	//constructor
	public ODto() {
	}
	
	public ODto(int seq, String name, String title, Timestamp date) {
		super();
		this.seq = seq;
		this.name = name;
		this.title = title;
		this.date = date;
	}
	
	
	
	//method
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
