package com.jr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jr.DBTool;
import com.jr.model.User;
	
/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet("/LoginCheckServlet")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 request.setCharacterEncoding("utf-8");
		//获取到用户名
		 String name=request.getParameter("username");
		
		 //获取到用户密码
		 String pwd=request.getParameter("pwd");
		 
		 String sql="select * from pei_user where username=? and pwd=?";
		 List<Object> param = new ArrayList<Object>();
		 param.add(name);
		 param.add(pwd);
		 List<User> users=DBTool.executeQueryWithSqlAndParams(sql, param, new User());
		 System.out.println(users);
		 
		 if(users.size()>0){
			 //成功跳转到主页
			 response.sendRedirect("mainpage.jsp");
			 
			 //获取session			 
			 HttpSession session=request.getSession();
			 session.setAttribute("users",users.get(0));
			 
		
		
		 }else{
				 
			 //失败跳转到失败页面
			response.sendRedirect("faild.jsp");
	}
	}
}
