<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="style.css">
	<title>COOKFLIX - 로그인</title>
</head>

<body>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>
	
	
	<%
	String login = (String)session.getAttribute("LOGINOK");
	String id = (String)session.getAttribute("MEMBERID");
	String pwd = (String)session.getAttribute("MEMBERPWD");
	String check = (String)session.getAttribute("MEMBERSAVE");
	String idStr= null, pwdStr=null, checkStr=null;
	if(check == null){
		idStr = ""; pwdStr = ""; checkStr= "";
	} else {
		idStr = id; pwdStr = pwd; checkStr="checked";
	}
	if (login == null){ %>
	
	<div align="center">
	<H1>로그인</H1><br>
	<form action="module/loginProcess.jsp" method="post" >
	<table style="border: 0; text-align: left;">
	  <tr>	
	    <td><input class="ip" type="text" name="userID" value="<%=idStr %>" placeholder="ID"></td>
	  </tr>
	  <tr>
	    <td><input class="ip" type="password" name="userPassword" value ="<%=pwdStr %>" placeholder="PASSWORD"></td>
	  </tr>
	  <tr>
	    <td align=center width=250><input type=submit value="로그인">&nbsp;
	    <input type=button onClick="location.href='joinForm.jsp'" value="회원가입"></td>
	  </tr>
	</table>
	</form>
	</div>
	
	<%		
	} else {		
		out.print(id+"님, "  );	
	%>		
		<form action="module/logoutProcess.jsp" method="get">
			<input type="submit" value="로그아웃">
		</form>	
	<%		
	}
	%>
	
	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>

</html>