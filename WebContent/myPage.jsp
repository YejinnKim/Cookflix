<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<jsp:useBean id="user" scope="request" class="user.User"/>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="style.css"/>
	<title> COOKFLIX - 마이페이지 </title>
	<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 탈퇴하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
	
	function myNameCheck(name){
	if(name == ""){
		alert("닉네임을 확인해주세요.");
		document.regForm.userName.focus();
	}else{
		url="join_Namecheck.jsp?userName=" + name;
		window.open(url,"post","width=300,height=150");
	}
}

</script>
</head>

<body>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>

	<div align="center">
	<form name="form1" action="Mypage_control.jsp" method="post" >
	<input type=hidden name="userID" value="<%=user.getUserID()%>">
	<input type=hidden name="action" value="update">
	<table border="1">
	 	<tr><th colspan="2">개인 정보 수정</th></tr>
	  <tr>
	    <th>아이디</th>	
	    <td style="text-align:left;"><%=user.getUserID() %></td>
	  </tr>
	  <tr>
	    <th>비밀번호</th>
	    <td style="text-align:left;"><input type="password" name="userPassword" maxlength="50" value="<%=user.getUserPassword() %>"></td>
	  </tr>
	  <tr>
	    <th>닉네임</th>
	    <td><input type="text" name="userName" maxlength="20" value="<%=user.getUserName() %>">
	    <input type="button" value="중복 확인" onClick="myNameCheck(this.form.userName.value)"></td>
	  </tr>
	  <tr>
	    <th>이메일</th>
	    <td style="text-align:left;"><input type="email" name="userEmail"value="<%=user.getUserEmail() %>"></td>
	  </tr>  
	  <tr>
	    <td colspan=2 align=center><input type=submit value="수정하기"><input type="button" value="회원탈퇴" onClick="delcheck()"></td>
	  </tr>
	</table>
	</form>
	</div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>	
</html>