<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
<title>join</title>

<style type="text/css">
	.container{
		margin: 0 auto;
	}
	
	header, footer {
   		margin: 5px;
   		padding: 10px;
   		width: 1000px;
	}
   	 				
</style>
<script type="text/javascript" src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var userid = $("#uid").val();
		
		// 나에게 온 대화신청 목록
		$.ajax({	
			url : "/hifive/mrlist",
			type : "get",
			data : { uid : userid },
			dataType : "json",			
			success : function(data){
				//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
				var jsonStr = JSON.stringify(data);
							
				//문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				var values = "";
				for(var i in json.list){
					values += "<tr><td>" + json.list[i].sender + "</td><td>" 
					+ json.list[i].accept + "</td><td><a href='/hifive/mraccept?sender=" 
					+ json.list[i].sender + "&uid=" + userid + "'>" 
					+ "수락</a></td><td><a href='/hifive/mrreject?sender="
					+ json.list[i].sender + "&uid=" + userid  +"'>" +  "거절</a></td></tr>";
				}										
				$("#mrlist").html($("#mrlist").html()+values);			
				
			}, // success
			error : function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			} // error
		});

		// 내가 한 대화신청 목록
		$.ajax({	
			url : "/hifive/mrlist_m",
			type : "get",
			data : { uid : userid },
			dataType : "json",			
			success : function(data){
				//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
				var jsonStr = JSON.stringify(data);
							
				//문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				var values = "";
				for(var i in json.list){
					values += "<tr><td>" + json.list[i].user_id + "</td><td>" 
					+ json.list[i].accept + "</td><td><a href='/hifive/mrequestc?sender="+ userid + "&userid=" + json.list[i].user_id 
					+ "'>"+ "취소" +"</a></td></tr>";
					/* values += "<tr><td>" + json.list[i].user_id + "</td><td>" 
					+ json.list[i].accept + "</td></tr>"; */
				}										
				$("#mrlist_m").html($("#mrlist_m").html()+values);			
				
			}, // success
			error : function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			} // error
		});
		

		// 나의 대화 목록
		$.ajax({			
			url : "/hifive/mlist",
			type : "get",
			data : { uid : userid },
			dataType : "json",			
			success : function(data){
				//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
				var jsonStr = JSON.stringify(data);							
				//문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				var values = "";
				for(var i in json.list){
					
					if(json.list[i].user1 != userid){
						values += "<tr><td>" + json.list[i].list_no
						+ "</td><td><a href='/hifive/mpage?listno=" + json.list[i].list_no 
						+ "&uid=" + userid  + "'>" + json.list[i].user1
						+ "</a></td><td>" + json.list[i].user2
						+ "</td></tr>";
					} else{
						values += "<tr><td>" + json.list[i].list_no
						+ "</td><td>" + json.list[i].user1
						+ "</td><td><a href='/hifive/mpage?listno=" + json.list[i].list_no 
						+ "&uid=" + userid  + "'>" + json.list[i].user2
						+ "</a></td></tr>";
					}
				}			
								
				$("#mlist").html($("#mlist").html()+values);
				
				
			}, // success
			error : function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			} // error
		}); 
	
	});	
</script>


	
</head>

<body>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>	
	
	<div class="container">
		<%@ include file="../../header.jsp" %> <hr>
			
		<section>
			<h4 style="background:olive; color:white;">나에게 온 대화신청 목록</h4>
			내아이디 : <input type="text" id="uid" value="<%= userId %>" size="15" readonly style="text-align:center;">
			<table id="mrlist" border="1" cellspacing="0">
				<tr><th>요청자</th><th>상태</th><th>수락</th><th>거절</th></tr>
			</table>
			<br> 수정해야됨..!!!!!!<br><br>
		</section>
		
		<section>
			<h4 style="background:olive; color:white;">내가 한 대화신청 목록</h4>
			내아이디 : <input type="text" id="uid" value="<%= userId %>" size="15" readonly style="text-align:center;">
			<table id="mrlist_m" border="1" cellspacing="0">
				<tr><th>상대방 아이디</th><th>상태</th><th>취소</th></tr>
			</table>
			<br>수락/거절 a태그로 만듬. 이미 수락된요청은 안보이게 바꿔야됨..!! 디자인 수정해야됨..!!!!!!<br><br><br>
			<a href="/hifive/mrequest?userid=<%= userId  %>">user02에게 대화신청</a> <br>
			아직 회원검색 안되서, 임의의 아이디를 주고, 신청/취소 해봄<br><br>
			
			
		</section>
		
		<section>
			<h4 style="background:olive; color:white;">내 대화목록</h4>
			내아이디 : <input type="text" id="uid" value="<%= userId %>" size="15" readonly style="text-align:center;">
			<table id="mlist" border="1" cellspacing="0">
				<tr>
					<th>번호</th>
					<th>아이디1</th>
					<th>아이디2</th>
				</tr>
			</table>
			<br>아이디 클릭하면 대화창나옴. 없는것도 빈화면만 나오게 바꾸기..<br><br>
		</section>
		
		<br>
		<br>
		<br>

		<hr>
		
		<%@ include file="../../footer.jsp" %> 
	</div>
	
</body>
</html>