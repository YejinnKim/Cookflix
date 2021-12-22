<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function idCheck(id){
		if(id == ""){
			alert("아이디를 확인해주세요.");
			document.regForm.userID.focus();
		}else{
			url="join_IDcheck.jsp?userID=" + id;
			window.open(url,"post","width=300,height=150");
		}
	}
	
function NameCheck(name){
	if(name == ""){
		alert("닉네임을 확인해주세요.");
		document.regForm.userName.focus();
	}else{
		url="join_Namecheck.jsp?userName=" + name;
		window.open(url,"post","width=300,height=150");
	}
}
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css"/>
<title> COOKFLIX - 회원가입 </title>
</head>
<body>

	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>
	
	<div align="center">
	<H1>회원 가입</H1><br>
	<form action="module/joinProcess.jsp" method="post" >
	
	<table id="mypage" border="1">
	  <tr>
	    <th>아이디</th>	
	    <td><input type="text" name="userID" maxlength="15"required>
	    <input type="button" value="중복확인" onClick="idCheck(this.form.userID.value)">
	    </td>
	  </tr>
	  <tr>
	    <th>비밀번호</th>
	    <td style="text-align:left;"><input type="password" name="userPassword" maxlength="50" required></td>
	  </tr>
	  <tr>
	  	<th>비밀번호 확인</th>
	  	<td style="text-align:left;"><input type="password" name="userPassword2" onblur="passchk()" required>
	  	</td>
	  <tr>
	    <th>닉네임</th>
	    <td><input type="text" name="userName" maxlength="20" required>
	    <input type="button" value="중복확인" onClick="NameCheck(this.form.userName.value)"></td>
	  </tr>
	  <tr>
	    <th>이메일</th>
	    <td style="text-align:left;"><input type="email" name="userEmail"></td>
	  </tr>  
	  <tr>
	    <td colspan=2 align=center><input type=submit value="회원가입">&nbsp;
	   <input type=button onClick="location.href='index.jsp'" value="취소"></td>
	  </tr>
	</table>
	</form>
	</div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
	
</body>
</html>