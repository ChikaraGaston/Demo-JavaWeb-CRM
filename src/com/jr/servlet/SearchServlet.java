package com.jr.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jr.DBTool;
import com.jr.model.Client;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String tel=request.getParameter("tel");
		
		System.out.println(tel);
		
		String sql="select * from pei_client where tel=?";
		
		List<Object> param = new ArrayList<Object>();
		param.add(tel);
		 
		List<Client> list1= DBTool.executeQueryWithSqlAndParams(sql,param,new Client());
		
		HttpSession session = request.getSession();
		session.setAttribute("list1",list1);
				
		
		response.sendRedirect("searchlist.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
