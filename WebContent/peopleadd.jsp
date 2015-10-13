<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增人員資料</title>
</head>
<body>

<!-- 現在時間 -->
<p><%=new Date() %></p>

<form action="/xxx">
	<p>姓名：<input type="text" name="name"></p>
	<p>性別：<select name="sex">
			<option value="male">男性</option>
			<option value="female">女性</option>
		</select></p>
	<p>年齡：<input type="text" name="old"></p>
</form>

</body>
</html>