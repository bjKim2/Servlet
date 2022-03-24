package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BCommand {
	//interface abstract 처럼 이름만 정해주는 것
	public void execute(HttpServletRequest request, HttpServletResponse response);
	
}
