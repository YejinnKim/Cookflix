<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:useBean id="userdao" class="user.UserDAO" scope="page"/>
<jsp:setProperty name="user" property="userID" /> 
<jsp:setProperty name="user" property="userPassword"/>  
<meta http-equiv="Content-Type" content="text/html; charsetUTF-8">
<%
	UserDAO userDAO = new UserDAO(); //UserDAO 
	
	int result = userDAO.login(user.getUserID(), user.getUserPassword()); // userDAO 로그인 함수
	
	if (result == 1){
		session.setAttribute("LOGINOK","ok");
		if (request.getParameter("idsave") == null){
			session.removeAttribute("MEMBERSAVE");
		}else{
			session.setAttribute("MEMBERSAVE", "check");
		}
		
		session.setAttribute("MEMBERID", user.getUserID());
		session.setAttribute("MEMBERPWD", user.getUserPassword());
		User user1 = userdao.getDB(user.getUserID());
		session.setAttribute("MEMBERNAME",user1.getUserName());
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("location.href = '../index.jsp'"); //페이지 연결, 홈페이지 연결용
		script.println("</script>");
		
		
			
	
	} // 로그인 완료
	
	else if (result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}  // 비밀번호 실패
	
	else if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	} // 존재하지 않는 아이디
	
	
	else if (result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류')");
		script.println("history.back()");
		script.println("</script>");
	} // 데이터 베이스 오류
%>