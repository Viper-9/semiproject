<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./messageError.jsp" %>
<%@ page import="message.model.vo.Message, java.util.ArrayList" %>
<%
	ArrayList<Message> msgList = (ArrayList<Message>)request.getAttribute("mList");
	String userId = (String)request.getAttribute("user_id");
	int listNo = (Integer)request.getAttribute("list_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대화창</title>

<style type="text/css">
	#msgpage {
		width : 400px;
		height : 600px;
		overflow:scroll;
		font-size : 20px;
		border-radius: 7px;
		-webkit-border-radius: 7px;
		-moz-border-radius: 7px;
		box-shadow: 0 1px 9px rgba(51,51,51,.8);
		-webkit-box-shadow: 0 1px 9px rgba(51,51,51,.8);
		-moz-box-shadow: 0 1px 9px rgba(51,51,51,.8);
		background: rgba(255,102,0,.5);
	}
	
	#msgpage .you {
    background-color: #ecf0f1;
    max-width: 60%;
    margin: 4px;
    clear: both;
    float: left;
    border-radius: 7px;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	}
 
	#msgpage .me {
    background-color: #C1E4EC;
    max-width: 60%;
    margin : 4px;
    height: auto;
    clear: both;
    float: right;
    border-radius: 7px;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	}
</style>

</head>
<body>

<div id="msgpage">
	<% for(int i=0; i<msgList.size(); i++) { %>
		<% if( msgList.get(i).getSender().equals(userId) ){%>
		<div class="me"><%= msgList.get(i).getContent() %></div><br>
		<% } else {%>
		<div class="you"><%= msgList.get(i).getContent() %></div><br>
		<% } %>
	<% } %>
</div><br>

<form action="/hifive/msend?listno=<%= msgList.get(0).getList_no()%>&userid=<%=userId%>" method="post">
	<input type="text" name="content" size="48">
	<input type="submit" value="보내기"​>
</form>

<a href="JavaScript:window.location.reload()">페이지 새로고침</a> &nbsp;&nbsp; 
<a href="views/message/messageList.jsp">이전 페이지로</a> &nbsp;&nbsp; <<-- 팝업으로 하면 없앰

<br><h2>디자인수정해야됨..</h2>


</body>
</html>