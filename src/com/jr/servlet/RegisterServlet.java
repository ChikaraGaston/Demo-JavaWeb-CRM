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


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		//获取到用户名
		 String name=request.getParameter("username");
		
		 //获取到用户密码
		 String pwd=request.getParameter("pwd");
		 
		//获取到手机号
		 String tel=request.getParameter("tel");
		 
		 //获取到邮箱
		 String email=request.getParameter("email");
		 
		 //插入数据库
		 String sql="insert into pei_user (username,pwd,tel,email) values(?,?,?,?)";
		 
		 List<Object> param = new ArrayList<Object>();
		 param.add(name);
		 param.add(pwd);
		 param.add(tel);
		 param.add(email);
		 
//		 System.out.println(param);
		 
		 int num=DBTool.executeUpdateWithSqlAndParams(sql, param);
		 if(num>0){
//			 System.out.println("注册成功");
			 response.sendRedirect("LoginCheckServlet?username="+name+"&pwd="+pwd);
		 }else {
//			 System.out.println("注册失败");
			 response.sendRedirect("faild.jsp");
			 
		 }
		 
	}

}
