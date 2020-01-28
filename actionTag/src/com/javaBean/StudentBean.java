package com.javaBean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StudentBean {
	private String id;		//ID	
	private String name;	//이름
	private String snum;	//학번
	private String birth;	//생년월일
	private String pass;	//비밀번호
	private String email;	//전자메일
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSnum() {
		return snum;
	}
	
	public void setSnum(String snum) {
		this.snum = snum;
	}
	
	public String getBirth() {
		return birth.substring(0, 4);
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getPass() {
		String topPass = pass.substring(0, 1);
		String midPass = pass.substring(1, 4).replaceAll(".", "*");
		String botPass = pass.substring(4, pass.length());
		
		return topPass + midPass + botPass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getAge() {
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat now = new SimpleDateFormat("yyyy");
		
		int nowYear = Integer.parseInt(now.format(time));
		int birthYear = Integer.parseInt(birth.substring(0, 4));
		
		return nowYear - birthYear;
	}
}
