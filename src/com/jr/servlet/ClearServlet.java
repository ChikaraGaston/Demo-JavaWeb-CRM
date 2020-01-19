package com.jr.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jr.DBTool;




@WebServlet("/ClearServlet")
public class ClearServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name=request.getParameter("username");
		String pwd=request.getParameter("pwd");
		String pwd2=request.getParameter("pwd2");
			
		String sql="update pei_user set pwd=? where username=?";
		List<Object> param=new ArrayList<Object>();
		param.add(pwd);
		param.add(name);
		int count=DBTool.executeUpdateWithSqlAndParams(sql, param);
		if(count>0) {
			response.sendRedirect("LoginCheckServlet?username="+name+"&pwd="+pwd);
		}else {
			response.sendRedirect("faild.jsp");
		}
		

		
	}

	
	
	
	
	
	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
