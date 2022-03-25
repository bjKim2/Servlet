package com.javalec.oneline.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.oneline.dao.ODao;
import com.javalec.oneline.dto.ODto;

public class OUpdateView implements OCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ODao dao =new ODao();
		int seq = Integer.parseInt(request.getParameter("seq"));
		ODto dto = dao.update_view(seq);
		
		request.setAttribute("update_view", dto);
		
		
	}

}
