<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
    <script type="text/javascript">
		function check1(userID) {
			document.location.href="Mypage_control.jsp?action=edit&userID="+userID;
		}
	</script>
    
<section id="top">
	<a id="logo" href="index.jsp"><img src="img/logo.png" width="180px"></a>
	
	<nav id="top_menu">
	<ul>
	<% 
		String login = (String)session.getAttribute("LOGINOK");
		String id = (String)session.getAttribute("MEMBERID");
		String name = (String)session.getAttribute("MEMBERNAME");
		if (login != null && id.equals("admin")) {
	%>
			<li><a href="sub_recipe.jsp">레시피 등록</a></li>
			<li><a href="sub_myrecipe.jsp">나만의 레시피</a></li>
			<li><a href="sub_talk.jsp">요리토크</a></li>
			<li><a href="viewMemberList.jsp">회원 목록</a></li>
	<%
		} else {
	%>
		<li><a href="sub_recipe.jsp">요리레시피</a></li>
		<li><a href="sub_myrecipe.jsp">나만의 레시피</a></li>
		<li><a href="sub_talk.jsp">요리토크</a></li>
		<li><a href="sub_cart.jsp">내가 찜한 레시피</a></li>
	<% } %>
	</ul>
	</nav>
			
	<nav id="top_menu_right">
		<ul>
			<li>
			<%
				if(login == null) {
			%>
				<a href="loginForm.jsp">로그인</a>
			<%
				} else {
			%>
				<a href="javascript:check1('<%=id%>')"><%=name %>님,</a></li>
				<li><a href="module/logoutProcess.jsp">로그아웃</a>
			<%
				}
			%>
			</li>
		</ul>
	</nav>
</section>
