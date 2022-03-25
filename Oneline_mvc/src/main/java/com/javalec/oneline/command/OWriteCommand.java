package com.javalec.oneline.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.oneline.dao.ODao;

public class OWriteCommand implements OCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ODao dao = new ODao();
		
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		
		dao.write(name, title);
		
	}

}
