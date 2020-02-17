package com.mvc.comment.vo;

public class CommentVO {
	private int bc_num;
	private int num;
	private String bc_name;
	private String bc_content;
	private String bc_pwd;
	private String bc_date;

	public CommentVO() {

	}

	public int getBc_num() {
		return bc_num;
	}

	public void setBc_num(int bc_num) {
		this.bc_num = bc_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getBc_name() {
		return bc_name;
	}

	public void setBc_name(String bc_name) {
		this.bc_name = bc_name;
	}

	public String getBc_content() {
		return bc_content;
	}

	public void setBc_content(String bc_content) {
		this.bc_content = bc_content;
	}

	public String getBc_pwd() {
		return bc_pwd;
	}

	public void setBc_pwd(String bc_pwd) {
		this.bc_pwd = bc_pwd;
	}

	public String getBc_date() {
		return bc_date;
	}

	public void setBc_date(String bc_date) {
		this.bc_date = bc_date;
	}

	@Override
	public String toString() {
		return "CommentVO [bc_num=" + bc_num + ", num=" + num + ", bc_name=" + bc_name + ", bc_comment=" + bc_content
				+ ", bc_pwd=" + bc_pwd + ", bc_date=" + bc_date + "]";
	}

}
