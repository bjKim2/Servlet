package com.javalec.oneline.homecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.oneline.command.OCommand;
import com.javalec.oneline.command.ODeleteCommand;
import com.javalec.oneline.command.OListCommand;
import com.javalec.oneline.command.OUpdateCommand;
import com.javalec.oneline.command.OUpdateView;
import com.javalec.oneline.command.OWriteCommand;

/**
 * Servlet implementation class OFrontController
 */
@WebServlet("*.do")
public class OFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actiondo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actiondo(request,response);
		
	}
	
	protected void actiondo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		OCommand command = null;
		
		switch(com) {
		case "/list.do":
			command = new OListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;
		case "/del.do":
			command = new ODeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case "/write_view.do":
			viewPage = "write_view.jsp";
			break;
		case "/write.do":
			command = new OWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case "/update_view.do":
			command = new OUpdateView();
			command.execute(request, response);
			viewPage = "update_view.jsp";
			break;
		case "/update.do":
			command = new OUpdateCommand();
			command.execute(request, response);
			
			viewPage = "list.do";
			break;
		default:
			break;
		
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
