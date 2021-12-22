<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}

</script>
<link rel="stylesheet" href="style.css"/>
<title> COOKFLIX - 회원 정보 수정 </title>
</head>

<jsp:useBean id="user" scope="request" class="user.User"/>

<body>

<header>
	<jsp:include page="module/top.jsp" flush="false"/>
</header>

<div align="center">
<H2>회원 정보 수정 </H2>

<form name=form1 method=post action=Member_control.jsp>
<input type=hidden name="userID" value="<%=user.getUserID()%>">
<input type=hidden name="action" value="update">

<table border="1">
  <tr>
    <th>아이디</th>
    <td><input type="text" name="userID" value="<%=user.getUserID() %>"></td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type="text" name="userPassword" value="<%=user.getUserPassword() %>"></td>
  </tr>
    <tr>
    <th>닉네임</th>
    <td><input type="text" name="userName" value="<%=user.getUserName() %>"></td>
  </tr>
      <tr>
    <th>email</th>
    <td><input type="text" name="userEmail" value="<%=user.getUserEmail() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center>
    <input type=submit value="저장">
    <input type="button" value="삭제" onClick="delcheck()">
    <input type="button" value="목록" onClick="location.href='Member_control.jsp?action=list'"></td>
</tr>
</table>
</form>
</div>

<footer>
	<jsp:include page="module/bottom.jsp" flush="false"/>
</footer>
</body>
</html>