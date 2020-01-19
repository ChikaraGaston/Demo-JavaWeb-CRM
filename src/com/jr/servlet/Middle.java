package com.jr.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jr.EmailUtil;

/**
 * Servlet implementation class Middle
 */
@WebServlet("/Middle")
public class Middle extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		
		
		try {
			EmailUtil.sendMsg(email,"http://localhost:8080/jrcrm/sign_up.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out1 = response.getWriter();
		out1.print("<h1>«Îπÿ±’¥ÀÕ¯“≥Õ®π˝” œ‰«∞Õ˘◊¢≤·</h1>");
		response.sendRedirect("http://mail.qq.com");
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
