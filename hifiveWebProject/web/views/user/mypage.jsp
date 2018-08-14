<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "user.model.vo.User, hsp.model.vo.*, java.util.*" %>    
<%   	
	   String[] hchecked = new String[12];   		
/* if(user.getHobby() == null){
		   
	   } else {
		   String[] hobbies = user.getHobby().split(",");
		   for(String s : hobbies){
		      switch(s){
		      case "game": hchecked[0]="active"; break;
		      case "reading": hchecked[1]="active"; break;
		      case "music": hchecked[2]="active"; break;
		      case "camping": hchecked[3]="active"; break;
		      case "climb": hchecked[4]="active"; break;
		      case "sport": hchecked[5]="active"; break;
		      case "art": hchecked[6]="active"; break;
		      case "shopping": hchecked[7]="active"; break;
		      case "bike": hchecked[8]="active"; break;
		      case "walk": hchecked[9]="active"; break;
		      case "sleep": hchecked[10]="active"; break;
		      case "dance": hchecked[11]="active"; break;      
		      }
		   }  
	   } */
  
	   
  	   String[] ochecked = new String[4]; 	   
	   /*	   if(host.getCheck1() == null){
		   
	   } else {
		   String[] checks = host.getCheck1().split(",");
		   for(String s : checks){
		      switch(s){
		      case "smoking": ochecked[0]="active"; break;
		      case "kid": ochecked[1]="active"; break;
		      case "pet": ochecked[2]="active"; break;
			  case "drinking": ochecked[3]="active"; break;
		      }
		   }
	   } */
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8"> 
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>mypage</title>
   <link rel="stylesheet" href="/hifive/resources/css/modal.css">
   <link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
   <script src="/hifive/resources/js/jquery-3.3.1.min.js" ></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   <style type="text/css">      
      #tbox{width:1000px;font-family:고딕; margin : 0 auto;}      
      #main{width:1000px;overflow:hidden;}      
      #menu{width:250px;margin:10px 0 5px 5px;float:left;}      
      #content1{width:750;margin:10px 0 -3px 5px;float:left;padding:5px 0 0 5px;}   
   </style>   
  	<script type="text/javascript">
       $(function(){        
          
          $.ajax({
             url : "/hifive/info",
             type : "post",
             data : {id : $("#userid").val()},            
             dataType : "json",
             success : function(data){	             	 
             	//이름
                $("#name").val(data.name);            	
              	//주소
                $("#sample5_address").val(data.address); 
              	//국적
              	if(data.nationality == null){
              		$("nationality").val('');
              	}else{
              		$("#nationality").prop("selected", true);
              	}
              	//성별
                if(data.gender == "F"){
                	$("#gender").val('여성');
                } else {
                	$("#gender").val('남성');
                }                	
             	//이메일
                $("#email").val(data.email);             	
                //직업
             	if(data.job == null){
             		$("#job").val('');
             	} else {
             		$("#job").val(data.job);
             	}                
             	//생일
                $("#birth").val(data.birth);             	
                //전화번호
                $("#phone").val(data.phone);                
                //자기소개
                if(data.content == null){
                	$("#introduction").val();
                } else {
                	$("#introduction").val(data.content);
                } 
                //취미
                //String[] hchecked = new String[12];   		
         	    if(data.hobby == null){
         		   
         	    }else{/* class="btn btn-outline-secondary btn-sm" */
         		   var hobbies = (data.hobby).split(",");  
         		   for(var s in hobbies){
         		      switch(s){
         		      case "game": $("#game").prop("active", true); break;
         		      case "reading": $("#reading").prop("active", true); break;
         		      case "music": $("#music").prop("active", true); break;
         		      case "camping": $("#camping").prop("active", true); break;
         		      case "climb": $("#climb").prop("active", true); break;
         		      case "sport": $("#sport").prop("active", true); break;
         		      case "art": $("#art").prop("active", true); break;
         		      case "shopping": $(".btn btn-outline-secondary btn-sm").attr("class", "btn btn-outline-secondary btn-sm active"); break;
         		      case "bike": $("#bike").prop("active", true); break;
         		      case "walk": $("#walk").prop("active", true); break;
         		      case "sleep": $("#sleep").prop("active", true); break;
         		      case "dance": $("#dance").prop("active", true); break;      
         		      }
         		   }  
         	    } 
             },
             error : function(jqXHR, textstatus, errorThrown){
                console.log("error : "+jqXHR+", "+textstatus+", "+errorThrown);
             }
          }); // userajax
          
          $.ajax({
        	  url : "/hifive/hosting",
        	  type : "post",
        	  data : {id : $("#userid").val()},
        	  dataType : "json",
        	  success : function(data){        		  
        		  //인원
        		  if(data.num == null){
        			  $("#h-num").val('');
        		  } else {        			  
        		      $("#h-num").val(data.num);
        		      $("#rolecheck-host").attr("checked", true);
        		  }
        		  //성별        		  
        		  if(data.gender == null){
        			  $("#genderselect").prop("selected", true);
        		  }else if(data.gender == "F"){
        			  $("#female").prop("selected", true);
        		  }else if(data.gender == "M"){
        			  $("#male").prop("selected", true);
        		  }else {
        			  $("#both").prop("selected", true);
        		  }
        		  //옵션 
        		  if(data.check1 == null){
        			  
        		  }else{
        			  var checks = data.check1.split(",");
        			  for(var s in checks){
        				  switch(s){        			  
		       			  case "smoking": $("smoking").attr("class", "btn btn-outline-secondary btn-sm active"); break;
		   			      case "kid": $("kid").attr("class", "btn btn-outline-secondary btn-sm active"); break;
		   			      case "pet": $("pet").attr("class", "btn btn-outline-secondary btn-sm active"); break;
		   				  case "drinking": $("drinking").attr("class", "btn btn-outline-secondary btn-sm active"); break;
        			 	 }
        			  }
        		  }
        		  //수면장소
        		  if(data.check2 == null){
        			  $("#roomselect").prop("selected", true);
        		  }else if(data.check2 == 'living'){
        			  $("#living").prop("selected", true);
        		  }else if(data.check2 == 'single'){
        			  $("#single").prop("selected", true);
        		  }else if(data.check2 == 'sharing'){
        			  $("#sharing").prop("selected", true);
        		  }else{
        			  $("#sofa").prop("selected", true);
        		  }
        		  //추가 정보
        		  if(data.content == null){
        			  $("#hostcontent").val('');
        		  }else{
        			  $("#hostcontent").val(data.content);
        		  }
        	  },
        	  error : function(jqXHR, textstatus, errorThrown){
        		  console.log("error : "+jqXHR+", "+textstatus+", "+errorThrown);
        	  }        	  
          }) //hostajax
          
          $.ajax({
        	  url : "/hifive/surfing",
        	  type : "post",
        	  data : {id : $("#userid").val()},
        	  dataType : "json",
        	  success : function(data){
        		  //목적지
        		  if(data.destination == null){
        			  $("#s-destination").val('');
        		  }else{
        			  $("#s-destination").val(data.destination);
        			  $("#rolecheck-surfer").attr("checked", true);
        		  }
        		  //여행시작날짜
        		  if(data.startdate == null){
        			  $("#s-startdate").val('');
        		  }else{
        			  $("#s-startdate").val(data.startdate);
        		  }
        		  //여행끝날짜
        		  if(data.enddate == null){
        			  $("#s-enddate").val('');
        		  }else{
        			  $("#s-enddate").val(data.enddate);
        		  }
        		  //인원
        		  if(data.num == null){
        			  $("#s-num").val('');
        		  }else{
        			  $("#s-num").val(data.num);
        		  }
        	  },
        	  error : function(jqXHR, textstatus, errorThrown){
        		  console.log("error : "+jqXHR+", "+textstatus+", "+errorThrown);
        	  }    
          })//surfing ajax
          
          $.ajax({
        	  url : "/hifive/partnering",
        	  type : "post",
        	  data : {id : $("#userid").val()},
        	  dataType : "json",
        	  success : function(data){
        		  //목적지
        		  if(data.destination == null){
        			  $("#p-destination").val('');
        		  }else{
        			  $("#p-destination").val(data.destination);
        			  $("#rolecheck-partner").attr("checked", true);
        		  }
        		  //여행시작날짜
        		  if(data.startdate == null){
        			  $("#p-startdate").val('');
        		  }else{
        			  $("#p-startdate").val(data.startdate);
        		  }
        		  //여행끝날짜
        		  if(data.enddate == null){
        			  $("#p-enddate").val('');
        		  }else{
        			  $("#p-enddate").val(data.enddate);
        		  }
        		  //인원
        		  if(data.num == null){
        			  $("#p-num").val('');
        		  }else{
        			  $("#p-num").val(data.num);
        		  }
        	  },
        	  error : function(jqXHR, textstatus, errorThrown){
        		  console.log("error : "+jqXHR+", "+textstatus+", "+errorThrown);
        	  }    
          })//partner ajax
          
       }); //document.ready
       
      
		function deleteUser(){
			var result = confirm("정말 탈퇴하시겠습니까?");
			
			if(result){
				$.ajax({
	  				url : "/hifive/userdelete",
	  				type : "post",
	  				data : {id : $("#userid").val()},
	  				success : function(data){
	  					alert("탈퇴되었습니다.")
	  				},
	  				error : function(jqXHR, textstatus, errorThrown){
	          		  console.log("error : "+jqXHR+", "+textstatus+", "+errorThrown);
	          	  }  
	  			})
			}else{
				
			}  			
		} //deleteUser
  	
  		function userUpdate(){
			$.ajax({
				url : "/hifive/infoupdate",
				type : "post",
				data : {id : $("#userid").val()},
				success : function(data){
	             	//이름
	                $("#name").val(data.name);            	
	              	//주소
	                $("#sample5_address").val(data.address); 
	              	//국적
	              	if(data.nationality == null){
	              		$("nationality").val('');
	              	}else{
	              		$("#nationality").prop("selected", true);
	              	}
	              	//성별
	                if(data.gender == "F"){
	                	$("#gender").val('여성');
	                } else {
	                	$("#gender").val('남성');
	                }                	
	             	//이메일
	                $("#email").val(data.email);             	
	                //직업
	             	if(data.job == null){
	             		$("#job").val('');
	             	} else {
	             		$("#job").val(data.job);
	             	}                
	             	//생일
	                $("#birth").val(data.birth);             	
	                //전화번호
	                $("#phone").val(data.phone);                
	                //자기소개
	                if(data.content == null){
	                	$("#introduction").val();
	                } else {
	                	$("#introduction").val(data.content);
	                } 
	                //취미
	                //String[] hchecked = new String[12];   		
	         	    if(data.hobby == null){
	         		   
	         	    }else{/* class="btn btn-outline-secondary btn-sm" */
	         		   var hobbies = (data.hobby).split(",");  
	         		   for(var s in hobbies){
	         		      switch(s){
	         		      case "game": $("#game").prop("active", true); break;
	         		      case "reading": $("#reading").prop("active", true); break;
	         		      case "music": $("#music").prop("active", true); break;
	         		      case "camping": $("#camping").prop("active", true); break;
	         		      case "climb": $("#climb").prop("active", true); break;
	         		      case "sport": $("#sport").prop("active", true); break;
	         		      case "art": $("#art").prop("active", true); break;
	         		      case "shopping": $(".btn btn-outline-secondary btn-sm").attr("class", "btn btn-outline-secondary btn-sm active"); break;
	         		      case "bike": $("#bike").prop("active", true); break;
	         		      case "walk": $("#walk").prop("active", true); break;
	         		      case "sleep": $("#sleep").prop("active", true); break;
	         		      case "dance": $("#dance").prop("active", true); break;      
	         		      }
	         		   }  
	         	    } 
	             },
				error : function(jqXHR, textstatus, errorThrown){
	        		  console.log("error : "+jqXHR+", "+textstatus+", "+errorThrown);
	        	  }  
			})
		}       
    </script>     
