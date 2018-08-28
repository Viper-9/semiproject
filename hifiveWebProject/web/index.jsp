<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/hifive/resources/image/logo2.png" />
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
<title>WELCOME TO Traveler's Couch</title>

<style type="text/css">
   
    section{
       clear: both;
       
    }
    
    .container{
      margin: 0 auto;
      padding: 10px;
   }
   
   .box1{
      width: 140px;
      position: relative;
      left: 95%;      
   }
   header{
          margin: 5px;
          padding: 10px;
           width: 1000px;
           
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
			<img src="/hifive/resources/image/logo.png"
				class="rounded mx-auto d-block" alt="로고">


			<nav class="box1">
				<!-- <p>box1</p> -->
				<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#join"
					title="회원가입">&nbsp;&nbsp;Join&nbsp;&nbsp;</button> &nbsp;
				<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#login"
					title="로그인">Log-in</button>
			</nav>

		</header>

		<hr>
		
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
		<section>
			<!-- <p>section</p> -->
			<article>
				<!-- <p>article</p> -->
				<div>
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="/hifive/resources/image/sample2.jpeg" alt="First slide">
								<div class="carousel-caption d-none d-md-block">
									<h5>첫번째 슬라이드 사진</h5>
									<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
								</div>

							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="/hifive/resources/image/sample2.jpeg" alt="Second slide">
								<div class="carousel-caption d-none d-md-block">
									<h5>두번째 슬라이드 사진</h5>
									<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
								</div>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="/hifive/resources/image/sample2.jpeg" alt="Third slide">
								<div class="carousel-caption d-none d-md-block">
									<h5>세번째 슬라이드 사진</h5>
									<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
								</div>
							</div>
						</div>

						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>



					<br>
					<!-- <hr> -->
					<br>

					<div class="card-deck">
						<div class="card">
							<img class="card-img-top"
								src="/hifive/resources/image/sample1.jpeg" alt="Card image cap">
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
								src="/hifive/resources/image/sample1.jpeg" alt="Card image cap">
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
					</div>

					<br>
					<!-- <hr> -->
					<br>

					<div class="card border-light mb-3" style="max-width: outo;">
						<div class="card-header">홈페이지에 관한 소개글..</div>
						<div class="card-body text-secondary">
							<h5 class="card-title">^^</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>

				</div>
			</article>
		</section>

		<hr>

		<%@ include file="footer.jsp"%>
	</div>

</body>
</html>



