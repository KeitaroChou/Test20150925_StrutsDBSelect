<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>登入</title>
</head>
<body>
<div class="container">

<h3><b>登入介面</b></h3>

<hr>

<form action="control/loginCheck.action" method="post">
	<p>ＩＤ：<input type="text" name="user" /></p>
	<p>ＰＷ：<input type="password" name="pwd" /></p>
	<hr>
	<p><input type="submit" value="登入" /></p>
</form>

</div>
</body>
</html>