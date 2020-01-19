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

@WebServlet("/SaveUpdateServlet")
public class SaveUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("utf-8");
		
		
		String name=request.getParameter("name");
		
		int sex= Integer.parseInt(request.getParameter("sex")) ;
		
		int age=Integer.parseInt(request.getParameter("age")) ;
		
		
		int level=Integer.parseInt(request.getParameter("level")) ;
		
		String tel=request.getParameter("tel");
		
		String addr=request.getParameter("addr");
		
		int id=Integer.parseInt(request.getParameter("id")) ;
		
		
		
		
		//≤Â»Î ˝æ›ø‚
		String sql="update pei_client set name=?,sex=?,age=?,tel=?,level=?,addr=? where id=?";
		
		List<Object> param=new ArrayList<Object>();
		
		
		param.add(name);
		param.add(sex);
		param.add(age);
		param.add(tel);
		param.add(level);
		param.add(addr);
		param.add(id);
		
		
		
		int count=DBTool.executeUpdateWithSqlAndParams(sql, param);
		
		if(count>0) {
			response.sendRedirect("ClientServlet");
		}else {
			response.sendRedirect("add.jsp");
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
