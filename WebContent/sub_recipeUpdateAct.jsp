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
	int no = Integer.parseInt(request.getParameter("No"));
	if(Recipe.getTitle() == null || Recipe.getContent()==null){
%>
	<script type="text/javascript">
		alert("입력이 안 된 곳이 있습니다");
		location.href="sub_recipe.jsp";
	</script>
<% 
	} else {
		RecipeDAO recipeDAO = new RecipeDAO();
		int result = recipeDAO.Update(no, Recipe.getTitle(), Recipe.getContent());
		if (result == -1){
			out.println("<script>alert('글쓰기에 실패하였습니다.')</script>");
		} else {
			pageContext.forward("sub_recipeView.jsp?no="+no);
		}
	}
%>
</body>
</html>