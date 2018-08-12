<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="favorite.model.vo.Favorite, java.util.ArrayList" %>
<%
	String userId = (String)request.getAttribute("userId");
	ArrayList<Favorite> list = (ArrayList<Favorite>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>favorite</title>
<script src="/hifive/resources/js/jquery-3.3.1.min.js" ></script>
<script type="text/javascript">

}); 
</script>
</head>
<body>
<h1>favorite 테스트</h1>

<table border="1px">
<tr><th>상대방 아이디</th><th>취소</th></tr>
<% for(Favorite f : list) { %>
<tr>
	<td><%= f.getF_user_id() %></td>
	<td><a href="/hifive/favoritedelete?userid=<%=userId%>&fuserid=<%=f.getF_user_id()%>">취소</a></td>
</tr>
<% } %>
</table>
<br><br>

user02에게
<a href="/hifive/favoriteinsert?userid=<%=userId%>">favorite 등록</a> &nbsp;



</body>
</html>