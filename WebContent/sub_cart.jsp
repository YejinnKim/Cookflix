<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.Cart" %>
<%@ page import="content.CartDAO" %>
<%@ page import="java.util.ArrayList"%>   
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="style.css"/>
	<title> COOKFLIX - 내가 찜한 레시피 </title>
</head>

<body>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>

	<div align=center>
		<h1>내가 찜한 레시피</h1>
		<br>
		<table border=1 width="1000px">	
		<%
			String id = (String)session.getAttribute("MEMBERID");
			CartDAO cartDAO = new CartDAO();
			String del = null;
			int no2 = 0;
			ArrayList<Cart> list = cartDAO.getList(id);
			if(id==null){
				%><tr><td>로그인 후 이용바랍니다.</td><tr><%
			} else {
				if(list.size() < 1) {
		%>
					<tr><td>찜 목록이 비어있습니다.</td><tr>
		<%
				} else {
					for(Cart cart1 : list){
		%>
						<tr>
							<td  width=155 height=155><img src="se2/upload/<%= cart1.getImage() %>" width=150></td>		
							<td><a id="a1" href="sub_recipeView.jsp?no=<%= cart1.getRecipeID() %>">
							<%= cart1.getRecipeTitle() %></a></td>
							<td width=100><a href="sub_cart.jsp?del=true&no2=<%= cart1.getNo() %>" id=a1>삭제</a></td>
						</tr>
		<%
					}
				}
			}
			
			del = request.getParameter("del");
			if(del!=null) {
				no2 = Integer.parseInt(request.getParameter("no2"));
				cartDAO.delete(no2);
				response.sendRedirect("sub_cart.jsp");
			}
		%>
			
		</table>
		
	</div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>	
</html>