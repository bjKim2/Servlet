package com.javalec;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Hello
 */
// 골뱅이는 굉장한? 클래스 
@WebServlet("/naver.nhn") //Servlet Mapping
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //throws 는 클래스한테 에러를 던지고 해결하라고함,트라이 캐치는 내가 해결하는 것.
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		System.out.println("Hello World");
		
		
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		
		out.println("<head>");
		out.println("<body>");
		out.println("<h1> Hello World</h1>");
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
