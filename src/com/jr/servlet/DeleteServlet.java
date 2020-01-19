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

import com.jr.DBTool;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String flag=request.getParameter("flag");
			
			if(flag.equals("1")) {
				int id =Integer.valueOf(request.getParameter("id"));
				String sql="delete from pei_client where id=?";
				List<Object> param=new ArrayList<Object>();
				param.add(id);
				DBTool.executeUpdateWithSqlAndParams(sql, param);
				response.sendRedirect("ClientServlet");
			}else {
				//批量删除
				//获取选择的ID 1,2,3,4
				String[] values=request.getParameterValues("s1");
				
				
				
				if(values==null) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out1 = response.getWriter();
					out1.print("<script>alert('请选中要删除的用户!');window.location.href='ClientServlet'</script>");
				}else {
					String str="";
					for(int i=0;i<values.length;i++) {
						if(i==values.length-1) {
							str+=values[i];
						}else {
							str+=values[i]+",";
						}
					}
					String sql="delete from pei_client where id in("+str+")";
					
					DBTool.executeUpdateWithSqlAndParams(sql, null);
					response.sendRedirect("ClientServlet");
				}
		}
			
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
