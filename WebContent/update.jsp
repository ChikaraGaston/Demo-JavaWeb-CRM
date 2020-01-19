<%@page import="com.jr.model.Client"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改</title>
<link rel="icon" href="image/cqcq.png" >
<style>
        *{
            margin: 0;
            padding: 0;
        }

        html,body{
            height: 100%;
            width: 100%;
        }

        .container{
            height: 100%;
            width: 100%;
            background-color:#CFCFCF;
        }

        .panel-heading {
            width: 100%;
            height: 8%;
            line-height: 55px;
            text-align: left;
            background-image: -webkit-linear-gradient(top,#f5f5f5 0,#e8e8e8 100%);
            background-image: -o-linear-gradient(top,#f5f5f5 0,#e8e8e8 100%);
            background-image: -webkit-gradient(linear,left top,left bottom,from(#f5f5f5),to(#e8e8e8));
            background-image: linear-gradient(to bottom,#f5f5f5 0,#e8e8e8 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#ffe8e8e8', GradientType=0);
            background-repeat: repeat-x;
        }

        .rightdiv{
            height: 600px;
            /*width:100% ;*/
            /*height: 92%;*/
            width: 1000px;

            /*left: 50%;*/
            top: 50%;

            position: absolute;
           /* background-color: rgba(0,0,0,0.15);*/

            /*margin-left: -400px;*/
            margin-top: -280px;
            border-radius: 10px;
            
            background-image: -webkit-linear-gradient(top,#f5f5f5 0,#e8e8e8 100%);
            background-image: -o-linear-gradient(top,#f5f5f5 0,#e8e8e8 100%);
            background-image: -webkit-gradient(linear,left top,left bottom,from(#f5f5f5),to(#e8e8e8));
            background-image: linear-gradient(to bottom,#f5f5f5 0,#e8e8e8 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#ffe8e8e8', GradientType=0);
            background-repeat: repeat-x;
        }
        input{
            height: 30px;
        }
        .table1{
        	
            border-spacing:10px 30px;
            width:100% ;
            height: 100%;
            left: 50%;
            color: black;
            font-size: 26px;
            margin: 0 auto;
            width: 250px;
        }

        .but{
            margin-top: 18%;
            margin-left: 25%;
            border: 0px;
            width: 300px;
            height: 50px;
            background-color: rgba(209, 211, 221, 0.4);
            font-size:24px;
            color:grey;
            border-radius: 8px;
            /*鼠标放上去变成手*/
            cursor:pointer;
        }
        .but:hover{
            color: black;
        }

        select {

            text-align: center;

            text-align-last: center;

        }
		.tanwan{

            height: 600px;
            width: 460px;
            top: 50%;
            position: absolute;
            border-radius: 10px;
            margin-left: 1020px;
            margin-top: -280px;
            border-radius: 10px;
        }

    </style>
</head>


<body>

<%
		Client c=(Client)request.getAttribute("c");

%>

<div class="container">
    <div class="panel-heading">
    <div style="font-size: 24px">&nbsp;&nbsp;&nbsp;添加用户</div>
    </div><br><br>
        <div class="rightdiv">
            <form action="SaveUpdateServlet" method="post">
				<br>
                <table class="table1">
                    <tr>
                        <td colspan="2">姓名：</td>
                        <td>
                            <input type="text" name="name" value="<%=c.getName()%>"/>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">性别：</td>
                        <td>
                            <input type="radio" name="sex" <%=c.getSex() == 0 ? "" : "checked"%> value="1"/>
                            <lable for="man">男</lable>
                            &nbsp; &nbsp;
                            <input type="radio" name="sex" <%=c.getSex() == 0 ? "checked" : ""%> value="0"/>
                            <lable for="woman">女</lable>

                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">年龄：</td>
                        <td>
                            <input type="text" name="age" value="<%=c.getAge()%>"/>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">联系方式：</td>
                        <td>
                            <input type="text" name="tel"  value="<%=c.getTel()%>"/>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">客户级别：</td>
                        <td>
                            <select name="level" style="width: 175px;height: 30px" id="s1">
                                <option value="0" selected="selected">--请选择--</option>
                                <option value="1">一星⭐</option>
                                <option value="2">二星⭐</option>
                                <option value="3">三星⭐</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">客户地址：</td>
                        <td>
                            <input type="text" name="addr" value="<%=c.getAddr()%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div align="center">
                                <input type="submit" value="修改" class="but"/>
                            </div>
                        </td>
                    </tr>

                </table>
                <input type="hidden" name="id" value="<%=c.getId()%>">
            </form>
        </div>
        <div class="tanwan">
        <img src="image/tanwan2.gif" alt="" width="460px"/>
        <img alt="" src="image/tanwan.gif" width="460">
        <img src="image/tawan3.gif" alt="" width="140"/>&nbsp;&nbsp;
        <img src="image/tawan3.gif" alt="" width="140"/>&nbsp;&nbsp;
        <img src="image/tawan3.gif" alt="" width="140"/>
    </div>
</div>
<script>
	      <%--
			document.getElementById("s1").value="<%=c.getLevel()%>";
			--%>
	      
	      var star="<%=c.getLevel()%>";
			
			var sel=document.getElementById("s1");
			
			sel.value=star; 
	
	</script>
</body>
</html>