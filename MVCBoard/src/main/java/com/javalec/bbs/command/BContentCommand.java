package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.BDao;
import com.javalec.bbs.dto.BDto;

public class BContentCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String bid = request.getParameter("bid");
		
		BDao dao = new BDao();
		BDto dto = dao.contentView(bid);
		
		request.setAttribute("content_view", dto);

	}

}
