<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="" method="get">
	<h5><b>UID：${uid}</b></h5>
	
	<input type="hidden" id="update_uid${uid}" value="${uid}">
	
	<p>姓名：<input type="text" id="update_name${uid}" value="${name}" /></p>
	
	<p>性別：<select id="update_sex${uid}">
		<option value="${sex}">預設：${sex}</option>
		<option value="male">男性</option>
		<option value="female">女性</option>
	</select></p>
	
	<p>年齡：<input type="text" id="update_old${uid}" value="${old}"></p>
	
	<input type="button" value="修改" onclick="updateFunction(${uid})">
	
</form>
<span id="updateFunctionResult${uid}"></span>