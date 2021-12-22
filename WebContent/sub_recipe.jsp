<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import="content.*" %>    
<jsp:useBean id="recipe" class="content.RecipeDAO"/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="style.css"/>
	<title> COOKFLIX - 요리레시피 </title>
</head>

<body>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>
	
	<div align=center>
	<div style="width: 1000px;">
	<% 
		request.setCharacterEncoding("UTF-8");
		session.setAttribute("action", null);
		String login = (String)session.getAttribute("LOGINOK");
		String id = (String)session.getAttribute("MEMBERID");
		if (login != null && id.equals("admin")) {
	%>
		<input id="btn" type=button onClick="location.href='write_recipe.jsp'" value="글쓰기"><br><br>
	<%
		} 
	%>
	
	<form method="post" action="sub_recipe.jsp?action=search">
	<div id="form">
		<input id="txt" type="text" name="word" placeholder="레시피 검색"/>
		<button id="search" type="submit"><img src="img/search.png" width="22"></button>
	</div>
	</form><br><br>
	
	<div style="float: left; width: 30%;">
	<table id="a" border=1 style="width: 280px; height: 400px;">
		<tr><td><a href="sub_recipe.jsp?action=filter&category=밥/죽/면류">밥/죽/면</a></td></tr>
		<tr><td><a href="sub_recipe.jsp?action=filter&category=국/찌개/탕">국/찌개/탕</a></td></tr>
		<tr><td><a href="sub_recipe.jsp?action=filter&category=조림/볶음/구이">조림/볶음/구이</a></td></tr>
		<tr><td><a href="sub_recipe.jsp?action=filter&category=튀김/부침">튀김/부침</a></td></tr>
		<tr><td><a href="sub_recipe.jsp?action=filter&category=김치/밑반찬">김치/밑반찬</a></td></tr>
	</table>
	</div>
	
	<div style="float: left; width: 70%;">
		<table border=1 style="width:700px">
		
		<%
			String action = request.getParameter("action");
			String category = request.getParameter("category");
			String word = request.getParameter("word");
			RecipeDAO recipeDAO = new RecipeDAO();
			ArrayList<Recipe> list = null;
			
			if(action != null) {
				if(category != null) {
		%>
			<tr>
				<th colspan="3"><%= category %></th>
			</tr>
		<%	
				}
				if (action.equals("filter")) {
					list = recipeDAO.filterList(category);
				}
				else if(action.equals("search")) {
					list = recipeDAO.searchList(word);
				}

				for(Recipe recipe1 : list) {
		%>	
		<tr>
			<td rowspan=1 width=155 height=155><img src="se2/upload/<%= recipe1.getImage() %>" width=150></td>
			<th height=50><a id="a1" href="sub_recipeView.jsp?no=<%= recipe1.getNo() %>">
			<%= recipe1.getTitle() %></a></th>
			<td width=100>조회수:<%= recipe1.getView() %></td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td style="height:395px"><h2>카테고리를 선택하세요.</h2></td>
		</tr>
		<%		
			}
		%>
		</table>   
	</div>
	
	</div>
	</div>

	<div class="clear"></div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>	
</html>