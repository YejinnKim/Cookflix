<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.Talk" %>
<%@ page import="content.TalkDAO" %>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function delcheck(no) {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			location.href="sub_talkDelete.jsp?no="+no;
		}
		else
			return;
	}
</script>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="style.css"/>
	<title> COOKFLIX - 요리토크 </title>
</head>

<body>
	<%
		String name = (String)session.getAttribute("MEMBERNAME");
		int no = 0;
		if (request.getParameter("no") != null){
			no = Integer.parseInt(request.getParameter("no"));
		}

		TalkDAO talkDAO = new TalkDAO();
		talkDAO.updateview(no);
		Talk talk = new TalkDAO().gettalk(no);
	%>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>

	<div align=center>
		<table width="800" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td style="width: 20%;">글제목</td>
				<td colspan="2"><%= talk.getTitle() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2"><%= talk.getUsername() %></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td colspan="2"><%= talk.getDate() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="2" style="height:300px;"><%= talk.getContent().replace("\n","<br>") %></td>
			</tr>
			<tr>
				<td colspan="2">
				<%
					if(name !=null && name.equals(talk.getUsername())){	
				%>
						<input type="button" value="수정" onclick="location.href='sub_talkUpdate.jsp?No=<%= no %>'">
						<input type="button" value="삭제" onclick="delcheck(<%= no %>)">
 				<%
					}
				%>
					<input type="button" value="목록" onClick="location.href='sub_talk.jsp'">
				</td>
			</tr>
		</table>
		
	</div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>	
</html>