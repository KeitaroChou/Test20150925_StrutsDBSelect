<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script language="javascript" type="text/javascript">
	var xmlHttp;
	var updateIndexUid;
	var updateUid;
	
	// 多條件查詢 -------------------------------------------------------------
	function seach() {
		
		xmlHttp = null;
		var uid = document.getElementById('updateSeach_uid').value;
		var name = document.getElementById('updateSeach_name').value;
		var sex = document.getElementById('updateSeach_sex').value;
		var old = document.getElementById('updateSeach_old').value;
		var xmlUrl = "control/test_requirementSelect.action?uid=" + uid + "&name=" + name + "&sex=" + sex + "&old=" + old;
		// alert(xmlUrl);
		xmlHttp = new XMLHttpRequest();
		xmlHttp.open("get", xmlUrl, true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = seachResult;

	}
	function seachResult() {
		if (xmlHttp.readyState == 4) {
			document.getElementById("seachResult").innerHTML = xmlHttp.responseText;
		}
	}
	// --------------------------------------------------------------------
	
	
	// 查詢所有 ------------------------------------------------------------------------
	function selectAllSeach() {
		
		var xmlUrl = "control/test_selectAll.action";
		xmlHttp = new XMLHttpRequest();
		xmlHttp.open("get", xmlUrl, true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = selectAllResult;

	}
	function selectAllResult() {
		if (xmlHttp.readyState == 4) {
			document.getElementById("seachResult").innerHTML = xmlHttp.responseText;
		}
	}
	// ----------------------------------------------------------------------------------
	
	// 新增 -------------------------------------------------------------------------------
	function addFunction() {
		
		var name = document.getElementById('add_name').value;
		var sex = document.getElementById('add_sex').value;
		var old = document.getElementById('add_old').value;
		var photoUid = document.getElementById('add_photoUid').value;
		var xmlUrl = "control/test_addPeople.action?name=" + name + "&sex=" + sex + "&old=" + old + "&photo=" + photoUid;
		alert(xmlUrl);
		xmlHttp = new XMLHttpRequest();
		xmlHttp.open("get", xmlUrl, true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = addFunctionResult;

	}
	function addFunctionResult() {
		if (xmlHttp.readyState == 4) {
			document.getElementById("addFunctionResult").innerHTML = xmlHttp.responseText;
		}
	}
	// -----------------------------------------------------------------------------------
	
	// 呼叫修改頁 (update.jsp) -------------------------------------------------------------
	function updateUI(tempUid) {
		var tempUpdateIndexUid = "updateindex_uid" + tempUid;
		updateIndexUid = document.getElementById(tempUpdateIndexUid).value;
		xmlUrl = "control/updateindex.action?uid=" + updateIndexUid;
		// alert(xmlUrl);
		xmlHttp = new XMLHttpRequest();
		xmlHttp.open("get", xmlUrl, true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = updateUIResult;
	}
	function updateUIResult() {
		if (xmlHttp.readyState == 4) {
			document.getElementById("updateUIResult" + updateIndexUid).innerHTML = xmlHttp.responseText;
		}
	}
	// -----------------------------------------------------------------------------------
	
	// 修改
	function updateFunction(tempUid) {
		var tempUpdateUid = "update_uid" + tempUid;
		var tempUpdateName = "update_name" + tempUid;
		var tempUpdateSex = "update_sex" + tempUid;
		var tempUpdateOld = "update_old" + tempUid;
		updateUid = document.getElementById(tempUpdateUid).value;
		var name = document.getElementById(tempUpdateName).value;
		var sex = document.getElementById(tempUpdateSex).value;
		var old = document.getElementById(tempUpdateOld).value;
		xmlUrl = "control/test_updatePeople.action?uid=" + updateUid + "&name=" + name + "&sex=" + sex + "&old=" + old;
		alert(xmlUrl);
		xmlHttp = new XMLHttpRequest();
		xmlHttp.open("get", xmlUrl, true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = updateFunctionResult;
	}
	function updateFunctionResult() {
		if (xmlHttp.readyState == 4) {
			document.getElementById("updateFunctionResult" + updateUid).innerHTML = xmlHttp.responseText;
		}
	}
	
	// 刪除 -------------------------------------------------------------------------------
	function deleteFunction() {
		
		var uid = document.getElementById('delete_uid').value;
		var xmlUrl = "control/test_deletePeople.action?uid=" + uid;
		// alert(xmlUrl);
		xmlHttp = new XMLHttpRequest();
		xmlHttp.open("get", xmlUrl, true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = deleteFunctionResult;

	}
	function deleteFunctionResult() {
		if (xmlHttp.readyState == 4) {
			document.getElementById("deleteFunctionResult").innerHTML = xmlHttp.responseText;
		}
	}
	// -----------------------------------------------------------------------------------
	
</script>
<title>Main Page</title>
</head>
<body>
<div class="container">

<!-- 現在時間 -->
<%=new Date() %>

<hr><!-- ---------------------------------------------------------------- -->

<h3>修改資料</h3>
<form action="" method="get">
	<p>UID：<input type="text" id="updateSeach_uid" name="updateSeach_uid"/></p>
	<p>姓名：<input type="text" id="updateSeach_name" name="updateSeach_name"/></p>
	<p>性別：<select id="updateSeach_sex" name="updateSeach_sex">
				<option value="">---</option>
				<option value="male">男性</option>
				<option value="female">女性</option>
			</select></p>
	<p>年齡：<input type="text" id="updateSeach_old" name="updateSeach_old"/></p>
	<input type="button" value="條件查詢" onclick="seach()" />
	<input type="button" value="查詢所有人員" onclick="selectAllSeach()" />
</form>
<br/>
<p><span id="seachResult"></span></p>

<hr><!-- ---------------------------------------------------------------- -->

<h3>新增資料</h3>
<form enctype="multipart/form-data" action="" method="get">
	<p>姓名：<input type="text" id="add_name" name="add_name" /></p>
	<p>性別：<select id="add_sex" name="add_sex">
		<option value="male">男性</option>
		<option value="female">女性</option>
	</select></p>
	<p>年齡：<input type="text" id="add_old" name="add_old"></p>
	<p>照片：<input type="file" id="add_photoUid" name="add_photoUid"></p>
	<input type="button" value="新增" onclick="addFunction()">
</form>
<span id="addFunctionResult"></span>

<hr><!-- ---------------------------------------------------------------- -->

<h3>刪除資料</h3>
<form action="" method="get">
	<p>UID：<input type="text" id="delete_uid" name="delete_uid" /></p>
	<input type="button" value="刪除" onclick="deleteFunction()">
</form>
<span id="deleteFunctionResult"></span>

</div>
</body>
</html>