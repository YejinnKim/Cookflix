<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.RecipeDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Recipe" class= "content.Recipe" scope="page"/>
<jsp:useBean id="RecipDAO" class="content.RecipeDAO"/>
<jsp:setProperty name="Recipe" property="title"/>
<jsp:setProperty name="Recipe" property="content"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	int no = Integer.parseInt(request.getParameter("no"));
	RecipeDAO recipeDAO = new RecipeDAO();
	
	int result = recipeDAO.delete(no);
	if (result == -1){
		out.println("<script>alert('삭제에 실패하였습니다.')</script>");
	} else {
		pageContext.forward("sub_recipe.jsp");
	}
%>
</body>
</html>