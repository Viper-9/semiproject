<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./messageError.jsp" %>
<%@ page import="message.model.vo.Message, java.util.ArrayList" %>
<%	
	String userId = (String) request.getParameter("uid");
	String ruserId = (String) request.getParameter("rid");
	int listNo = Integer.parseInt(request.getParameter("listno"));
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
		/* background: rgba(255,102,0,.5); */
	}
	
	#msgpage .you {
    background-color: #e7e7eb;
    max-width: 60%;
    margin: 4px;
    padding: 5px;
    clear: both;
    float: left;
    border-radius: 7px;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	box-shadow: 1px 1px 2px rgba(51,51,51,.8);
	}
 
	#msgpage .me {
    background-color: #e7e7eb;
    max-width: 60%;
    margin : 4px;
    padding: 5px;
    height: auto;
    clear: both;
    float: right;
    border-radius: 7px;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	box-shadow: 1px 1px 2px rgba(51,51,51,.8);
	}
</style>
<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var userid = '<%= userId %>';
		var ruserid = '<%= ruserId %>';
		var listNo = <%= listNo %>;
	
		$.ajax({
			url : "/hifive/mpage",
			type : "get",
			data : { uid : userid , listno : listNo , rid : ruserid },
			dataType : "json",			
			success : function(data){
				//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
				var jsonStr = JSON.stringify(data);							
				//문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				var values = "";
				console.log(data.rusername);
				if(json.list.length!=0){				
					for(var i in json.list){						
						if(json.list[i].sender == userid) {
							values += "<div class='me'>"
							+ json.list[i].content + "</div><br>";
						}
						else {
							if(data.ruserimg == null) {
							values += "<div class='you'>"  
							
								+ "<img class='profileimg rounded-circle' src='/hifive/resources/profileUpfiles/profile.png' width='20px'>"
								+ "<font style='font-size:12px'>" + data.rusername + "님</font><br>"
								+ json.list[i].content + "</div><br>";
							}
							else {
							values += "<div class='you'>" 
								+ "<img class='profileimg rounded-circle' src='/hifive/resources/profileUpfiles/" + data.ruserimg +"' width='20px'>"
								+ "<font style='font-size:12px'>" + data.rusername + "님</font><br>"
								+ json.list[i].content + "</div><br>";
							}
							
						}
					}
				} else{
					values += "<tr><td colspan='3'>대화 목록이 없습니다.</td></tr>";
				}
				$("#message").html($("#message").html()+values);			
				
			}, // success
			error : function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			} // error
		});
	});
	
</script>
</head>
<body>

<div id="msgpage">
	<div id="message">
	</div>
</div><br>

<form action="/hifive/msend?listno=<%= listNo %>&userid=<%=userId%>&rid=<%= ruserId %>" method="post">
	<input type="text" name="content" size="42">
	<input type="submit" value="보내기"​>
</form> 

</body>
</html>