<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import="user.*" %>

<jsp:useBean id="user" scope="request" class="user.UserDAO"/>



<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="style.css">
	<title>COOKFLIX - 회원 목록</title>
	
	<script type="text/javascript">
		function check(userID) {
			location.href="Member_control.jsp?action=edit&&userID="+userID;
		}
	</script>
</head>

<body>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>
	
	<div align="center">
		<h1>회원 목록</h1><br>
		<table border=1 width="1000px">
			<tr>
				<th>ID</th><th>Password</th><th>Name</th><th>Email</th><th>관리</th>
			</tr>
			<%
				ArrayList<User> list = user.getUserList();
				for(User user1 : list) {
			%>
			<tr>
				<td><%= user1.getUserID() %></td>
				<td><%= user1.getUserPassword() %></td>
				<td><%= user1.getUserName() %></td>
				<td><%= user1.getUserEmail() %></td>
				<td width="100">
				<a href="javascript:check('<%=user1.getUserID()%>')" id="a1">수정/삭제</a>
				</td>
				
			</tr>
			<% } %>
		</table>

	</div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>
</html>