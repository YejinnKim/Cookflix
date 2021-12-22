<%@ page contentType="text/html; charset=utf-8" %>
<%
	session.removeAttribute("LOGINOK");
	session.removeAttribute("MEMBERID");
	response.sendRedirect("../index.jsp");
%>
