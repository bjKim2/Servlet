package com.javalec.oneline.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.oneline.dao.ODao;

public class OUpdateCommand implements OCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ODao dao = new ODao();
		int seq = Integer.parseInt(request.getParameter("seq"));
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		dao.update(seq,name,title);
		
		
	}

}
