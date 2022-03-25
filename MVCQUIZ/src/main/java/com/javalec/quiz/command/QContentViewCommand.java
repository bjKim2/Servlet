package com.javalec.quiz.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.quiz.dao.QDao;
import com.javalec.quiz.dto.QDto;

public class QContentViewCommand implements QCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		QDao dao = new QDao();
		int seq =Integer.parseInt(request.getParameter("seq"));
		QDto dto = dao.content_view(seq);
		request.setAttribute("dto", dto);
	}

}
