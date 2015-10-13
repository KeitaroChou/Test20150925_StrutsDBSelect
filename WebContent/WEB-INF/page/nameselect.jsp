<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>查詢結果</b>
<form action="" method="get">
	<table class="table table-hover">
		<tr>
			<th>UID</th>
			<th>NAME</th>
			<th>SEX</th>
			<th>OLD</th>
		</tr>
		<tr>
			<td>${uid }</td>
			<td>${name }</td>
			<td>${sex }</td>
			<td>${old }</td>
			<!-- <td><input type="button" id="alter" value="修改" onclick="updateDataSeach()"></td> -->
		</tr>
	</table>
	<%-- <input type="hidden" id="name" name="name" value="${name }"> --%>
</form>
</body>
</html>