<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" /> 
<jsp:setProperty name="user" property="userPassword"/>  
<jsp:setProperty name="user" property="userName"/>  
<jsp:setProperty name="user" property="userEmail"/>  

<meta http-equiv="Content-Type" content="text/html; charsetUTF-8">
<%
	UserDAO userDAO = new UserDAO(); //UserDAO 
	
	int result = userDAO.join(user); // userDAO 로그인 함수
	
	if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("history.back()");
		script.println("</script>");
	}  // 데이터 베이스 오류
	
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../index.jsp'"); //페이지 연결, 홈페이지 연결용
		script.println("</script>");
	}
	
%>