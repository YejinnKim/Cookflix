<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.UserDAO" %>
<jsp:useBean id="user" class = "user.UserDAO"/>

<%
   request.setCharacterEncoding("euc-kr");
   String userName = request.getParameter("userName");
   int check = user.checkName(userName);
%>
<!DOCTYPE html>
<html> 
<head>
<script language="JavaScript" src="script.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b><%=userName%></b>
<%
  if(check == 1){
     out.println("는 이미 존재하는 닉네임입니다.<p>");
}else{    
     out.println("는 사용 가능 합니다.<p>");
}
%>
<a href="javascript:this.close();">닫기</a>
</body>
</html>