package com.javalec.quiz.homecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.quiz.command.QCommand;
import com.javalec.quiz.command.QContentViewCommand;
import com.javalec.quiz.command.QDeleteCommand;
import com.javalec.quiz.command.QListCommand;
import com.javalec.quiz.command.QSearchCommand;
import com.javalec.quiz.command.QUpdateCommand;
import com.javalec.quiz.command.QWriteCommand;

/**
 * Servlet implementation class QHomeController
 */
@WebServlet("*.do")
public class QHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actiondo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actiondo(request, response);
	}
	
	protected void actiondo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("utf-8");
		
		QCommand command = null;
		String viewPage = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		
		switch(com){
		case "/list.do":
			command = new QListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;
		case "/content_view.do":
			command = new QContentViewCommand();
			command.execute(request, response);
			viewPage = "contentview.jsp";
			break;
		case "/delete.do":
			command = new QDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case "/update.do":
			command = new QUpdateCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case "/write_view.do":
			viewPage = "write_view.jsp";
			break;
		case "/write.do":
			command = new QWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case "/search.do":
			command = new QSearchCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
		default:
		
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	

}
