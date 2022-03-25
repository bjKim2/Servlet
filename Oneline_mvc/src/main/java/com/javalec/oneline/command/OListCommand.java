package com.javalec.oneline.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.oneline.dao.ODao;
import com.javalec.oneline.dto.ODto;

public class OListCommand implements OCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ODao dao = new ODao();
		ArrayList<ODto> ODtos = dao.list();
		
		request.setAttribute("list", ODtos);

	}

}
