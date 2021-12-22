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
	int no = Integer.parseInt(request.getParameter("No"));
	
		if(myrecipe.getTitle() == null || myrecipe.getContent()==null){
			
		%>
			<script type="text/javascript">
			alert("입력이 안 된 곳이 있습니다");
			location.href="sub_myrecipe.jsp";
		</script>
		<% 
		}
		else{
			myrecipeDAO myrecipeDAO = new myrecipeDAO();
			int result = myrecipeDAO.Update(no,myrecipe.getTitle(), myrecipe.getContent());
			if (result == -1){
				out.println("<script>alert('글쓰기에 실패하였습니다.')</script>");
			}
			else{
				pageContext.forward("sub_myrecipe.jsp");
			}
		}
%>
</body>
</html>