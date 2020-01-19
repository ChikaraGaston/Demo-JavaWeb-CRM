<%@page import="com.jr.model.Client"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
        *{
            margin: 0;
            padding: 0;
        }

        body,html{
            height: 100%;
        }

        .container{
            width: 100%;
            height: 100%;
        }
        a{
        	color:black;
        	text-decoration:none;
        }
        a:hover{
        	color:white;
        }
        
        .panel-heading {
            width: 100%;
            height: 8%;
            line-height: 52px;
            text-align: left;
            background-image: -webkit-linear-gradient(top,#f5f5f5 0,#e8e8e8 100%);
            background-image: -o-linear-gradient(top,#f5f5f5 0,#e8e8e8 100%);
            background-image: -webkit-gradient(linear,left top,left bottom,from(#f5f5f5),to(#e8e8e8));
            background-image: linear-gradient(to bottom,#f5f5f5 0,#e8e8e8 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#ffe8e8e8', GradientType=0);
            background-repeat: repeat-x;
        }

        .rightdiv{
            width:100% ;
            height: 100%;
            float: left;
        }
        .table1{
            width: 100%;
            text-align: center;
            font-size: 24px;
            line-height: 50px;

        }

        .tr1{
            
            color: white;
            background-image: -webkit-linear-gradient(top,#2f2f30 0,#262627 100%);
            background-image: -o-linear-gradient(top,#2f2f30 0,#262627 100%);
            background-image: -webkit-gradient(linear,left top,left bottom,from(#2f2f30),to(#262627));
            background-image: linear-gradient(to bottom,#2f2f30 0,#262627 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff262627', endColorstr='#ff2f2f30', GradientType=0);
            background-repeat: repeat-x;
        }
        .os{
            background-color: #7f7f80;
        }
        .js{
            background-color: #cdcdce;
        }
        .plbtn{
        	font-size:24px;
            cursor:hand;
            width: 58px;
            height: 33px;
            background-color: #cfcfcf;
           
            background-repeat: repeat;
            background-attachment: scroll;
            background-position: center;
            border: 0 solid #000000;
            text-align: center;
            padding-top: 3px;
        }
        .plbtn:hover{
        	color:white
        }
       
    </style>
</head>
<body>

<%
		List<Client> list= (List<Client>) session.getAttribute("list");
%>

<div class="panel-heading">
        <div style="font-size: 24px">&nbsp;&nbsp;&nbsp;用户列表</div>
    </div>

    <br/>

<div class="container">

    <!-- 右边div-->
    <div class="rightdiv">
		<form action="DeleteServlet" method="post">
        <table class="table1" cellpadding="" cellspacing="1">
        
        		<tr>
                <td colspan="9">
                	<input type="submit" class="plbtn" value="删除">
                	&nbsp;   &nbsp;
                    <a href="">首页</a>
                    &nbsp;   &nbsp;
                    <a href="">上一页</a>
                    &nbsp;   &nbsp;
                    <a href="">下一页</a>
                    &nbsp;   &nbsp;
                    <a href="">尾页</a>
                </td>
            	</tr>
            
        	
            <tr class="tr1">
            	<th>选择</th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>联系方式</th>
                <th>客户级别</th>
                <th>客户地址</th>
                <th>操作</th>
            </tr>

			<% for (int i=0;i<list.size();i++) { 
			
				Client c=list.get(i);
			
			%>

            <tr class="<%= i%2==0?"js":"os" %>">
            	<td><input type="checkbox" name="s1" value="<%=c.getId()%>"></td>
                <td><%=c.getId()%></td>
                <td><%=c.getName()%></td>
                <td><%=c.getSex()==0?"女":"男"%></td>
                <td><%=c.getAge()%></td>
                <td><%=c.getTel()%></td>
                <td><%=c.getLevel()%>⭐</td>
                <td><%=c.getAddr()%></td>
                <td>
                    <a href="DeleteServlet?flag=1&id=<%=c.getId()%>">删除</a>
                    <a href="ShowUpdateServlet?id=<%=c.getId()%>">修改</a>
                </td>
            </tr>
            
            <% } %>
      
        </table>
		<input type="hidden" value='2' name="flag"/>
		</form>
    </div>
</div>
</body>
</html>