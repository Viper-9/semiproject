<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Search</title>
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
#content1 { /* 사진부분  */
	width: 740px;
	margin: 5px 0 0 0;
	float: left;
	padding: 0 0 0 10px;
	text-align: center;
}

.card-title {
text-align: left;
}



.card-text {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="../../header.jsp"%>
		<hr>
	<div id="main">
		<div id="menu">
			<div id="content0">
				<div class="card" style="width: 250px;">
					<div class="card-body">
						<h5 class="card-title">사용자 기본정보</h5>
						<h6 class="card-subtitle mb-2 text-muted">(이름및 지역)</h6>
						<p class="card-text">
							......<br> <br> <br> <br> <a
								href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a>
					</div>
				</div>
			</div>
		</div>
		<div id="content1">
			<div id="searching">
				<ul class="nav nav-tabs" id="searchTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="searchHTab" data-toggle="tab" href="#searchH" role="tab"
						aria-controls="searhH" aria-selected="true">HOST</a></li>
					<li class="nav-item"><a class="nav-link" id="searchSTab"
						data-toggle="tab" href="#searchS" role="tab"
						aria-controls="searchS" aria-selected="false">SURFER</a></li>
					<li class="nav-item"><a class="nav-link" id="searchPTab"
						data-toggle="tab" href="#searchP" role="tab"
						aria-controls="searchP" aria-selected="false">PARTNER</a></li>
				</ul>
				<br>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="searchH"
					role="tabpanel" aria-labelledby="searchHTab">
				<form action="">
					<table border="0" width="710px">
						<tr>
							<td>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										&nbsp;&nbsp;&nbsp; <span class="btn btn-outline-secondary"
											id="searchpnums">인원</span> <input type="number"
											placeholder="0" max="10" class="form-control" id="pnumber">
									</div>

								</div>
							</td>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										&nbsp;&nbsp; <span class="btn btn-outline-secondary"
											id="preferG">성별</span>
									</div>
									<select class="custom-select" id="searchhostprefergender"
										name="preferredgender">
										<option selected>선택</option>
										<option value="male">남성</option>
										<option value="female">여성</option>
										<option value="both">상관없음</option>
									</select>
								</div>
								</div>
							</td>
						</tr>
					</table>
					<div class="col input-group mb-3">
						<div class="input-group-prepend">
							<span class="btn btn-outline-secondary" id="searchpnums">가능
								조건</span>
						</div>
						&nbsp;&nbsp;
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-dark active"> <input
								type="checkbox" name="possible" id="searchpossible"
								value="kids">아이동반
							</label>
						</div>
						&nbsp;&nbsp;
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-dark"> <input
								type="checkbox" name="possible" id="searchpossible"
								value="pet">애완동물동반
							</label>
						</div>
						&nbsp;&nbsp;
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-dark"> <input
								type="checkbox" name="possible" id="searchpossible"
								value="smoke">흡연
							</label>
						</div>
						&nbsp;&nbsp;
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-dark"> <input
								type="checkbox" name="possible" id="searchpossible"
								value="drink">음주
							</label>
						</div>
					</div>
					<table border="0" width="710">
						<tr>
							<td>
								<div class="col input-group mb-3">
									<div class="input-group-prepend">
										<span class="btn btn-outline-secondary">숙소</span>
									</div>
									<select class="custom-select" name="searchsleeping"
										id="searchsleepling">
										<option value="">선택</option>
										<option value="living">거실</option>
										<option value="single">단독 방</option>
										<option value="sharing">공용 방</option>
										<option value="sofa">소파</option>
									</select>
								</div>
							</td>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="btn btn-outline-secondary">목적지</span>
									</div>
									<input type="text" class="form-control" id="hostdestination">
								</div>
							</td>
						</tr>
					</table>
					<div style="margin-left: 20px;">
						<button type="submit" class="btn btn-primary" id="hostbtn">검색하기</button>
					</div>
				</form>
				</div>
				<div class="tab-pane fade" id="searchS" role="tabpanel"
					style="margin-left: 20px;" aria-labelledby="searchSTab">
				<form>
					<table border="0" width="710">
						<tr>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="btn btn-outline-secondary">목적지</span>
									</div>
									<input type="text" class="form-control" id="destinationS">
								</div>
							</td>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span class="btn btn-outline-secondary">인원</span>
									</div>
									<input type="number" placeholder="0" max="10"
										class="form-control" id="numberS">
								</div>
							</td>
						</tr>
					</table>
					<br>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="btn btn-outline-secondary">여행기간</span>
					</div>
					<input type="date" class="form-control" id="startdateS">
					&nbsp; ~ &nbsp; <input type="date" class="form-control"
						id="enddateS">
				</div>
				<br>
				<button type="submit" class="btn btn-primary" id="surferbtn">검색하기</button>
				</form>
				</div>
				<div class="tab-pane fade" id="searchP" role="tabpanel"
					style="margin-left: 20px;" aria-labelledby="searchPTab">
				<form action="/hifive/partnersearch" method="post">
					<table border="0" width="710">
						<tr>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="btn btn-outline-secondary">목적지</span>
									</div>
									<input type="text" class="form-control" id="destinationP" name="destination">
								</div>
							</td>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span class="btn btn-outline-secondary">인원</span>
									</div>
									<input type="number" placeholder="0" max="10" class="form-control" id="numberP" name="num">
								</div>
							</td>
						</tr>
					</table>
					<br>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="btn btn-outline-secondary">여행기간</span>
						</div>
						<input type="date" class="form-control" id="startdateP" name="startdate">
						&nbsp; ~ &nbsp;
						<input type="date" class="form-control" id="enddateP" name="enddate">
					</div>
					<br>
					<button type="submit" class="btn btn-primary" id="partnerbtn">검색하기</button>
				</form>
				</div>
			</div>
			</div>
			<br><br>
			<div id="searchResult">
				<div class="card" style="width: auto;">
					<div class="card-body">
						<h5 class="card-title">Results</h5> 
						<p class="card-text"><div class="card" style="width: 200px;">
		              	<img class="card-img-top" src="/hifive/resources/image/sample11.jpg" alt="Card image cap">
			             <div class="card-body">
			             <!-- 사용자 이름누르면 사용자 프로필로 -->
			                <a href="#"><h4 class="card-title"><b>사용자 이름</b></h4></a>
			                <p class="card-text">        
			                <h6>사용자 주소</h6>
			                <h6><b>사용자 국적</b></h6>				               
			              </div>
       		 			</div>        		 		
						
					</div>
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