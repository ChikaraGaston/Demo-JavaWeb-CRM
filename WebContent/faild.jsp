<%@page import="java.io.PrintWriter"%>
<%@page import="com.jr.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<style>
        .faild{
            font-family: 楷体;
            font-size: 100px;
        }
        img{
            border-radius: 10px;
        }
    </style>
    <script>
        window.onload=function(){
            var num=3;
            setInterval(function(){
                if(num==0){
                    location.href="sign_in.jsp";
                }else{
                    var span=document.getElementById("s");
                    span.innerHTML=num;
                }
                num=num-1;
            },1000);
        }
    </script>
	<% 
    User u=(User)session.getAttribute("users");
	if(u==null){
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out1 = response.getWriter();
	out1.print("<script>alert('账号或密码填写错误');window.location.href='sign_in.jsp';</script>");
	}
	%>
</head>
<body>
<img src="image/fengge.jpg" alt=""/>
<label class="faild">等<span id="s">3</span>s喂峰哥吃屁</label>
</body>
</html>