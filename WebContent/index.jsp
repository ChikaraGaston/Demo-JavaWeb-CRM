<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
}

.container {
	width: 100%;
	height: 100%;
	background-color: #145e97;
}

.logindiv {
	width: 400px;
	height: 270px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -200px;
	margin-top: -125px;
	background-color: rgba(0, 0, 0, 0.4);
	border-radius: 10px;
}

.t1 {
	color: white;
	text-align: center;
}

.table1 {
	color: white;
	font-size: 20px;
	margin: 0 auto;
	width: 270px;
	text-align: center;
	line-height: 40px;
}

.tijiao {
	width: 100%;
	height: 35px;
	background-color: orange;
	margin: 15px auto;
	border-radius: 5px;
	font-size: 25px;
	color:white;
	border:0px solid red;
}

.btdiv2 {
	width: 100%;
	height: 35px;
	background-color: red;
	margin: 15px auto;
	border-radius: 5px;
	font-size: 25px;
}

 
</style>

</head>
<body>


	<div class="container">
		<div class="logindiv">
			<br />
			<h2 class="t1">杰瑞图书管理系统</h2>
			<br />
			<form action="LoginCheckServlet" method="post">
				<table class="table1">
					<tr>
						<td>账号:</td>
						<td><input type="text" placeholder="请输入账号" name="username"/></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input type="password" placeholder="请输入密码" name="pwd"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="btdiv"> <input type="submit" value="提交" class="tijiao"></div>
							<div class="btdiv2">注册</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>