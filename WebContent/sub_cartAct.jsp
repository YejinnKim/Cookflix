<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.CartDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Cart" class= "content.Cart" scope="page"/>
<jsp:useBean id="CartDAO" class="content.CartDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String userid = (String)session.getAttribute("MEMBERID");
	int recipeid = Integer.parseInt(request.getParameter("no"));
	String recipetitle = (String)request.getParameter("title");
	String image = (String)request.getParameter("image");
	
	CartDAO cartDAO = new CartDAO();
	int result = cartDAO.add(userid, recipeid, recipetitle,image);
	
	if (result == -1){
		out.println("<script>alert('찜에 실패하였습니다.')</script>");
	} else {
		pageContext.forward("sub_recipe.jsp");
	}
	
%>

</body>
</html>