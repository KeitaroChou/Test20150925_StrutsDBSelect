<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var i = 6;
	// 倒數顯示
	function timerFunction() {
		i--;
		document.getElementById("timer").innerHTML = i + " 秒後跳到功能頁。";
		// 延遲 1 秒後再呼叫一次
		setTimeout('timerFunction()', 1000);
	}
</script>
<title>登入成功</title>
<!-- 5 秒後跳轉 -->
<meta http-equiv="refresh" content="5,url=main.action">
</head>

<body onload="timerFunction()">
	<h3 class="text-success">登入成功，歡迎回來 ${user }</h3>
	<h5><span id="timer"></span></h5>
</body>
</html>