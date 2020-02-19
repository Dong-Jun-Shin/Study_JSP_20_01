package com.mvc.board.vo;

public class BoardExamVO {
	private int num;
	private String author;
	private String title;
	private String content;
	private String writeday;
	private int readcnt;
	private int reproot;
	private int repstep;
	private int repindent;
	private String passwd;
	private int cCount;

	// 조건 검색 시 사용할 속성
	private String search = "";
	private String keyword = "";

	public BoardExamVO() {
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getReproot() {
		return reproot;
	}

	public void setReproot(int reproot) {
		this.reproot = reproot;
	}

	public int getRepstep() {
		return repstep;
	}

	public void setRepstep(int repstep) {
		this.repstep = repstep;
	}

	public int getRepindent() {
		return repindent;
	}

	public void setRepindent(int repindent) {
		this.repindent = repindent;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	@Override
	public String toString() {
		return "BoardExamVO [num=" + num + ", author=" + author + ", title=" + title + ", content=" + content
				+ ", writeday=" + writeday + ", readcnt=" + readcnt + ", reproot=" + reproot + ", repstep=" + repstep
				+ ", repindent=" + repindent + ", passwd=" + passwd + ", cCount=" + cCount + ", search=" + search
				+ ", keyword=" + keyword + "]";
	}

}
