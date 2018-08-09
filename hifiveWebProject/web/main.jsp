<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User, java.util.*" %>
<%
   String userid = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메인화면</title>

<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style type="text/css">
/* 전체 사이즈 1000에 맞게 사이즈 해놨으니 안 바꾸셔도 될거에여.. */

/* 여기 이새끼가 전체 우리 컨테이너 역할 */

   .container{
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
   height:1300px;
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
#content2 { /* 각각 등록찾기 버튼 부분 */
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}

#content3 { /* 사용자 여행 부분 */
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}
#content4 { /* 사용자에게 요청받은 목록, 사용자가 요청한 목록 */
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}



.card-body{text-align: center;
}
#card_info { text-align:center; }

#intro0{
float: left;
}

#headingOne {
  height:40px;
  padding:0;
  margin:0;
} 

#headingTwo{
  height:40px;
  padding:0;
  margin:0;
}

#headingThree {
  height:40px;
  padding:0;
  margin:0;
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
      			<div id="content0">
      				<div class="card" style="width: 250px;">
  						<div class="card-body">
    						<h5 class="card-title">사용자 기본정보</h5>
    						<h6 class="card-subtitle mb-2 text-muted">(이름및 지역)</h6>
    						<p class="card-text">......<br><br><br><br>
    						<a href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a>
    
 						</div>
					</div>
   				</div>
         </div>
         <div id="content1">
        
        	<div class="card-deck">
  				<div class="card">
    				<img class="card-img-top" src="/hifive/resources/image/sample10.jpg" alt="Card image cap">
    				<div class="card-body">
      					<h5 class="card-title">HOST</h5>
      					<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      					<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    				</div>
  				</div>
  				<div class="card">
    				<img class="card-img-top" src="/hifive/resources/image/sample11.jpg" alt="Card image cap">
    				<div class="card-body">
      					<h5 class="card-title">SURFER</h5>
      					<p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
      					<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    				</div>
  				</div>
  				<div class="card">
    				<img class="card-img-top" src="/hifive/resources/image/sample12.jpg" alt="Card image cap">
    				<div class="card-body">
      					<h5 class="card-title">PARTNER</h5>
      					<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      					<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    				</div>
  				</div>
			</div>
		 <br>
         </div>
         
         <div id="content2">  
         	<a class="btn btn-primary" href="#" data-toggle="modal" data-target="#hostenroll" role="button">호스트 등록</a>
         	<a class="btn btn-primary" href="#" role="button">호스트 찾기</a> 
          	&nbsp;&nbsp;  &nbsp;&nbsp;  
         	<a class="btn btn-primary" href="#" data-toggle="modal" data-target="#surferenroll" role="button">&nbsp;서퍼 등록&nbsp;</a>
         	<a class="btn btn-primary" href="#" role="button">&nbsp;서퍼 찾기&nbsp;</a> 
          	&nbsp;&nbsp;  &nbsp;&nbsp; 
         	<a class="btn btn-primary" href="#" data-toggle="modal" data-target="#partnerenroll" role="button">파트너 등록</a>
         	<a class="btn btn-primary" href="#" role="button">파트너 찾기</a>
        	<br><br>
         </div>
        
         <div id="content3">   
        
    		<div class="accordion" id="accordionExample">
  				<div class="card">
    				<div class="card-header" id="heading">
      					<h5 class="text-dark">
       						사용자 여행정보&nbsp;&nbsp;<a class="btn btn-secondary btn-sm" href="#" role="button">전체보기</a>
      					</h5>
    				</div>

   
  					<div class="card">
    					<div class="card-header" id="headingOne">
     					 <h5 class="mb-0">
        				 <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
          				 Host 매칭 목록
        				 </button>
      					 </h5>
    					</div>
    					<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      						<div class="card-body">
     							.....
     						 </div>
    					</div>
  					</div>
  					<div class="card">
    					<div class="card-header" id="headingTwo">
      						<h5 class="mb-0">
        					<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          					 Surfer 매칭 목록
        					</button>
      						</h5>
    					</div>
    					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      						<div class="card-body">
       						 .....
      						</div>
    					</div>
  					</div>
  					<div class="card">
    					<div class="card-header" id="headingThree">
      						<h5 class="mb-0">
        					<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          					Partner 매칭 목록
        					</button>
      						</h5>
    					</div>
    					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      						<div class="card-body">
        					.....
      						</div>
    					</div>
  					</div>
				</div>
            
         </div>
            <br>
          
         </div>
         
          <div id="content4">   
        	<div id="intro0" class="card" style="width: 365px;">
               <h6 class="card-header" id="card_info">사용자에게 호스트 요청</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
           
            <div id="intro" class="card" style="width: 365px;">
               <h6 class="card-header" id="card_info">사용자가 요청한 호스트</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
            <br>
            <div id="intro0" class="card" style="width: 365px;">
               <h6 class="card-header" id="card_info">사용자에게 서퍼 요청</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
           
            <div id="intro" class="card" style="width: 365px;">
               <h6 class="card-header" id="card_info">사용자가 요청한 서퍼</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
            <br>
            
            <div id="intro0" class="card" style="width: 365px;">
               <h6 class="card-header" id="card_info">사용자에게 파트너 요청</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
           
            <div id="intro" class="card" style="width: 365px;">
               <h6 class="card-header" id="card_info">사용자가 요청한 파트너</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
         </div>
      </div>
      <br>
      <hr>
      <%@ include file="../../footer.jsp"%>
   </div>

		<!-- 호스트 등록 Modal -->
		<div class="modal fade" id="hostenroll" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"><b>호스트 등록창</b></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">		
						<div style="text-align: center;">
						<%@ include file="./views/hsp/hostEnroll.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 서퍼 등록 Modal -->
		<div class="modal fade" id="surferenroll" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"><b>서퍼 등록창</b></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">		
						<div style="text-align: center;">
						<%@ include file="./views/hsp/surferEnroll.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 파트너 등록 Modal -->
		<div class="modal fade" id="partnerenroll" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"><b>파트너 등록창</b></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">		
						<div style="text-align: center;">
						<%@ include file="./views/hsp/partnerEnroll.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>