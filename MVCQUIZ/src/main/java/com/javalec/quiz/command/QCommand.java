package com.javalec.quiz.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface QCommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response);
	
}
