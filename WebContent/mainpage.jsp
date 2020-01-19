<%@page import="java.io.PrintWriter"%>
<%@page import="com.jr.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎来到杰瑞CRM办公系统</title>
<link rel="icon" href="image/cqcq.png" >
<style type="text/css">

        /*全局*/
        a,input{outline:none;}

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
            background-color: #cfcfcf;
        }

        /*顶部*/
        .top{
            height: 8%;
            width: 100%;
            position:relative;
            z-index: 1;

        }
        .rtop{
            height: 100%;
            width: 69%;
            background-color: #2f2f30;
            margin-left: 0.5%;
            float: left;
            background-image: -webkit-linear-gradient(top,#2f2f30 0,#262627 100%);
            background-image: -o-linear-gradient(top,#2f2f30 0,#262627 100%);
            background-image: -webkit-gradient(linear,left top,left bottom,from(#2f2f30),to(#262627));
            background-image: linear-gradient(to bottom,#2f2f30 0,#262627 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff262627', endColorstr='#ff2f2f30', GradientType=0);
            background-repeat: repeat-x;
        }
        .rtop_center{
            height: 100%;
            width: 70%;
            margin: 0 auto;
            color: gray;
            text-align: left;
            line-height: 70px;
            font-size: 40px;
            position:relative;
        }

        .imgg1{
            width: 10%;
            float: left;
        }
        .imgg1 img{
            width: 50px;
            position:absolute;
            top:50%;
            transform:translate(0,-50%);
        }
        .rtop_center:hover{
            color: whitesmoke;
        }
        .ltop{
            float: right;
            height: 100%;
            width: 30%;
            background-color: #2f2f30;
            color: gray;
            text-align: center;
            margin-right: 0.5%;
            background-image: -webkit-linear-gradient(top,#2f2f30 0,#262627 100%);
            background-image: -o-linear-gradient(top,#2f2f30 0,#262627 100%);
            background-image: -webkit-gradient(linear,left top,left bottom,from(#2f2f30),to(#262627));
            background-image: linear-gradient(to bottom,#2f2f30 0,#262627 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff262627', endColorstr='#ff2f2f30', GradientType=0);
            background-repeat: repeat-x;
        }
        .ltop_center{
            height: 100%;
            width: 70%;
            margin: 0 auto;
            color: gray;
            text-align: center;
            line-height: 70px;
            font-size: 20px;
            float: left;
        }
        .ltop_center:hover{
            color: whitesmoke;
        }

        /*下拉菜单*/
        ul,a{
            color: gray;
            list-style: none;
            text-decoration: none;
            text-align: center;
            border: 0px solid black;
            border-radius: 5px;
            margin-top: 1px;
        }
        a{
            display: block;
        }

        .plat{
            display: none;
            background-color: #2f2f30;
        }

        .ltop_center{
            float: left;
            margin-left: 1px;
        }
        .ltop_center:hover .plat{
            display: block;
            clear: both;
            color: white;
        }
        .plat li:hover>a{
            background-color: dimgrey;
            color: white;
        }

        /*底部*/
        .divdown{
            height: 88%;
            /*background-color: red;*/
        }
        /*底部左边*/
        .leftdiv{
            width:10%;
            height: 100%;
            text-align: center;
            background-color: #3f3f40;
            float: left;
            border-radius: 10px;
            margin-left: 0.5%;
            background-image: -webkit-linear-gradient(top, #424243 0,#262627 100%);
            background-image: -o-linear-gradient(top,#424243 0,#262627 100%);
            background-image: -webkit-gradient(linear,left top,left bottom,from(#424243),to(#262627));
            background-image: linear-gradient(to bottom,#424243 0,#262627 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff424243', endColorstr='#ff2f2f30', GradientType=0);
            background-repeat: repeat-x;
        }
        .u1 li{
            font-size: 24px;
            font-weight: bold;
            line-height: 60px;
            list-style: none;


            /*鼠标放上去变成手*/
            cursor:pointer;
        }

        /*鼠标放上去变成白色*/
        .u1 li:hover{
            color: whitesmoke;
        }
        /*底部右边*/
        .rightdiv{

            width:88%;
            height: 100%;
            text-align: center;
            /*background-color: #2F2F31;*/

            margin-left: 11.3%;
            border-radius: 10px;
        }

        .rbottom{

            height: 100%;
            width:100% ;
        }

    </style>

    <script>
        function changePage(num){
            //先获取到iframe
            var iframe=document.getElementById("f1");
            if(num==1){
                iframe.src="list.jsp";
            }else if(num==2){
                iframe.src="add.jsp";
            }else if(num==3){
            	iframe.src="update.jsp";
            }else{
            	iframe.src="search.jsp";
            }
        }
    </script>
    
    <% 
    User u=(User)session.getAttribute("users");
	if(u==null){
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out1 = response.getWriter();
	out1.print("<script>alert('登录已失效请重新登陆');window.location.href='sign_in.jsp';</script>");
	}
	%>
	
</head>



<body>

<div class="container">
    <!-- 顶部布局-->
    <div class="top">
        <!-- 顶部左边滚动-->
        <div class="rtop">
            <div class="rtop_center">
                <marquee direction="right">
                <div class="imgg1">
                    <img src="image/cqcq.png" alt="" width="50"/>
                </div>&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>欢迎来到杰瑞CRM办公系统</strong>
                </marquee>
            </div>
        </div>
        <!-- 右边欢迎信息-->
        <div class="ltop">
            <ul class="ltop_center">
                <a href="#">
                    <img src="image/user.png" alt="" style="width: 30px;position:absolute;top:50%;transform:translate(0,-50%);"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    欢迎您 : 管理员<%=u.getUserName()%>
                </a>
                <ul class="plat">
                    <li><a href="upload.jsp">上传头像</a></li>
                    <li><a href="key.jsp">修改密码</a></li>
                    <li><a href="OutServlet">退出账号</a></li>
                </ul>
            </ul>
        </div>
    </div>
    <br/>
    <!-- 底部布局-->
    <div class="divdown">
        <!-- 底部左部-->
        <div class="leftdiv">
            <br/><br/>
            <img src="image/<%=u.getImg()%>" alt="" width="80"/>
            <br/><br/>
            <h3 style="font-size: 24px;font-weight:bold;line-height: 60px;color: #e0e0e0;" >
                <svg t="1568947306996" class="icon" viewBox="0 0 1024 1024"
                     version="1.1" xmlns="http://www.w3.org/2000/svg"
                     p-id="2002" width="20">
                    <path
                            d="M512 448c-35.296 0-64-28.704-64-64s28.704-64 64-64 64 28.704 64 64-28.704 64-64 64m0-192c-70.592 0-128 57.408-128 128s57.408 128 128 128 128-57.408 128-128-57.408-128-128-128"
                            fill="#181818" p-id="2003"></path><path d="M768 797.632v-69.92a151.904 151.904 0 0 0-151.712-151.68h-208.576A151.904 151.904 0 0 0 256 727.68v69.92C177.632 727.36 128 625.6 128 512 128 299.904 299.936 128 512 128s384 171.904 384 384c0 113.6-49.632 215.36-128 285.632m-448 46.56v-116.48a87.776 87.776 0 0 1 87.712-87.68h208.576A87.776 87.776 0 0 1 704 727.68v116.48a381.568 381.568 0 0 1-384 0m192-780.16C264.96 64 64 264.96 64 512c0 246.976 200.96 448 448 448s448-201.024 448-448c0-247.04-200.96-448-448-448" fill="#181818" p-id="2004">
                </path>
                </svg>
                <%=u.getUserName()%>
            </h3>
            <br/>
            <br/>
            <br/>
            
            <!--菜单-->
            <ul class="u1">
                <li class="cs1" id="cs1" onclick="document.getElementById('cs1').style.background='#2f2f30';
                                            document.getElementById('cs2').style.background='#3f3f40'
                                            document.getElementById('cs3').style.background='#3f3f40'
                                            document.getElementById('cs4').style.background='#3f3f40';changePage(1)">
                    <svg t="1569027457380" class="icon" viewBox="0 0 1024 1024"
                         version="1.1" xmlns="http://www.w3.org/2000/svg"
                         p-id="8955" width="24">
                        <path d="M824.2 699.9c-25.4-25.4-54.7-45.7-86.4-60.4C783.1 602.8 812 546.8 812 484c0-110.8-92.4-201.7-203.2-200-109.1 1.7-197 90.6-197 200 0 62.8 29 118.8 74.2 155.5-31.7 14.7-60.9 34.9-86.4 60.4C345 754.6 314 826.8 312 903.8c-0.1 4.5 3.5 8.2 8 8.2h56c4.3 0 7.9-3.4 8-7.7 1.9-58 25.4-112.3 66.7-153.5C493.8 707.7 551.1 684 612 684c60.9 0 118.2 23.7 161.3 66.8C814.5 792 838 846.3 840 904.3c0.1 4.3 3.7 7.7 8 7.7h56c4.5 0 8.1-3.7 8-8.2-2-77-33-149.2-87.8-203.9zM612 612c-34.2 0-66.4-13.3-90.5-37.5-24.5-24.5-37.9-57.1-37.5-91.8 0.3-32.8 13.4-64.5 36.3-88 24-24.6 56.1-38.3 90.4-38.7 33.9-0.3 66.8 12.9 91 36.6 24.8 24.3 38.4 56.8 38.4 91.4 0 34.2-13.3 66.3-37.5 90.5-24.2 24.2-56.4 37.5-90.6 37.5z" p-id="8956"></path><path d="M361.5 510.4c-0.9-8.7-1.4-17.5-1.4-26.4 0-15.9 1.5-31.4 4.3-46.5 0.7-3.6-1.2-7.3-4.5-8.8-13.6-6.1-26.1-14.5-36.9-25.1-25.8-25.2-39.7-59.3-38.7-95.4 0.9-32.1 13.8-62.6 36.3-85.6 24.7-25.3 57.9-39.1 93.2-38.7 31.9 0.3 62.7 12.6 86 34.4 7.9 7.4 14.7 15.6 20.4 24.4 2 3.1 5.9 4.4 9.3 3.2 17.6-6.1 36.2-10.4 55.3-12.4 5.6-0.6 8.8-6.6 6.3-11.6-32.5-64.3-98.9-108.7-175.7-109.9-110.9-1.7-203.3 89.2-203.3 199.9 0 62.8 28.9 118.8 74.2 155.5-31.8 14.7-61.1 35-86.5 60.4-54.8 54.7-85.8 126.9-87.8 204-0.1 4.5 3.5 8.2 8 8.2h56.1c4.3 0 7.9-3.4 8-7.7 1.9-58 25.4-112.3 66.7-153.5 29.4-29.4 65.4-49.8 104.7-59.7 3.9-1 6.5-4.7 6-8.7z" p-id="8957">
                    </path>
                    </svg> 用户列表
                </li>
                <br/>
                <li class="cs2" id="cs2" onclick="document.getElementById('cs2').style.background='#2f2f30';
                                            document.getElementById('cs1').style.background='#3f3f40'
                                            document.getElementById('cs3').style.background='#3f3f40'
                                            document.getElementById('cs4').style.background='#3f3f40';changePage(2)">
                    <svg t="1569027258818" class="icon" viewBox="0 0 1024 1024"
                         version="1.1" xmlns="http://www.w3.org/2000/svg"
                         p-id="8837" width="24">
                        <path d="M678.3 642.4c24.2-13 51.9-20.4 81.4-20.4h0.1c3 0 4.4-3.6 2.2-5.6-30.8-27.6-65.6-49.7-103.7-65.8-0.4-0.2-0.8-0.3-1.2-0.5C719.2 505 759.6 431.7 759.6 349c0-137-110.8-248-247.5-248S264.7 212 264.7 349c0 82.7 40.4 156 102.6 201.1-0.4 0.2-0.8 0.3-1.2 0.5-44.7 18.9-84.8 46-119.3 80.6-34.5 34.5-61.5 74.7-80.4 119.5C147.9 794.5 138 841 137 888.8c-0.1 4.5 3.5 8.2 8 8.2h59.9c4.3 0 7.9-3.5 8-7.8 2-77.2 32.9-149.5 87.6-204.3C357 628.2 432.2 597 512.2 597c56.7 0 111.1 15.7 158 45.1 2.5 1.5 5.5 1.7 8.1 0.3zM512.2 521c-45.8 0-88.9-17.9-121.4-50.4-32.4-32.5-50.3-75.7-50.3-121.6 0-45.9 17.9-89.1 50.3-121.6S466.3 177 512.2 177s88.9 17.9 121.4 50.4c32.4 32.5 50.3 75.7 50.3 121.6 0 45.9-17.9 89.1-50.3 121.6C601.1 503.1 558 521 512.2 521zM880 759h-84v-84c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v84h-84c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h84v84c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-84h84c4.4 0 8-3.6 8-8v-56c0-4.4-3.6-8-8-8z" p-id="8838">
                        </path>
                    </svg> 增加客户
                </li>
                <br/>
                <li id="cs4" onclick="document.getElementById('cs4').style.background='#2f2f30';
                                            document.getElementById('cs1').style.background='#3f3f40'
                                            document.getElementById('cs3').style.background='#3f3f40'
                                            document.getElementById('cs2').style.background='#3f3f40';changePage(4)">
                    <svg t="1568947097252" class="icon" viewBox="0 0 1024 1024"
                         version="1.1" xmlns="http://www.w3.org/2000/svg"
                         p-id="1884" width="24">
                        <path
                                d="M192 448c0-141.152 114.848-256 256-256s256 114.848 256 256-114.848 256-256 256-256-114.848-256-256z m710.624 409.376l-206.88-206.88A318.784 318.784 0 0 0 768 448c0-176.736-143.264-320-320-320S128 271.264 128 448s143.264 320 320 320a318.784 318.784 0 0 0 202.496-72.256l206.88 206.88 45.248-45.248z"
                                fill="#181818" p-id="1885">
                        </path>
                    </svg> 查询客户
                </li>
                <br/>
                <li id="cs3" onclick="document.getElementById('cs3').style.background='#2f2f30';
                                            document.getElementById('cs1').style.background='#3f3f40'
                                            document.getElementById('cs2').style.background='#3f3f40'
                                            document.getElementById('cs4').style.background='#3f3f40';changePage(3)">
                    <svg
                            t="1568947505184" class="icon" viewBox="0 0 1024 1024"
                            version="1.1" xmlns="http://www.w3.org/2000/svg"
                            p-id="2239" width="24">
                        <path
                                d="M128 896h768v-64H128zM256 704v-146.752l224-224L626.752 480l-224 224H256zM608 205.248L754.752 352 672 434.752 525.248 288 608 205.248z m214.624 169.408l0.032-0.032a32 32 0 0 0 0-45.248l-0.032-0.032-191.968-191.968-0.032-0.032a32 32 0 0 0-45.248 0l-0.032 0.032L192 530.752V768h237.248l393.376-393.344z"
                                fill="#181818" p-id="2240">
                        </path>
                    </svg> 修改客户
                </li>
                
            </ul>
        </div>

        <!--//底部右边布局-->
        <div class="rightdiv">
            <div class="rbottom">
                <iframe src="ClientServlet" frameborder="0" width="100%" height="100%" id="f1" ></iframe>
            </div>
        </div>
    </div>
</div>
</body>
</html>