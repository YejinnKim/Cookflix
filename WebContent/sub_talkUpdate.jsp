<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.Talk" %>
<%@ page import="content.TalkDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title> COOKFLIX - 요리토크</title>
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
	Talk talk = new TalkDAO().gettalk(no);
%>
<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>
	
	<div align="center">
	<form method="post" action="sub_talkUpdateAct.jsp">
	<input type="hidden" name="No" value="<%= no %>">
		<table width="800" border="3" bordercolor="lightgray" align="center">
        <tr>
            <td>작성자</td>
            <td><%=talk.getUsername() %></td>
        </tr>
            <tr>
            <td>
                제 목
            </td>
            <td>
                <input type="text" size="100" maxlength="100" name="title"
                value="<%=talk.getTitle().replaceAll(" ", "&nbsp;") %>">
            </td>        
        </tr>
        <tr>
            <td>
                내 용
            </td>
            <td>
                <textarea  cols="100" rows="20"name="content"id="ir1"><%=talk.getContent() %></textarea>            
            </td>        
        </tr>
       
 
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="submit" value="등록" id="save" >
                <input type="button" value="취소" onclick="location.href='sub_talk.jsp'" >            
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