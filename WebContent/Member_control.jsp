<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="userDAO" class="user.UserDAO"/> 
<jsp:useBean id="userdb" class="user.User"/>
<jsp:setProperty name="userdb" property="userID" /> 
<jsp:setProperty name="userdb" property="userPassword"/>  
<jsp:setProperty name="userdb" property="userName"/>  
<jsp:setProperty name="userdb" property="userEmail"/>  

<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");
	String ID = request.getParameter("userID");
	
	if(action.equals("list")) {
		pageContext.forward("viewMemberList.jsp");
	}
	else if(action.equals("edit")) {
		User user1 = userDAO.getDB(ID);
		request.setAttribute("user",user1);
		pageContext.forward("Member_edit.jsp");
		
	}
	else if(action.equals("update")) {
			if(userDAO.updateDB(userdb)) {
				response.sendRedirect("Member_control.jsp?action=list");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	else if(action.equals("delete")) {
		if(userDAO.deleteDB(ID)) {
			response.sendRedirect("Member_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else if(action.equals(null)){
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>