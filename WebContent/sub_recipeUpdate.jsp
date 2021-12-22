<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.Recipe" %>
<%@ page import="content.RecipeDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title> COOKFLIX - 요리 레시피 </title>
<link rel="stylesheet" href="style.css"/>
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "se2/SmartEditor2Skin.html",  
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/se2/upload/'+filepath+'">';
	    oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
	} 
</script>
</head>
<body>
<%
	int no = 0;
	if (request.getParameter("No") != null){
		no = Integer.parseInt(request.getParameter("No"));
	}
	Recipe recipe = new RecipeDAO().getrecipe(no);
%>
<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>
	
	<div align="center">
	<form method="post" action="sub_recipeUpdateAct.jsp">
	<input type="hidden" name="No" value="<%= no %>">
		<table width="800" border="3" bordercolor="lightgray" align="center">
		<tr>
        	<td>분류</td>
        	<td>
				<!-- <select name=category>
					<option value="밥/죽/면류">밥/죽/면류</option>
					<option value="국/찌개/탕">국/찌개/탕</option>
					<option value="조림/볶음/구이">조림/볶음/구이</option>
					<option value="튀김/부침">튀김/부침</option>
					<option value="김치/밑반찬">김치/밑반찬</option>
				</select> -->
				<label><%= recipe.getCategory() %></label>
			</td>
        </tr>
            <tr>
            <td>제 목</td>
            <td>
                <input type="text" size="100" maxlength="100" name="title"
                value="<%=recipe.getTitle().replaceAll(" ", "&nbsp;") %>">
            </td>        
        </tr>
        <tr>
            <td>내 용</td>
            <td>
                <textarea  cols="100" rows="20"name="content" id = "ir1"><%=recipe.getContent() %></textarea>            
            </td>        
        </tr>
 
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="submit" value="등록" id="save" >
                <input type="button" value="취소" onclick="location.href='sub_recipe.jsp'" >            
            </td>
        </tr>
    </table>
    </form> 
	</div>
	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>
</html>