package com.javalec.quiz.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.quiz.dao.QDao;
import com.javalec.quiz.dto.QDto;

public class QSearchCommand implements QCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		QDao dao = new QDao();
		
		String sel =  request.getParameter("sel");
		String words = request.getParameter("words");
		System.out.println(sel);
		System.out.println(words);
		
		ArrayList<QDto> dtos = dao.search(sel, words);
		
		request.setAttribute("list", dtos);

	}

}