</head>
<body>
   <div id="tbox">
      <%@ include file="../../header.jsp"%>
      <form action="/hifive/infoupdate" method="post">
      <input type="hidden" id="userid" name="userid" value="">
      <div id="main">
         <div id="menu">
            <div class="card" style="width: 250px;">            
               <font size="3" align="left"><b>Mypage</b></font>               
               <img class="card-img-top" src="/hifive/resources/image/profile.png" alt="Card image cap" height="220px">
               <div class="card-body">
                  <p class="card-text">                  
                  <div id="mpageInfo" name="mpageInfo" align="center">
                    <div class="col-sm-10"> 
                    	<input type="text" readonly id="name" class="form-control" name="username" style="width:100px;">                    	
                    </div>
                     <br>
                     <br>            
                     <div class="custom-file">
                 <input type="file" class="custom-file-input" name="profileimg">
                 <label class="custom-file-label">파일 선택 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                 </div>      
                     <br>
                     <br>
          			<textarea class="form-control" name="address" id="sample5_address" rows="3" cols="25" placeholder="주소"></textarea>
					<input type="button" class="btn btn-outline-light text-dark" onclick="sample5_execDaumPostcode()" value="주소 입력"><br>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
					<script>				
					    function sample5_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var fullAddr = data.address; // 최종 주소 변수
					                var extraAddr = ''; // 조합형 주소 변수
					
					                // 기본 주소가 도로명 타입일때 조합한다.
					                if(data.addressType === 'R'){
					                    //법정동명이 있을 경우 추가한다.
					                    if(data.bname !== ''){
					                        extraAddr += data.bname;
					                    }
					                    // 건물명이 있을 경우 추가한다.
					                    if(data.buildingName !== ''){
					                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                    }
					                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					                }
					
					                // 주소 정보를 해당 필드에 넣는다.
					                document.getElementById("sample5_address").value = fullAddr;
					            }
					        }).open();
					    }
					</script>
                     <br>
                     <br>
                     <select class="custom-select form-control-sm" name="countries" style="width:200px;">
                        <option id="nationality">국적 선택</option>              
                        <%
                            java.util.Locale locale = null;                
                             String[] countries = java.util.Locale.getISOCountries();                
                             for(String country : countries) {            
                                 locale = new java.util.Locale("ko", country);                                   
                        %>
                        <option><%= locale.getDisplayCountry() %></option>
                        <% } %>
                        </select>                     
                  </div>
                  <br>
                  <div id="request" name="request" align="center">
                     <table align="center" border="0">
                        <tr>
                           <th><input type="button" class="btn btn-primary" style="width:200px;" value="선호하는 USER" ></th>
                        </tr>
                        <tr>
                           <th><input type="button" class="btn btn-primary" style="width:200px;" value="비밀번호 변경"></th>
                        </tr>
                     </table>
                     <br>
                     <table>
                        <tr>
                           <th>  
                           		<form action="/hifive/userdelete" method="post">                           
                              		<input type="button" class="btn btn-danger" style="width:200px;" value="회원 탈퇴" onclick="deleteUser();">    
								</form>                         
                          </th>
                        </tr>
                     </table>
                  </div>                  
               </div>
            </div>
         </div>
         <div id="content1">
            <div class="card" id="basisinfo" style="width: auto;">
               <div class="card-body">               
                  <table align="right" width="240" cellspacing="0" cellpadding="0">
                     <tr valign="middle">
                        <th width="80">Host</th>
                        <th>Surfer</th>
                        <th>Partner</th>
                     </tr>
                     <tr>
                        <td align="center"><input type="checkbox" id="rolecheck-host" class="rolecheck" name="role" value="host"></td>                       
                        <td align="center"><input type="checkbox" id="rolecheck-surfer" class="rolecheck" name="role" value="surfer"></td>
                        <td align="center"><input type="checkbox" id="rolecheck-partner" class="rolecheck" name="role" value="partner"></td>
                     </tr>
                  </table>
                  <br>
                  <ul>
                  <table>
                     <li>
                        <div class="form-group row">
                       <label class="col-sm-2 col-form-label">Gender</label>
                           <div class="col-sm-10">
                           <input type="text" readonly id="gender" class="form-control" style="width:60px;" name="gender">                           		
                           </div>
                        </div>   
                     </li>
                     <li>
                        <div class="form-group row">
                       <label class="col-sm-2 col-form-label">Birth</label>
                           <div class="col-sm-10">
                           <input type="text" readonly id="birth" class="form-control" style="width:120px;" name="birth" size="300">
                           </div>
                        </div>   
                     </li>                             
                     <li>
                        <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Job</label>
                           <div class="col-sm-10">                          
                           		<input type="text" id="job" class="form-control" style="width:200px;" name="job">                           
                           </div>
                        </div>
                    </li>     
                     <li>
                        <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Email</label>
                      <div class="col-sm-10">
                      <input type="email" readonly id="email" name="email" class="form-control" style="width:300px;" name="email">
                      </div>
                    </div>               
                      </li>                      
                     <li>
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Phone</label>
                           <div class="col-sm-10">
                              <input type="tel" id="phone" class="form-control" style="width:200px;" name="phone">
                              </div>
                        </div>
                     </li>                        
                     <li>
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Hobby</label>
                        </div>                                  
                       <table style="text-align:center" cellspacing="0" cellpadding="2">
                           <tr>
	                           <td>
	                              <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm" id="game">
	                                 <input type="checkbox" name="hobby" value="game"> 게임
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm" id="reading">  
	                                 <input type="checkbox" name="hobby" value="reading"> 독서
	                                 </label>
	                           </div>	                           
	                           </td>
	                           <td>
	                              <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm" id="music">
	                                 <input type="checkbox" name="hobby" value="music"> 음악감상
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm" id="camping">
	                                 <input type="checkbox" name="hobby" value="camping">  캠핑
	                                 </label>
	                              </div>	                           
	                           </td>
                           </tr>
                           <tr>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm" id="climb"> 
                                 <input type="checkbox" name="hobby" value="climb"> 등산
                                 </label>
                              </div>                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm" id="sport">
                                 <input type="checkbox" name="hobby" value="sport"> 운동
                                 </label>
                              </div>                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm" id="art"> 
                                 <input type="checkbox" name="hobby" value="art"> 그림그리기
                                 </label>
                              </div>                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm" id="shopping">
                                 <input type="checkbox" name="hobby" value="shopping"> 쇼핑
                                 </label>
                              </div>                           
                           </td>
                           </tr>
                           <tr>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm" id="bike">
                                 <input type="checkbox" name="hobby" value="bike"> 자전거
                                 </label>
                              </div>                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm" id="walk">
                                 <input type="checkbox" name="hobby" value="walk"> 산책
                                 </label>
                              </div>                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm" id="sleep"> 
                                 <input type="checkbox" name="hobby" value="sleep"> 잠자기
                                 </label>
                              </div>                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm" id="dance"> 
                                 <input type="checkbox" name="hobby" value="dance"> 춤
                                 </label>
                              </div>                           
                           </td>
                           </tr>
                        </table>                                          
                     </li>
                  </table>
                  </ul>
               </div>
            </div>
            <br>
            <div id="mpagemenu">
               <a href="#intro"><input type="button" class="btn btn-outline-info" value="Introduction" style="width: 110px;"></a>&nbsp; 
               <a href="#myhome"><input type="button" class="btn btn-outline-info" value="My Home" style="width: 110px;"></a>&nbsp; 
               <a href="#surfer"><input type="button" class="btn btn-outline-info" value="Surfer" style="width: 110px;"></a>&nbsp; 
               <a href="#partner"><input type="button" class="btn btn-outline-info" value="Partner" style="width: 110px;"></a>&nbsp; 
               <a href="#photo"><input type="button" class="btn btn-outline-info" value="Photos" style="width: 110px;"></a>&nbsp; 
               <a href="#reference"><input type="button" class="btn btn-outline-info" value="References" style="width: 110px;"></a>
            </div>
            <br>
            <div id="intro" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Introduction</h6>
               <div class="card-body">               
               		<textarea class="form-control" id="introduction" name="introduction" rows="5" cols="90" placeholder="자기소개를 작성해주세요"></textarea>               	
                  <br>
                  <center>
                  <button class="btn btn-primary-sm" style="width:100px;" onclick="userUpdate();">수정</button>&nbsp;&nbsp;&nbsp;
               	 <input type="reset" class="btn btn-primary-sm" style="width:100px;" value="취소">   
               	</center>
               </div>
            </div>
           </form>
            <br>
            <form action="/hifive/hosting" method="post">
            <div id="myhome" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">My Home</h6>
               <div class="card-body">
                  <p class="card-text">
                  <ul>
                  <table>
                     <tr>
                        <td><li>최대 가능 인원 : </li></td>
                        <td><input type="number" class="form-control" id="h-num" name="h-num" min="1" step="1" style="width:60px;"></td>
                     </tr>
                     <tr>
                        <td><li>선호하는 성별 : </li></td>
                         <td>
                           <select class="custom-select" id="pgender" name="preferredgender" style="width:150px;">
	                           <option id="genderselect" value="">선택</option>  
	                           <option value="female" id="female">여성</option>
	                           <option value="male" id="male">남성</option>
	                           <option value="both" id="both">상관없음</option>
                           </select>
                        </td> 
                     </tr>
                     <tr>
                       <td><li>기타가능여부 : </li></td>
                        <td>
                        <table>
                        	<tr>
	                           <td>
	                              <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm" id="smoking">
	                                 <input type="checkbox" name="hostcheck" value="smoking"> 흡연
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm" id="kid"> 
	                                 <input type="checkbox" name="hostcheck" value="kid"> 아이동반
	                                 </label>
	                           </div>	                           
	                           </td>
	                           <td>
	                              <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm" id="pet">
	                                 <input type="checkbox" name="hostcheck" value="pet"> 애완동물
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm" id="drinking">
	                                 <input type="checkbox" name="hostcheck" value="drinking"> 음주
	                                 </label>
	                              </div>	                           
	                           </td>
                           </tr>
                           </table>                  
                        </td>
                     </tr>            
                     <tr>
                        <td><li>수면 장소 : </li></td>
                        <td>
                           <select class="custom-select" name="sleeping" style="width:150px;">
                                <option value="" id="roomselect">선택</option>
                            	<option value="living" id="living">거실</option>
	                            <option value="single" id="single">단독 방</option>
	                            <option value="sharing" id="sharing">공용 방</option>
	                            <option value="sofa" id="sofa">소파</option>
                           </select>                                 
                        </td>
                     </tr>               
                     <tr>
                        <td><li>추가 정보 : </li></td>
                        	<td><textarea class="form-control" id="hostcontent" name="etc" rows="3" cols="60"></textarea></td>   
                     </tr>
                     <tr>
                     	<td><li> 사진 : </li></td>
                     	<td><img class="rounded-float" src="/hifive/resources/image/profile.png" width="100px" height="70px"></td>
                     </tr>
                  </table> 
                  </ul>
                  </p>
                  <br>
                  <center>
                  <input type="submit" class="btn btn-primary-sm" style="width:100px;" value="수정">&nbsp;&nbsp;&nbsp;
               	 <input type="reset" class="btn btn-primary-sm" style="width:100px;" value="취소">   
               	</center>
               </div>
            </div>
            </form>
            <br>
            <form action="/hifive/surferenroll" method="post">
            <div id="surfer" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Surfer</h6>
               <div class="card-body">
                  <p class="card-text">
                  <ul>
                  <table>
                     <tr>
                        <td><li>목적지 : </li></td>
                        <td><textarea class="form-control" id="s-destination" rows="1" cols="25"></textarea>
                     </tr>                     
                     <tr>
                        
                        <td><li><label>여행기간 : </label></li></td>
                        <td>
                           <input type="date" id="s-startdate" class="form-control" name="s-startdate">
                           <input type="date" id="s-enddate" class="form-control" name="s-enddate">
                        </td>
                       
                     </tr>
                     <tr>
                        <td><li>인원 : </li></td>
                        <td><input type="number" id="s-num" class="form-control" name="s-num" min="1" step="1" style="width:60px;"></td>
                     </tr>
                  </table>
                  </ul>                  
                  </p>
                  <br>
                  <center>
                  <input type="submit" class="btn btn-primary-sm" style="width:100px;" value="수정">&nbsp;&nbsp;&nbsp;
               	 <input type="reset" class="btn btn-primary-sm" style="width:100px;" value="취소">   
               	</center>
               </div>
            </div>
            </form>
            <br>
            
            <div id="partner" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Partner</h6>
               <div class="card-body">
                  <p class="card-text">                  
                  <ul>
                  <table>
                     <tr>
                        <td><li>목적지 : </li></td>
                        <td><textarea id="p-destination" class="form-control" rows="1" cols="25"></textarea>
                     </tr>                     
                     <tr>
                        <td><li>여행기간 : </li></td>
                        <td>
                           <input type="date" id="p-startdate" class="form-control" name="partnerstartday">
                           <input type="date" id="p-enddate" class="form-control" name="partnerlastday">
                        </td>
                     </tr>
                     <tr>
                        <td><li>인원 : </li></td>
                        <td><input type="number" id="p-num" class="form-control" name="partnernum" min="1" step="1" style="width:60px;"></td>
                     </tr>
                  </table>
                  </ul>               
                  </p>
                  <br>
                  <center>
                  <input type="submit" class="btn btn-primary-sm" style="width:100px;" value="수정">&nbsp;&nbsp;&nbsp;
               	 <input type="reset" class="btn btn-primary-sm" style="width:100px;" value="취소">   
               	</center>
               </div>
            </div>
            <!-- </form> -->
            <br>
            <div id="photo" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Photos</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>     
               </div>
            </div>
            <br>
            <div id="reference" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">References</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
            <br>
            <br>
            <br>                  
            <br>
            <br>
            <br>
            <br>
         </div>                       
      </div>      
      <%@ include file="../../footer.jsp"%>
   </div>
      
</body>
</html>