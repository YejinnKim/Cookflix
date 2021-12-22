<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.myrecipeDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="myrecipe" class= "content.myrecipe" scope="page"/>
<jsp:useBean id="myrecipDAO" class="content.myrecipeDAO"/>
<jsp:setProperty name="myrecipe" property="title"/>
<jsp:setProperty name="myrecipe" property="content"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	int no = Integer.parseInt(request.getParameter("no"));
	
		myrecipeDAO myrecipeDAO = new myrecipeDAO();
			int result = myrecipeDAO.delete(no);
			if (result == -1){
				out.println("<script>alert('삭제에 실패하였습니다.')</script>");
			}
			else{
				pageContext.forward("sub_myrecipe.jsp");
			}
		
%>
</body>
</html>