<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!-- 用戶列表 -->
<s:if test="peopleList.size() > 0">
	<b>所有人員清單</b>
	<p><a href="#tableEnd">前往資料尾部 ↓</a></p>
	<a id="tableTop"></a>
	<table class="table">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>SEX</th>
			<th>OLD</th>
			<th>功能</th>
		</tr>
		<s:iterator value="peopleList">
			<tr>
				<td><s:property value="uid"/></td>
				<td><s:property value="name"/></td>
				<td><s:property value="sex"/></td>
				<td><s:property value="old"/></td>
				<td>
					<form action="" method="get">
						<input type="hidden" id="updateindex_uid${uid }" value="${uid }">
						<input type="button" value="修改" onclick="updateUI(${uid })">
					</form>
				</td>
			</tr>
			<tr><td colspan="5"><span id="updateUIResult${uid }"></span></td></tr>
		</s:iterator>
	</table>
	<a id="tableEnd"></a>
	<a href="#tableTop">前往資料頂部 ↑</a>
</s:if>

<s:if test="peopleList.size() <= 0">
	<h3 class="text-danger"><b>無符合資料</b></h3>
</s:if>
