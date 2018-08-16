<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
   String safetyuserid = (String)session.getAttribute("userId");
%>	

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>안전유의사항</title>
 
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

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
	width: 250px;
	margin: 5px 0 0 0;
	float: left;
}
/* 이게 오른쪽 본문 들어가는 부뷴 */
#content1 {
	width: 740px;
	margin: 5px 0 0 0;
	float: left;
	padding: 0 0 0 10px;
	text-align: center;
}
.card-body {
	text-align: center;
}

#safetycard {
	left: 9%;
}

.table10 {
	left: 20%;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<%@ include file="../../header.jsp"%>
		<hr>
		<div id="main">
			<div id="menu">
				<div class="card" style="width: 250px;">
					<div class="card-body">

						<h5 class="card-title"><%= safetyuserid %></h5>

						<h6 class="card-subtitle mb-2 text-muted">(이름및 지역)</h6>
						<p class="card-text">
							......<br> <br> <br> <br> <br> <br>
							<br> <br> <br>
						</p>
						<a href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a>

					</div>
				</div>

			</div>
			<div id="content1">

				<%@ include file="../../supportmenu.jsp"%>
				</div>

			<div id="content2">
			<br>
				<div class="card" style="width: 600px;" id="safetycard">
					<div class="card-body">
						<h5 class="card-title">안전유의사항</h5>
						<br>

						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<br>
				
						<form onsubmit="return CheckForm()" action="/hifive/safetycheck?userid=<%= userid %>" method="get" name="safety">
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input"
									id="safetyCheck" name="safetyCheck"> 
								<label class="form-check-label"
									for="safetyCheck">Check me out</label>
							</div>
							<input type="submit" class="btn btn-primary" value="동의합니다">
						</form>
						<script type="text/javascript">
							function CheckForm() {

								var chk1 = document.safety.safetyCheck.checked;

								if (!chk1) {
									alert('체크 안 함');
									return false;
								}
							}
						</script>

					</div>
				</div>
			</div>
			
		</div>
		<br>
		<hr>
		<%@ include file="../../footer.jsp"%>
	</div>

</body>
</html>