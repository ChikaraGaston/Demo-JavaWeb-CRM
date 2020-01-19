<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>重置密码</title>
<link rel="icon" href="image/cqcq.png" >

 <style type="text/css">

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
            background-image: url("image/rock2.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-color: #000001;
            -ms-background-position-y: 20px;
            background-position-y: 20px;;
            /*background-size:100% 100%;*/
            /*-moz-background-size:100% 100%;*/
        }
        .logindiv{
            border: solid #c90111;
            height: 300px;
            width: 400px;

            left: 50%;
            top: 50%;

            position: absolute;
            background-color: rgba(0,0,0,0.5);

            margin-left: -200px;
            margin-top: -125px;
            border-radius: 10px;
        }
        .t1{
            /*border: solid red;*/
            color: white;
            text-align: center;
        }
        .table1{
            /*border: solid red;*/
            color: white;
            font-size: 20px;
            margin: 0 auto;
            width: 280px;
            text-align: center;
            line-height: 50px;
        }

        .but{
            border: 0px;
            width: 60px;
            height: 40px;
            background-color: rgba(0,0,0,0.4);
            font-size:16px;
            color:white;
            border-radius: 10px;

            /*鼠标放上去变成手*/
            cursor:pointer;
        }

        .but:hover{
            color: red;
        }
        .btdiv{
            width: 100px;
            height: 35px;
            margin: 10px auto;
            background-color: orange;
            border-radius: 5px;
            font-size: 18px;
        }

        .sr{
            font-size: 18px;
        }
        .sr:focus{

        }
    </style>
</head>
<body>
<div class="container">
<form action="ClearServlet" method="post">
 <div class="logindiv">
        <br/>
        <h2 class="t1">请重置您的登陆密码</h2>
        <br/>
        <table class="table1">
        	<tr>
                <td>账号:</td>
                <td><input style="border-radius: 5px;" type="text" class="sr" name="username"/></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input style="border-radius: 5px;" type="password" class="sr" name="pwd"/></td>
            </tr>
            <tr>
                <td>确认:</td>
                <td><input style="border-radius: 5px;" type="password"  class="sr" name="pwd2"/></td>
            </tr>
        </table>
        <br/>

        <tr>
            <td colspan="2">
                <div class="dz" align="center">
                    <input type="submit" value="重置" class="but"/>
                </div>
                <!--<div class="btdiv">-->
                    <!--登陆-->
                <!--</div>-->
            </td>
        </tr>


    </div>
</form>

</div>
</body>
</html>