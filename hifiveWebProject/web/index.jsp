<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/hifive/resources/image/index/logo2.png" />
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
<title>WELCOME TO Traveler's Couch</title>

<style type="text/css">
section {
	clear: both;
}

.container {
	margin: 0 auto;
	padding: 10px;
}

.box1 {
	width: 140px;
	position: relative;
	left: 140%;
}

.box2 {
	position: relative;
	left: 47%;
}

header {
	margin: 0px;
	padding: 0px;
	padding: 10px;
	width: 1000px;
	height: 190px;
}

#hspInfo {
	height: 600px;
}

#homeinfo {
	/* background: rgba(255, 68, 0, .7); */
	background: url('./resources/image/index/children.png') no-repeat;
	background-size: 100% auto;
	padding: 15px;
	height: 600px;
	
}

#homeinfodiv {
	width: 970px; 
	height: 570px;
	background:rgba(255,255,255, .5); 
	border:0px;
}

#safetyinfo {
	background: rgba(205, 162, 98, .5);
	padding: 15px;
	height: 400px;
	
}

#safetydiv {
	width: 970px; 
	height: 370px;
	background:rgba(255,255,255, .5); 
	border:0px;
}


#indexinfo {
	position: relative;
	z-index: 2;
	background: rgba(255, 68, 0, .5);
}

#indexphoto {
	position: relative;
	z-index: 1;
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
	
	<header>
			
			<a href="/hifive/index.jsp"><img src="/hifive/resources/image/index/logo.png"
				class="rounded mx-auto d-block box2" alt="로고"></a>


			<nav class="box1">
				<!-- <p>box1</p> -->
				<button class="btn btn-outline-dark btn-sm border-0" data-toggle="modal" data-target="#join"
					title="회원가입">&nbsp;&nbsp;Join&nbsp;&nbsp;</button> &nbsp;
				<button class="btn btn-outline-dark btn-sm border-0" data-toggle="modal" data-target="#login"
					title="로그인">Log-in</button>
			</nav>

		</header>

	<div id="indexinfo">
		
	</div>
	<div id="indexphoto" class="carousel slide" data-ride="carousel" >
	
						<ol class="carousel-indicators">
							<li data-target="#indexphoto" data-slide-to="0"
								class="active"></li>
							<li data-target="#indexphoto" data-slide-to="1"></li>
							<li data-target="#indexphoto" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active" style="height:650px;">
								<img class="d-block w-100"
									src="/hifive/resources/image/index/index1.jpg" alt="First slide">
								<div class="carousel-caption d-none d-md-block">
									<h1>사진1</h1>
								</div>

							</div> 
							<div class="carousel-item" style="height:650px;">
								<img class="d-block w-100"
									src="/hifive/resources/image/index/index3.jpg" alt="Second slide">
								<div class="carousel-caption d-none d-md-block">
									<h1>사진2</h1>
								</div>
							</div>
							<div class="carousel-item" style="height:650px;">
								<img class="d-block w-100"
									src="/hifive/resources/image/index/index2.jpg" alt="Third slide">
								<div class="carousel-caption d-none d-md-block">
									<h1>사진3</h1>
								</div>
							</div>
						</div>

						<a class="carousel-control-prev" href="#indexphoto"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#indexphoto" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					
					<br><br>
					<div id="hspInfo">
					<center>
					<div class="card-deck" style="width: 1400px; height: 600px;">
				
						<div class="card">
							<img class="card-img-top"
								src="/hifive/resources/image/couch10.png" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Host</h5>
								<p class="card-text">This is a longer card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-muted">......abc</small>
								</p>
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="card" style="height: 600px;">
							<img class="card-img-top"
								src="/hifive/resources/image/couch1.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Surfer</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
								<p class="card-text">
									<small class="text-muted">......abc</small>
								</p>
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="card">
							<img class="card-img-top"
								src="/hifive/resources/image/sample1.jpeg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Partner</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									card has even longer content than the first to show that equal
									height action.</p>
								<p class="card-text">
									<small class="text-muted">......</small>
								</p>
							</div>
						</div>
					</div>
					</center>
					
				</div>
				<br><br>
				
				<div id="homeinfo">
				
				<center>
				<div id="homeinfodiv" class="alert alert-light">
			
				<h2> Traveler's Couch</h2>
				</div>
				</center>
				</div>
				<br><br>
				
				<div id="safetyinfo">
				
				<center>
				<div id="safetydiv" class="alert alert-light">
			
				<h2> Traveler's Couch</h2>
				</div>
				</center>
				</div>
				
	<div class="container">		
		
		<section>
			<!-- <p>section</p> -->
			<article>
				<!-- <p>article</p> -->
				<div>
				


					<br>
					<!-- <hr> -->
					<br>

					<!--<div class="card-deck" id="hspInfo">
						<div class="card">
							<img class="card-img-top"
								src="/hifive/resources/image/couch10.png" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Host</h5>
								<p class="card-text">This is a longer card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-muted">......abc</small>
								</p>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top"
								src="/hifive/resources/image/couch1.jpg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Surfer</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
								<p class="card-text">
									<small class="text-muted">......abc</small>
								</p>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top"
								src="/hifive/resources/image/sample1.jpeg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Partner</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									card has even longer content than the first to show that equal
									height action.</p>
								<p class="card-text">
									<small class="text-muted">......</small>
								</p>
							</div>
						</div>
					</div> -->

					<!-- <br>
					<hr>
					<br>

					<div class="card border-light mb-3" style="max-width: outo;">
						<div class="card-header">홈페이지에 관한 소개글..</div>
						<div class="card-body text-secondary">
							<h5 class="card-title">^^</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div> -->

				</div>
			</article>
		</section>

		<hr>

		<%@ include file="footer.jsp"%>
	</div>
	
	
<!-- 회원가입 Modal -->
		<div class="modal fade" id="join" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="/hifive/resources/image/logo.png"
							class="modal-title rounded mx-auto d-block">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body"><%@ include file="./views/user/join.jsp" %></div>
				</div>
			</div>
		</div>
		
		<!-- 로그인 Modal -->
		<div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="/hifive/resources/image/logo.png"	class="modal-title rounded mx-auto d-block">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body"> <%@ include file="./views/user/login.jsp" %> <br>
						<div style="text-align: center;">
							 <button type="button" class="btn btn-secondary" style="width:100px;"
								data-dismiss="modal" data-toggle="modal" data-target="#join">회원가입</button>
							<button type="button" data-dismiss="modal" data-toggle="modal"
								data-target="#ipsearch" style="width:215px;"class="btn btn-secondary">아이디/비밀번호
								찾기</button><br>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- id pwd 찾기 Modal -->
		<div class="modal fade" id="ipsearch" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="/hifive/resources/image/logo.png"
							class="modal-title rounded mx-auto d-block">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body"><%@ include
							file="./views/user/ipsearch.jsp"%></div>
				</div>
			</div>
		</div>
</body>
</html>



