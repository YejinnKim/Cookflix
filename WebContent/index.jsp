<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="style.css"/>
	<title> COOKFLIX - 언제 어디서나 먹고 싶은 레시피를 마음껏! </title>
</head>

<body>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>

	<div>
		<jsp:include page="slider/maincontent.jsp" flush="false"/>
	</div>

	<div>
		<jsp:include page="module/content.jsp" flush="false"/>
	</div>

	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>	

</html>


			