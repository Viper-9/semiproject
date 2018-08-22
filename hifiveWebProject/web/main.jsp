<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User, java.util.*"%>
<%
	String userid = (String) session.getAttribute("userId");
%>
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
	height: 1400px;
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

.card-body {
	text-align: center;
}

.card-body3 {
	text-align: center;
	height: 70px;
}

#card_info {
	text-align: center;
}

#intro0 {
	float: left;
}

.rounded-circle {
	width: 50px;
	height: 50px;
}

#all {
	height: 200px;
}

#hostlist {
	height: 200px;
}

#surferlist {
	height: 200px;
}

#partnerlist {
	height: 200px;
}
</style>

<script type="text/javascript">

	$(function(){
	     var userid = '<%= userid %>';
	      
	      // 나의 여행 계획
	     $.ajax({
	    	  url : "/hifive/myplan",
	    	  type : "get",
	    	  data : { userid : userid },
	    	  dataType : "json",
	    	  success : function(data){
	    		//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
		        var jsonStr = JSON.stringify(data);   
		        //문자열을 json 객체로 바꿈
		        var json = JSON.parse(jsonStr);
	        	
		        var valueAll = ""; // 모든 여행정보
		        
		        var m_host = "";   		        
		        if(Object.keys(json.surfer) == 0){
		        	m_host += "<tr><td colspan='4'>신청 내역이 없습니다.</td></tr>";
	               $("#m_host").html($("#m_host").html()+m_host);   
	            } else{	            	
	            	m_host += "<tr><td style='font-weight:bold;'>Host</td><td>";
	            	if(json.surfer.image != null) { 
	            		m_host += "<a href='/hifive/profileinfo?userid=" + json.surfer.user_id 
		          			   +"'><img src='" + json.surfer.image + "' alt='' class='rounded-circle' title='프로필로 이동'>";
		            } else{ // 프로필 사진 없으면
		            	m_host += "<a href='/hifive/profileinfo?userid=" + json.surfer.user_id 
		           			   +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'>";
		            }
	            	m_host += "</td><td>" + json.surfer.user_name + "</td><td>" 
	  			    + json.surfer.start_date + " ~ " + json.surfer.end_date + "</td></tr>"; 
	  			    valueAll += m_host;
	               $("#m_host").html($("#m_host").html()+m_host);               
	            }

		        var m_surfer = "";   		        
		        if(Object.keys(json.host) == 0){
		        	m_surfer += "<tr><td colspan='4'>신청 내역이 없습니다.</td></tr>";
	               $("#m_surfer").html($("#m_surfer").html()+m_surfer);   
	            } else{
	            	m_surfer += "<tr><td style='font-weight:bold;'>Surfer</td><td>";
	            	if(json.host.image != null) { 
	            		m_surfer += "<a href='/hifive/profileinfo?userid=" + json.host.user_id 
	          			   +"'><img src='" + json.host.image + "' alt='' class='rounded-circle' title='프로필로 이동'>";
		            } else{ // 프로필 사진 없으면
		            	m_surfer += "<a href='/hifive/profileinfo?userid=" + json.host.user_id 
	           			   +"'><img src='/hifive/resources/image/sample12.jpg' alt='' class='rounded-circle' title='프로필로 이동'>";
		            }
	            	m_surfer += "</td><td>" + json.host.user_name + "</td><td>" 
	  			    + json.host.start_date + " ~ " + json.host.end_date + "</td></tr>";	
	  			  valueAll += m_surfer;
	               $("#m_surfer").html($("#m_surfer").html()+m_surfer);               
	            }
	        
		        var m_partner = "";   		        
		        if(Object.keys(json.partner) == 0){
		        	m_partner += "<tr><td colspan='4'>신청 내역이 없습니다.</td></tr>";
	               $("#m_partner").html($("#m_partner").html()+m_partner);   
	            } else{
	            	m_partner += "<tr><td style='font-weight:bold;'>Partner</td><td>";
	            	if(json.partner.image != null) { 
	            		m_partner += "<a href='/hifive/profileinfo?userid=" + json.partner.user_id 
	          			   +"'><img src='" + json.partner.image + "' alt='' class='rounded-circle' title='프로필로 이동'>";
		            } else{ // 프로필 사진 없으면
		            	m_partner += "<a href='/hifive/profileinfo?userid=" + json.partner.user_id 
	           			   +"'><img src='/hifive/resources/image/sample11.jpg' alt='' class='rounded-circle' title='프로필로 이동'>";
		            }
	            	m_partner += "</td><td>" + json.partner.user_name + "</td><td>" 
	  			    + json.partner.start_date + " ~ " + json.partner.end_date + "</td></tr>";
	  			  valueAll += m_partner;
	               $("#m_partner").html($("#m_partner").html()+m_partner);               
	            }
		        
		        if(valueAll==""){
		        	valueAll += "<tr><td colspan='4'>신청 내역이 없습니다.</td></tr>";
		        	$("#m_all").html($("#m_all").html()+valueAll);
		        } else{
		        	$("#m_all").html($("#m_all").html()+valueAll); // 모든 여행 정보
		        }
	    	  }, // success 
	    	  error : function(jqXHR, textstatus, errorThrown){
		            console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
		      } // error  
	      });
	      
	      // 신청받은 리스트 목록
	      $.ajax({   
	         url : "/hifive/requestlist",
	         type : "get",
	         data : { uid : userid },
	         dataType : "json",         
	         success : function(data){
	            //배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
	            var jsonStr = JSON.stringify(data);   
	            //문자열을 json 객체로 바꿈
	            var json = JSON.parse(jsonStr);
	            
	            var values1 = "";
	            if(json.list_h2.length == 0){
	            	values1 += "신청 내역이 없습니다.";
	               $("#h1").html($("#h1").html()+values1);   
	            } else{
	            	for(var i in json.list_h2){
	            		if(json.list_h2[i].image != null) { 
	            			values1 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_h2[i].user_id 
		            			   +"'><img src='" + json.list_h2[i].image +"' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
		            	} else{ // 프로필 사진 없으면
		            		values1 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_h2[i].user_id 
		            			   +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
		            	}
	            		values1 += "</td><td>" + json.list_h2[i].user_name
		            	+ "</td><td>" + json.list_h2[i].start_date + " ~ " + json.list_h2[i].end_date
		            	+"</td><td><a href='/hifive/requestaccept?request_no=" + json.list_h2[i].request_no + "'>수락</a> &nbsp;"
		            	+"</td><td><a href='/hifive/requestrefuse?request_no=" + json.list_h2[i].request_no +"'>거절</a>"
		            	+ "</td></tr><br>";
		           	}                               
	               	$("#h1").html($("#h1").html()+values1);               
	            }
	            
	            var values2 = "";                        
	            if(json.list_h1.length == 0){
	            	values2 += "신청 내역이 없습니다.";
	               $("#h2").html($("#h2").html()+values2);   
	            } else{               
	               for(var i in json.list_h1){
	            	   if(json.list_h1[i].image != null) { // 프로필 사진 있으면 (나중에 수정)
	            		   values2 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_h1[i].r_user_id 
            			   +"'><img src='" + json.list_h1[i].image +"' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;           			   
	            	   } else{ // 프로필 사진 없으면
	            		   values2 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_h1[i].r_user_id 
            			   +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
	            	   }
	            	   values2 += "</td><td>" + json.list_h1[i].user_name
	            	   + "</td><td>" + json.list_h1[i].start_date + " ~ " + json.list_h1[i].end_date
	            	   +"</td><td><a href='/hifive/requestdelete?request_no=" + json.list_h1[i].request_no + "'>취소</a>"
	            	   +"</td></tr><br>";
	               }                  
	               $("#h2").html($("#h2").html()+values2);               
	            }
	            
	            var values3 = "";
	            if(json.list_s2.length == 0){
	            	values3 += "신청 내역이 없습니다.";

	               $("#s1").html($("#s1").html()+values3);   
	            } else{               
	            	for(var i in json.list_s2){
		          	   if(json.list_s2[i].image != null) { 
		          		 values3 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_s2[i].user_id 
	        			   +"'><img src='" + json.list_s2[i].image +"' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
		          	   } else{ // 프로필 사진 없으면
		          		 values3 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_s2[i].user_id 
            			   +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
		          	   }
		          	 values3 += "</td><td>" + json.list_s2[i].user_name
		          	   + "</td><td>" + json.list_s2[i].start_date + " ~ " + json.list_s2[i].end_date
		          	   +"</td><td><a href='/hifive/requestaccept?request_no=" + json.list_s2[i].request_no + "'>수락</a> &nbsp;"
		          	   +"</td><td><a href='/hifive/requestrefuse?request_no=" + json.list_s2[i].request_no +"'>거절</a>"
		          	   + "</td></tr><br>";
		            }                              
	               $("#s1").html($("#s1").html()+values3);               
	            }
	            
	            var values4 = "";    
	            if(json.list_s1.length == 0){
	            	values4 = "신청 내역이 없습니다.";
	               $("#s2").html($("#s2").html()+values4);
	            } else{               
	            	for(var i in json.list_s1){
		              if(json.list_s1[i].image != null) { 
		            	  values4 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_s1[i].r_user_id 
        			   +"'><img src='" + json.list_s1[i].image +"' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
		              } else{ // 프로필 사진 없으면
		            	  values4 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_s1[i].r_user_id 
        			   +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
		              }
		              values4 += "</td><td>" + json.list_s1[i].user_name
		              + "</td><td>" + json.list_s1[i].start_date + " ~ " + json.list_s1[i].end_date
		              +"</td><td><a href='/hifive/requestdelete?request_no=" + json.list_s1[i].request_no + "'>취소</a>"
		              +"</td></tr><br>";
		            }                                 
	               $("#s2").html($("#s2").html()+values4);               
	            }
	            
	            var values5 = "";
	            if(json.list_p2.length == 0){
	            	values5 += "신청 내역이 없습니다.";
	               $("#p1").html($("#p1").html()+values5);   
	            } else{               
	            	for(var i in json.list_p2){
		           	   if(json.list_p2[i].image != null) { 
		           		values5 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_p2[i].user_id 
	        			   +"'><img src='" + json.list_p2[i].image +"' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
		           	   } else{ // 프로필 사진 없으면
		           		values5 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_p2[i].user_id 
            			   +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
		           	   }
		           		values5 += "</td><td>" + json.list_p2[i].user_name
		           	   + "</td><td>" + json.list_p2[i].start_date + " ~ " + json.list_p2[i].end_date
		           	   +"</td><td><a href='/hifive/requestaccept?request_no=" + json.list_p2[i].request_no + "'>수락</a> &nbsp;"
		           	   +"</td><td><a href='/hifive/requestrefuse?request_no=" + json.list_p2[i].request_no +"'>거절</a>"
		           	   + "</td></tr><br>";
		            }                                                         
	               $("#p1").html($("#p1").html()+values5);               
	            }
	            
	            var values6 = "";                        
	            if(json.list_p1.length == 0){
	            	values6 += "신청 내역이 없습니다.";
	               $("#p2").html($("#p2").html()+values6);   
	            } else{               
	               for(var i in json.list_p1){
	            	   if(json.list_p1[i].image != null) { // 프로필 사진 있으면 (나중에 수정)
	            		   values6 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_p1[i].r_user_id 
	        			   +"'><img src='" + json.list_p1[i].image +"' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
	            	   } else{ // 프로필 사진 없으면
	            		   values6 += "<tr><td><a href='/hifive/profileinfo?userid=" + json.list_p1[i].r_user_id 
            			   +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a>" ;
	            	   }
	            	   values6 += "</td><td>" + json.list_p1[i].user_name
	            	   + "</td><td>" + json.list_p1[i].start_date + " ~ " + json.list_p1[i].end_date
	            	   +"</td><td><a href='/hifive/requestdelete?request_no=" + json.list_p1[i].request_no + "'>취소</a>"
	            	   +"</td></tr><br>";
	               }                  
	               $("#p2").html($("#p2").html()+values6);               
	            }

	         }, // success
	         error : function(jqXHR, textstatus, errorThrown){
	            console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
	         } // error
		});
	      
	      // 호스트, 서퍼, 파트너 등록창 (이미 등록되어 있으면 비활성화)
	      $.ajax({
	    	  url : "/hifive/mainhsp",
	    	  type : "get",
	    	  data : { userid : userid },
	    	  dataType : "json",
	    	  success : function(data){	    		  
	    		  if(data.host==1)
	    			  $('#hostenroll').removeAttr('data-target');
	    		  if(data.surfer==1)
	    			  $('#hostenroll').removeAttr('data-target');
	    		  if(data.partner==1)
	    			  $('#hostenroll').removeAttr('data-target');
	    	  }, // success 
	    	  error : function(jqXHR, textstatus, errorThrown){
		            console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
		      } // error  
	      });
	});

