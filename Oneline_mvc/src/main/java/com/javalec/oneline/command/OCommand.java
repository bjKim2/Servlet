package com.javalec.oneline.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface OCommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response);				
		

}
