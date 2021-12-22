<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.RecipeDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="recipe" class= "content.Recipe" scope="page"/>
<jsp:useBean id="RecipDAO" class="content.RecipeDAO"/>
<jsp:setProperty name="recipe" property="title"/>
<jsp:setProperty name="recipe" property="content"/>
<jsp:setProperty name="recipe" property="category"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	String realPath = application.getRealPath("/upload");
	System.out.println(realPath);
	int maxSize = 10*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(request, realPath,maxSize,
			"UTF-8",new DefaultFileRenamePolicy());
	
	String username = null;
	username = (String)multi.getParameter("userName");
	String category = multi.getParameter("category");
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");	
	String file = (String)session.getAttribute("fileName") ;

	if(title==null || content==null || category==null){		
	%>
		<script type="text/javascript">
		alert("입력이 안 된 곳이 있습니다");
		location.href="sub_recipe.jsp";
		</script>
	<% 
	} else {
		RecipeDAO recipeDAO = new RecipeDAO();
		
			
		int result = recipeDAO.write(title, content, category, file);
		if (result == -1){
			out.println("<script>alert('글쓰기에 실패하였습니다.')</script>");
		} else {
			pageContext.forward("sub_recipe.jsp");
		}
	}
%>
</body>
</html>