package com.javalec.quiz.dto;

public class QDto {
	int seq;
	String name;
	String tel;
	String address;
	String email;
	String rel;
	
	public QDto() {
		// TODO Auto-generated constructor stub
	}
	
	public QDto(int seq, String name, String tel, String address, String email, String rel) {
		super();
		this.seq = seq;
		this.name = name;
		this.tel = tel;
		this.address = address;
		this.email = email;
		this.rel = rel;
	}

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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRel() {
		return rel;
	}

	public void setRel(String rel) {
		this.rel = rel;
	}
	
	

}
