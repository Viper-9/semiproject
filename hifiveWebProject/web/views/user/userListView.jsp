<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, user.model.vo.User" %>
<%
	ArrayList<User> list = 
		(ArrayList<User>)request.getAttribute("list");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>userlist</title>
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

	
<style type="text/css">
/* 전체 사이즈 1000에 맞게 사이즈 해놨으니 안 바꾸셔도 될거에여.. */

/* 여기 이새끼가 전체 우리 컨테이너 역할 */
.container {
	margin: 0 auto;
	padding: 10px;
}

/* 이게  우리가 이제 만들어야할 공간 */
#main {
	width: 1000px;
	overflow: hidden;
}
/* 이게 왼쪽 메뉴부분!! float:left 가  다음 창을 붙여준다 */
#menu {
	width: 200px;
	/* height: 500px; */
	margin: 5px 0 0 0;
	float: left;
}
/* 이게 오른쪽 본문 들어가는 부뷴 */
#content1 { /* 사진부분  */
	width: 740px;
	margin: 5px 0 0 0;
	float: left;
	padding: 0 0 0 10px;
	text-align: center;
}
     
   .box1{
      width: 300px;
      position: relative;
      left: 85%;       
   }
   header{
          margin: 5px;
          padding: 10px;
           width: 1000px;
           
       }
       
   #adminlogo{
     width: 28px;
     height: 28px;
   }
      
</style>	
<script type="text/javascript">
	$("#loginStop").click(function(){ 
		console.log("개빡친다 미친");
		var rowData = new Array();
			var tdArr = new Array();
			var checkbox = $("input[name=loginconfirm]:checked");
			
			// 체크된 체크박스 값을 가져온다
			checkbox.each(function(i) {
	
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				
				// 체크된 row의 모든 값을 배열에 담는다.
				rowData.push(tr.text());
				
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var no = td.eq(1).text()+", "
				var userid = td.eq(2).text()+", ";
				
				// 가져온 값을 배열에 담는다.
				tdArr.push(no);
				tdArr.push(userid);
				tdArr.push(name);
				tdArr.push(email);
				
				console.log("no : " + no);
				console.log("userid : " + userid);
	
			});
			
	});
</script>
</head>
<body>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="/hifive/resources/js/bootstrap.min.js"></script>

<div class="container">
		<%@ include file="../../adminheader.jsp" %>
		<hr>
		<br>
		<div id="main">
			<div id="menu">
				<%@ include file="../../adminsupportmenu.jsp"%>
			</div>
			<div id="content1">
				<h5 align="center"><b>회원 정보 리스트</b></h5>
<br> 
<table class="table table-sm" align="center" cellspacing="0" >
<thead>
<tr>
	
	<th class="text-secondary">ID</th>
	<!-- <th>Pwd</th> -->
	<th class="text-secondary">Name</th>
	<th class="text-secondary">Email</th>
	<th class="text-secondary">Phone</th>
	<th class="text-secondary">Birth</th>
	<th class="text-secondary">Gender</th>
	<th class="text-secondary">Join_Date</th>
	<th class="text-secondary">Safety</th>
	<th class="text-secondary">Login</th>

	
</tr>
</thead>

<% for(User u : list){ %>
<tr>
	<td><%= u.getUser_Id() %></td>
	<%-- <td><%= u.getUser_Pw() %></td> --%>
	<td><small><%= u.getUser_Name() %></small></td>
	<td><small><%= u.getEmail() %></small></td>
	<td><small><%= u.getPhone() %></small></td>
	<td><small><%= u.getBirth() %></small></td>
	<td><small><%= u.getGender() %></small></td>
	<td><small><%= u.getJoin_Date() %></small></td>
	<td><small><%= u.getSafety_check() %></small></td>
	<td>
	<% if(u.getRestriction().equals("N")) { %>
	O
	<% } else { %>
	X
	<% } %>
	<input type="checkbox" name="loginconfirm">
	</td>
	
</tr>
<% } %>
<tr><th colspan="9">
	<br>
	<button class="btn btn-primary btn-sm" id="loginStop">확인</button>
	&nbsp;
	<!-- <button class="btn btn-primary btn-sm" id="loginStop">로그인 제한</button> -->
	<button class="btn btn-primary btn-sm" id="loginRe">로그인 허용</button>
    </th> 
</tr>
</table>
<button class="btn btn-primary btn-sm" id="loginStop">로그인 제한</button>
			</div>
		</div>
		
		
		<br> 
		<hr>
		<%@ include file="../../footer.jsp"%>
	</div>	


</body>
</html>