<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String userId = (String)session.getAttribute("userId");
   String userName = (String)session.getAttribute("userName");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
<title>join</title>
<style type="text/css">
header {
	margin: 5px;
	padding: 10px;
	width: 1000px;
}

.manubar {
	width: 300px;
	position: relative;
	left: 73%;
}

.manunav {
	width: 400px;
	position: relative;
}

.messagelist {
	width: 45px;
	height: 40px;
}

.profileimg {
	width: 60px;
	height: 60px;
	border-radius: 30px 30px 30px 30px;
}
</style>
<script src="/hifive/resources/js/jquery-3.3.1.min.js" ></script>
<script type="text/javascript">
	function callMyPage() {
		var userId = $("#userid").val();
		
		$.ajax({
			url : "/hifive/info",
			type : "post",
			data : {userid : userId},
			dataType : "json",
			success : function(data){							
				location.href = "/hifive/views/user/mypage.jsp";
			}			
		}); //ajax
	} //callMyPage
</script>
</head>

<body>
	<input type="hidden" id="userid" name="userid" value=<%= userId %>>
	<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<div class="container1">
		<header>

			<div id="logo">
				<a href="/hifive/main.jsp"> <img
					src="/hifive/resources/image/sample3.jpeg"
					class="rounded mx-auto d-block" alt="로고" title="메인 페이지로 이동">
				</a>
			</div>
			<div class="manubar">

				<nav class="manunav">
					<table>
						<tr>
							<th><%= userName %>님 &nbsp;&nbsp;</th>

							<th><a href="/hifive/views/message/messageList.jsp"> <img
									src="/hifive/resources/image/sample5.jpeg" alt="알림이모티콘"
									class="messagelist" title="요청받은 목록">
							</a>&nbsp;</th>

							<th><a href="/hifive/profileinfo?userid=<%= userId %>"> <img
									src="/hifive/resources/image/sample4.jpeg" alt="얼굴사진"
									class="profileimg" title="프로필로 이동">
							</a>&nbsp;</th>

							<th>
								<div class="dropdown" id="support">
									<a class="btn btn-secondary btn-outline-secondary dropdown-toggle" href="#"
										role="button" id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> ... </a>

									<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<a class="dropdown-item" href="/hifive/views/support/notice/noticeList.jsp">공지사항</a> 
										<a class="dropdown-item" href="/hifive/info?userid=<%= userId %>" onclick="callMyPage()">마이페이지</a> 
										<a class="dropdown-item" href="/hifive/views/support/report/reportList.jsp">신고게시판</a>
										<a class="dropdown-item" href="/hifive/views/support/tutorial.jsp">튜토리얼</a> 
										<a class="dropdown-item" href="/hifive/views/support/safety.jsp">안전유의사항</a>
										<a class="dropdown-item" href="/hifive/logout">로그아웃</a>
										
									</div>
								</div>
							</th>
						</tr>
					</table>
				</nav>

			</div>



		</header>

	</div>


</body>
</html>