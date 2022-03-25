package com.javalec.quiz.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.quiz.dao.QDao;

public class QWriteCommand implements QCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		QDao dao = new QDao();
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String rel = request.getParameter("rel");
		
		dao.write(name, tel, address, email, rel);

	}

}
