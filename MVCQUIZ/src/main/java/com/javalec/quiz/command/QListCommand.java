package com.javalec.quiz.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.quiz.dao.QDao;
import com.javalec.quiz.dto.QDto;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

public class QListCommand implements QCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		QDao dao = new QDao();
		ArrayList<QDto> QDtos = dao.list();
		
		request.setAttribute("list", QDtos);

	}

}
