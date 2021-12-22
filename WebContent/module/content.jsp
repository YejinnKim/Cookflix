<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.Recipe" %>
<%@ page import="content.RecipeDAO" %>
<%@ page import="content.myrecipe" %>
<%@ page import="content.myrecipeDAO" %>
<%@ page import="java.util.ArrayList" %>


	<section id="recommend">
    	<h3><a href="sub_recipe.jsp">지금 뜨는 레시피</a></h3>
    	<%
			RecipeDAO recipeDAO = new RecipeDAO();
			ArrayList<Recipe> list1 = recipeDAO.getRank();
			
			for(Recipe recipe1 : list1) {
		%>
			<div>
				<a href="sub_recipeView.jsp?no=<%= recipe1.getNo() %>">
				<img src="se2/upload/<%= recipe1.getImage() %>" width="198" height="198"></a>
				<br><%= recipe1.getTitle() %>
			</div>
		<%
			}
		%>
      	<div class="clear"></div>
  	</section>
  	
  	<section id="recommend">
    	<h3><a href="sub_recipe.jsp">방법별 레시피</a></h3>
    	<div>
			<a href="sub_recipe.jsp?action=filter&category=밥/죽/면류">
			<img src="data/김치볶음밥.jpg" width="198"></a>
			<br>밥/죽/면
		</div>
    	<div>
			<a href="sub_recipe.jsp?action=filter&category=국/찌개/탕">
			<img src="data/설렁탕.jpg" width="198"></a>
			<br>국/찌개/탕
      	</div>
    	<div>
			<a href="sub_recipe.jsp?action=filter&category=조림/볶음/구이">
			<img src="data/닭갈비.jpg" width="198"></a>
			<br>조림/볶음/구이
   	    </div>
     	<div>
			<a href="sub_recipe.jsp?action=filter&category=튀김/부침">
			<img src="data/계란말이.jpg" width="198"></a>
			<br>튀김/부침
      	</div>
      	<div>
			<a href="sub_recipe.jsp?action=filter&category=김치/밑반찬">
			<img src="data/배추김치.jpg" width="198"></a>
			<br>김치/밑반찬
      	</div>
      	<div class="clear"></div>
  	</section>
  	
  	<section id="recommend">
    	<h3><a href="sub_myrecipe.jsp">나만의 레시피</a></h3>
    	<%
			myrecipeDAO myrecipeDAO = new myrecipeDAO();
			ArrayList<myrecipe> list2 = myrecipeDAO.getRank();
			
			if(list2.size() < 5) {
		%>
			<div>
				나만의 레시피 데이터가 없습니다.<br>새로운 글을 작성해주세요!
			</div>	
		<%
			} else {
				for(myrecipe myrecipe1 : list2) {
		%>
				<div>
					<% 
						if(myrecipe1.getImage() == null){
							
							%>
							<a href="sub_myrecipeView.jsp?no=<%= myrecipe1.getNo() %>">
							<img src="img/logo.png" width="198" height="198"></a>
							<br><%= myrecipe1.getTitle() %>
							<% 
						}
						else{
					%>
							<a href="sub_myrecipeView.jsp?no=<%= myrecipe1.getNo() %>">
							<img src="se2/upload/<%= myrecipe1.getImage() %>" width="198" height="198"></a>
							<br><%= myrecipe1.getTitle() %>
				</div>
		<%
						}
				}
			}
		%>
      	<div class="clear"></div>
  	</section>