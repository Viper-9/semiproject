<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="user.model.vo.User, java.util.*"%>
<%
	String adminid = (String) session.getAttribute("adminId");
%> --%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메인화면</title>


<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<!-- <script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->

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

</head>

<body>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="/hifive/resources/js/bootstrap.min.js"></script>

	<div class="container">
		<header>
			<img src="/hifive/resources/image/sample3.jpeg"
				class="rounded mx-auto d-block" alt="로고">

			<div class="box1">
				<table>
					<tbody>
					 <tr>					 	
					 	<th>
					 	 	<img src="/hifive/resources/image/adminsample.jpg" id="adminlogo" alt="로고">
					 	</th>
					 	<th>
					 	 <h6 class="font-weight-bold">관리자 페이지</h6>
					 	</th>					 	
					 	<th>
							<div class="dropdown" id="adminsupport">
									<a class="btn dropdown-toggle p-3 mb-2 bg-white text-dark font-weight-bold" href="#"
										role="button" id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> ... </a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<a class="dropdown-item" href="">회원 관리</a>
										<a class="dropdown-item" href="">공지사항 관리</a>
										<a class="dropdown-item" href="">신고게시판 관리</a>
										<a class="dropdown-item" href="">튜토리얼 관리</a> 
										<a class="dropdown-item" href="">안전유의사항 관리</a>
										<a class="dropdown-item" href="">이용약관 관리</a>
										<a class="dropdown-item" href="">정책 관리</a>
										<a class="dropdown-item" href="">로그아웃</a>
									</div>
							 </div>
						</th>
					 </tr>
					</tbody>	
				</table>		
			</div>
		</header>
		<hr>
		<div id="main">
			<div id="menu">
				<%@ include file="./adminsupportmenu.jsp"%>
			</div>
			<div id="content1">
			</div>
		</div>
		
		
		<br>
		<hr>
		<%@ include file="../../footer.jsp"%>
	</div>


</body>
</html>