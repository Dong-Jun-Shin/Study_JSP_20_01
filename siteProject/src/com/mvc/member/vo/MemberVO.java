package com.mvc.member.vo;

public class MemberVO {
	private int num;             //회원번호
	private String m_id;         //회원 아이디
	private String m_passwd;     //회원 비밀번호
	private String m_name;       //회원 이름
	private String m_email;      //회원 이메일
	private String m_tel;        //회원 전화번호
	private String reg_date;     //회원 등록일
	
	public MemberVO() {}

	public MemberVO(int num, String m_id, String m_passwd, String m_name, String m_email, String m_tel,
			String reg_date) {
		super();
		this.num = num;
		this.m_id = m_id;
		this.m_passwd = m_passwd;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_tel = m_tel;
		this.reg_date = reg_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
