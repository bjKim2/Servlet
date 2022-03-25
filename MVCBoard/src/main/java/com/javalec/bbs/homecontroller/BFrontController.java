package com.javalec.bbs.homecontroller;

import java.awt.Desktop.Action;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.command.BCommand;
import com.javalec.bbs.command.BContentCommand;
import com.javalec.bbs.command.BDeleteCommand;
import com.javalec.bbs.command.BListCommand;
import com.javalec.bbs.command.BModifyCommand;
import com.javalec.bbs.command.BWriteCommand;
import com.javalec.bbs.command.BinsertCommand;

@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request,response);
		
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		BCommand command = null;
		
		
		String uri = request.getRequestURI();
		
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		
		switch(com) {
		case("/list.do"): // 전체 내용 보여주기
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;
		case("/write_view.do"): // 입력 양식 페이지
			viewPage = "write_view.jsp";
			break;
		case("/write.do"): // 입력 하고 목록 보여주기
			command = new BWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case("/content_view.do"): // 한 레이블 고르면 세부 내용 보여주기
			command = new BContentCommand();
			command.execute(request, response);
			viewPage = "Content_view.jsp";
			break;
		case("/modify.do"): // 수정 하고 목록 보여주기
			command = new BModifyCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case("/del.do"): // 삭제 후 목록 보여주기
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		default:
			break;
		}
		
		// 뷰 페이지 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
		
}




//     	--- uri 끝에 자르기 ---
//		String serPath = request.getServletPath();

//		System.out.println(uri);
//		System.out.println(conPath);
//		System.out.println(serPath);
//		System.out.println(com);
//		System.out.println(uri.replaceFirst(conPath,""));