package com.javalec.bbs.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.BDao;
import com.javalec.bbs.dto.BDto;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

public class BListCommand implements BCommand {
// implements 는 인터페이스를 상속 
// extends는 하나만 상속가능하나 implements 는 여러개 상속 가능
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BDao dao = new BDao();
		ArrayList<BDto> dtos = dao.list();
		request.setAttribute("list", dtos);
	}

}
