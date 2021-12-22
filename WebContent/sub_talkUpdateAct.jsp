<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.TalkDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Talk" class= "content.Talk" scope="page"/>
<jsp:useBean id="TalkDAO" class="content.TalkDAO"/>
<jsp:setProperty name="Talk" property="title"/>
<jsp:setProperty name="Talk" property="content"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	int no = Integer.parseInt(request.getParameter("No"));
	
	if(Talk.getTitle() == null || Talk.getContent()==null){
			
%>
		<script type="text/javascript">
		alert("입력이 안 된 곳이 있습니다");
		location.href="sub_talk.jsp";
		</script>
<% 
	} else{
		TalkDAO talkDAO = new TalkDAO();
		int result = TalkDAO.Update(no, Talk.getTitle(), Talk.getContent());
		if (result == -1) {
			out.println("<script>alert('글쓰기에 실패하였습니다.')</script>");
		}
		else{
			pageContext.forward("sub_talk.jsp");
		}
	}
%>
</body>
</html>