<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.Recipe" %>
<%@ page import="content.RecipeDAO" %>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function delcheck(no) {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			location.href="sub_recipeDelete.jsp?no="+no;
		}
		else
			return;
	}
</script>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="style.css"/>
	<title> COOKFLIX - 요리 레시피 </title>
</head>

<body>
	<%
		String name = (String)session.getAttribute("MEMBERNAME");
		int no = 0;
		if (request.getParameter("no") != null){
			no = Integer.parseInt(request.getParameter("no"));
		}
		
		RecipeDAO recipeDAO = new RecipeDAO();
		recipeDAO.updateview(no);
		Recipe recipe = new RecipeDAO().getrecipe(no);
		
		String login = (String)session.getAttribute("LOGINOK");
		String id = (String)session.getAttribute("MEMBERID");
	%>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>

	<div align=center>
		<table width="800" border="3" bordercolor="lightgray" align="center">
			<tr>
				<th><%= recipe.getTitle() %></th>
				<th width=60><a href="sub_cartAct.jsp?no=<%= no %>&title=<%= recipe.getTitle() %>&
				image=<%= recipe.getImage() %>">찜</a></th>
			</tr>
			<tr>
				<td colspan=2><%= recipe.getContent().replace("\n","<br>") %></td>
			</tr>
			<tr>
				<td colspan=2>
				<%
					if (login != null && id.equals("admin")) {
				
				%>
					<input type="button" value="수정" onclick="location.href='sub_recipeUpdate.jsp?No=<%= no %>'">
					<input type="button" value="삭제" onclick="delcheck(<%= no %>)">
 				<%
					}
				%>
					<input type="button" value="목록" onClick="location.href='sub_recipe.jsp?action=filter&category=<%= recipe.getCategory() %>'">
				</td>
			</tr>
		</table>
		
	</div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>	
</html>