</script>

</head>
<body>

	<div class="container">
		<%@ include file="../../header.jsp"%>
		<hr>
		<div id="main">
			<div id="menu">

				<%@ include file="./information.jsp"%>

			</div>
			<div id="content1">

				<div class="card-deck">
					<div class="card">
						<img class="card-img-top"
							src="/hifive/resources/image/sample10.jpg" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">HOST</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
					<div class="card">
						<img class="card-img-top"
							src="/hifive/resources/image/sample11.jpg" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">SURFER</h5>
							<p class="card-text">This card has supporting text below as a
								natural lead-in to additional content.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
					<div class="card">
						<img class="card-img-top"
							src="/hifive/resources/image/sample12.jpg" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">PARTNER</h5>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This card
								has even longer content than the first to show that equal height
								action.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>
				<br>
			</div>
			<div id="content2">

				<a class="btn btn-primary" href="#" data-toggle="modal" data-target="#hostenroll" role="button">호스트 등록</a>
				<a class="btn btn-primary" href="/hifive/views/hsp/searchPage.jsp" role="button">호스트 찾기</a>			
				&nbsp;&nbsp; &nbsp;&nbsp;
				<a class="btn btn-primary" href="#" data-toggle="modal" data-target="#surferenroll" role="button">&nbsp;서퍼등록&nbsp;</a>
				<a class="btn btn-primary" href="#" role="button">&nbsp;서퍼 찾기&nbsp;</a>
				&nbsp;&nbsp; &nbsp;&nbsp;
				<a class="btn btn-primary" href="#" data-toggle="modal" data-target="#partnerenroll" role="button">파트너 등록</a>
				<a class="btn btn-primary" href="#" role="button">파트너 찾기</a><br><br>

			</div>
			<div id="content3">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="all-tab"
						data-toggle="tab" href="#all" role="tab" aria-controls="all"
						aria-selected="true">모든 여행 정보</a></li>
					<li class="nav-item"><a class="nav-link" id="hostlist-tab"
						data-toggle="tab" href="#hostlist" role="tab"
						aria-controls="hostlist" aria-selected="false">Host 매칭 정보</a></li>
					<li class="nav-item"><a class="nav-link" id="surferlist-tab"
						data-toggle="tab" href="#surferlist" role="tab"
						aria-controls="surferlist" aria-selected="false">Surfer 매칭 정보</a>
					</li>
					<li class="nav-item"><a class="nav-link" id="partnerlist-tab"
						data-toggle="tab" href="#partnerlist" role="tab"
						aria-controls="partnerlist" aria-selected="false">Partner 매칭
							정보</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="all" role="tabpanel"
						aria-labelledby="all-tab">
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col" width="20%">분류</th>
									<th scope="col" width="20%">사진</th>
									<th scope="col" width="20%">이름</th>
									<th scope="col" width="40%">날짜</th>
								</tr>
							</thead>
							<tbody id="m_all"></tbody>
						</table>

					</div>

					<div class="tab-pane fade" id="hostlist" role="tabpanel"
						aria-labelledby="hostlist-tab">
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col" width="20%">분류</th>
									<th scope="col" width="20%">사진</th>
									<th scope="col" width="20%">이름</th>
									<th scope="col" width="40%">날짜</th>
								</tr>
							</thead>
							<tbody id="m_host"></tbody>
						</table>
					</div>

					<div class="tab-pane fade" id="surferlist" role="tabpanel"
						aria-labelledby="surferlist-tab">
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col" width="20%">분류</th>
									<th scope="col" width="20%">사진</th>
									<th scope="col" width="20%">이름</th>
									<th scope="col" width="40%">날짜</th>

								</tr>
							</thead>
							<tbody id="m_surfer"></tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="partnerlist" role="tabpanel"
						aria-labelledby="partnerlist-tab">

						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col" width="20%">분류</th>
									<th scope="col" width="20%">사진</th>
									<th scope="col" width="20%">이름</th>
									<th scope="col" width="40%">날짜</th>

								</tr>
							</thead>
							<tbody id="m_partner"></tbody>
						</table>
					</div>
				</div>

				<br>

			</div>

			<div id="content4">
				<div id="intro0" class="card" style="width: 365px;">
					<h6 class="card-header" id="card_info">나에게 호스트를 요청한 목록</h6>
					<div class="card-body3" style="height:150px; overflow:scroll;">
						<table class="table-sm">
							<tbody id='h1'> </tbody>
						</table>
					</div>
				</div>

				<div id="intro" class="card" style="width: 365px;">
					<h6 class="card-header" id="card_info">내가 서퍼에게 요청한 목록</h6>
					<div class="card-body3" style="height:150px; overflow:scroll;">
						<table class="table-sm">
							<tbody id='h2'> </tbody>
						</table>
					</div>
				</div>
				<br>
				<div id="intro0" class="card" style="width: 365px;">
					<h6 class="card-header" id="card_info">나에게 서퍼를 요청한 목록</h6>
					<div class="card-body3" style="height:150px; overflow:scroll;">
						<table class="table-sm">
							<tbody id='s1'> </tbody>
						</table>
					</div>
				</div>

				<div id="intro" class="card" style="width: 365px;">
					<h6 class="card-header" id="card_info">내가 호스트에게 요청한 목록</h6>
					<div class="card-body3" style="height:150px; overflow:scroll;">
						<table class="table-sm">
							<tbody id='s2'>	</tbody>
						</table>
					</div>
				</div>
				<br>

				<div id="intro0" class="card" style="width: 365px;">
					<h6 class="card-header" id="card_info">나에게 파트너 요청한 목록</h6>
					<div class="card-body3" style="height:150px; overflow:scroll;">
						<table class="table-sm">
							<tbody id='p1'> </tbody>
						</table>
					</div>
				</div>

				<div id="intro" class="card" style="width: 365px;">
					<h6 class="card-header" id="card_info">내가 파트너 요청한 목록</h6>
					<div class="card-body3" style="height:150px; overflow:scroll;">
						<table class="table-sm">
							<tbody id='p2'> </tbody>
						</table>
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
					<h5 class="modal-title">
						<b>호스트 등록창</b>
					</h5>
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
					<h5 class="modal-title">
						<b>서퍼 등록창</b>
					</h5>
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
					<h5 class="modal-title">
						<b>파트너 등록창</b>
					</h5>
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