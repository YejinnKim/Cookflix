<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.TalkDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="talk" class= "content.Talk" scope="page"/>
<jsp:useBean id="TalkDAO" class="content.TalkDAO"/>
<jsp:setProperty name="talk" property="title"/>
<jsp:setProperty name="talk" property="content"/>

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
	String file =  multi.getFilesystemName("board_file");
	
	if (userID == null){
		out.println("<script>alert('로그인하세요!')</script>");
		out.println("<script>location.herf='loginForm.jsp'</script>");
		
	}else{
		if(title == null || content == null){
		%>
			<script type="text/javascript">
			alert("입력이 안 된 곳이 있습니다");
			location.href="sub_talk.jsp";
		</script>
		<% 
		}
		else{
			TalkDAO talkDAO = new TalkDAO();
			System.out.println("원 파일 이름 :" + multi.getOriginalFileName("board_file"));
			System.out.println("시스템에 올린 파일 이름 : "+ multi.getFilesystemName("board_file"));
			int result = TalkDAO.write(title, username , content);
			
			if (result == -1){
				out.println("<script>alert('글쓰기에 실패하였습니다.')</script>");
			}
			else{
				pageContext.forward("sub_talk.jsp");
			}
		}
	}
%>
</body>
</html>