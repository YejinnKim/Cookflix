<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.myrecipeDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
	String realPath = application.getRealPath("/upload");
	System.out.println(realPath);
	int maxSize = 10*1024*1024;

	MultipartRequest multi = new MultipartRequest(request, realPath,maxSize,
			"UTF-8",new DefaultFileRenamePolicy());

	String username = null;
	username = (String)multi.getParameter("userName");
	String userID = null;
	userID = multi.getParameter("userID");
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");	
	String file =  (String)session.getAttribute("fileName");
	
	if (userID == null){
		out.println("<script>alert('로그인하세요!')</script>");
		out.println("<script>location.herf='loginForm.jsp'</script>");
		
	}else{
		if(title == null || content == null){	
		%>
			<script type="text/javascript">
			alert("입력이 안 된 곳이 있습니다");
			location.href="sub_myrecipe.jsp";
		</script>
		<% 
		}
		else{
			myrecipeDAO myrecipeDAO = new myrecipeDAO();
			
			int result = myrecipeDAO.write(title, username , content, file);
			
			if (result == -1){
				out.println("<script>alert('글쓰기에 실패하였습니다.')</script>");
			}
			else{
				pageContext.forward("sub_myrecipe.jsp");
			}
		}
	}
%>
</body>
</html>