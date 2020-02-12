package com.mvc.common.controller;

public class ViewResolver {
	public String prefix;	// ./WEB-INF/폴더경로... 등의 파일명 앞까지의 경로
	public String suffix;	// .jsp 등의 확장자

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	public String getView(String viewName) {
		return prefix + viewName + suffix;
	}
}
