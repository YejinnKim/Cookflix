<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.Talk" %>
<%@ page import="content.TalkDAO" %>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
		function write1(userID) {
			if(userID == 'null'){
				alert("로그인 하세요!!");
				location.href="loginForm.jsp";
			}
			else{
				location.href="writeControl_talk.jsp?action=write&userID="+userID;
			}
		}
</script>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="style.css"/>
	<title> COOKFLIX - 요리토크 </title>
</head>

<body>
<%
	String id = null;
	if(session.getAttribute("MEMBERID") != null){
		id = (String)session.getAttribute("MEMBERID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber")!= null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>

	<div align=center>
	<h1>요리토크</h1>
	<div style="width: 1000px;">
		<input id="btn" type="button" value="글쓰기" onClick="write1('<%= id%>')"><br><br>
	</div><div class="clear"></div>
		<table border=1 width="1000px">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%
					TalkDAO talkDAO = new TalkDAO();
					ArrayList<Talk> list = talkDAO.getList(pageNumber);
					for(int i = 0; i< list.size(); i++){
				%>
				<tr>
					<td width="50"><%= list.get(i).getNo() %></td>
					<td><a id="a1" href ="sub_talkView.jsp?no=<%= list.get(i).getNo() %>&username=<%= list.get(i).getUsername() %>">
					<%=list.get(i).getTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&lt;") %></a></td>
					<td width="100"><%= list.get(i).getUsername() %></td>
					<td width="100"><%= list.get(i).getDate() %></td>
					<td width="100"><%= list.get(i).getView() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
			
		</table>
		<%
			if(pageNumber != 1){
				
		%>
			<a id="a1" href="sub_talk.jsp?pageNumber=<%=pageNumber -1%>">이전</a>
			
		<%
			} if(talkDAO.nextPage(pageNumber + 1)){
		%>
			<a id="a1" href="sub_talk.jsp?pageNumber=<%=pageNumber +1 %>">다음</a>
		<%
			}
		%>
		
	</div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>	
</html>