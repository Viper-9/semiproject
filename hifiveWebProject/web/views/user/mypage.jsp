<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ page import = "user.model.vo.User, hsp.model.vo.*, java.util.*" %>    
<% User user = (User)request.getAttribute("user");  
   Host host = (Host)request.getAttribute("host");   
  
	   String[] hchecked = new String[12];   		
	   if(user.getHobby() == null){
		   
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
	   }
  
	   
  /*  String[] ochecked = new String[4];
   if(host.getCheck1() == null){
	   
   } else {
	   String[] checkOptions = host.getCheck1().split(",");
	   for(String s : checkOptions){
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
      /* 여기 이새끼가 전체 우리 컨테이너 역할 */
      #tbox{width:1000px;font-family:고딕; margin : 0 auto;}
      /* 이게  우리가 이제 만들어야할 공간 */
      #main{width:1000px;overflow:hidden;}
      /* 이게 왼쪽 창 float:left 가  다음 창을 붙여준다 */
      #menu{width:250px;margin:10px 0 5px 5px;float:left;}
      /* 이게 오른족 꾸미는거  */
      #content1{width:750;margin:10px 0 -3px 5px;float:left;padding:5px 0 0 5px;}   
   </style>   
   <script type="text/javascript">
   $(function(){
		var userid = $("#uid").val();		
		// 나에게 온 대화신청 목록
		$.ajax({	
			url : "/hifive/reviewlist",
			type : "get",
			data : { uid : userid },
			dataType : "json",			
			success : function(data){
				//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
				var jsonStr = JSON.stringify(data);
							
				//문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				var values = "";
				if(json.list.length == 0){
					values += "등록된 리뷰가 없습니다.";
					$("#review").html($("#review").html()+values);	
				} else{					
					for(var i in json.list){
						values += "아이디 : " + json.list[i].user_id 
						+"<br>날짜 : " + json.list[i].review_date
						+"<br>내용 : " + json.list[i].content +"<br><br>";
					}										
					$("#review").html($("#review").html()+values);			
				}
			}, // success
			error : function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			} // error
		});
   });

   </script>   
</head>

<body>
   <div id="tbox">
      <%@ include file="../../header.jsp"%>
      <div id="main">
         <div id="menu">
            <div class="card" style="width: 250px;">
            <form action="/hifive/infoupdate" method="post">
               <font size="3" align="left"><b>Mypage</b></font>               
               <img class="card-img-top" src="/hifive/resources/image/profile.png" alt="Card image cap" height="220px">
               <div class="card-body">
                  <p class="card-text">                  
                  <div id="mpageInfo" name="mpageInfo" align="center">
                    <div class="col-sm-10">
                    	<input type="text" readonly class="form-control" style="align:center;" name="username" value="<%= user.getUser_Name() %>">
                    </div>
                     <br>
                     <br>            
                     <div class="custom-file">
                 <input type="file" class="custom-file-input" name="profileimg">
                 <label class="custom-file-label">파일 선택 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                 </div>      
                     <br>
                     <br>
          			<textarea class="form-control" name="address" id="sample5_address" rows="3" cols="25" placeholder="주소"><%= user.getAddress() %></textarea>
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
                        <option>국적 선택</option>              
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
                              
                              <input type="button" class="btn btn-danger" style="width:200px;" value="회원 탈퇴">
                             
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
                        <td align="center"><input type="checkbox" class="form-check-input" name="role" value="host"></td>
                        <td align="center"><input type="checkbox" class="form-check-input" name="role" value="surfer"></td>
                        <td align="center"><input type="checkbox" class="form-check-input" name="role" value="partner"></td>
                     </tr>
                  </table>
                  <br>
                  <ul>
                  <table>
                     <li>
                        <div class="form-group row">
                       <label class="col-sm-2 col-form-label">Gender</label>
                           <div class="col-sm-10">
                           <input type="text" readonly class="form-control" style="width:60px;" name="gender" 
                           		<% if(user.getGender().equals("F")){ %>
                           			value="여성"
                           		<% }else{ %>
                           		    value="남성"      			
                           		<% } %>>
                           </div>
                        </div>   
                     </li>
                     <li>
                        <div class="form-group row">
                       <label class="col-sm-2 col-form-label">Birth</label>
                           <div class="col-sm-10">
                           <input type="text" readonly class="form-control" style="width:120px;" name="birth" value="<%= user.getBirth() %>">
                           </div>
                        </div>   
                     </li>                             
                     <li>
                        <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Job</label>
                           <div class="col-sm-10">
                           <input type="text" class="form-control" style="width:200px;" name="job" value="<%= user.getJob() %>">
                           </div>
                        </div>
                    </li>     
                     <li>
                        <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Email</label>
                      <div class="col-sm-10">
                      <input type="email" class="form-control" style="width:300px;" name="email" value="<%= user.getEmail() %>" >
                      </div>
                    </div>               
                      </li>                      
                     <li>
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Phone</label>
                           <div class="col-sm-10">
                              <input type="tel" class="form-control" style="width:200px;" name="phone" value="<%= user.getPhone() %>" placeholder="000-0000-0000">
                              </div>
                        </div>
                     </li>                        
                     <li>
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Hobby</label>
                        </div> 
                       <%-- <% if(user.getHobby() != null){ %>  --%>               
                       <table style="text-align:center" cellspacing="0" cellpadding="2">
                           <tr>
	                           <td>
	                              <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm">
	                                 <input type="checkbox" name="hobby" value="game" <%-- <%= hchecked[0] %> --%>checked> 게임
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[1] %>"> 
	                                 <input type="checkbox" name="hobby" value="reading"> 독서
	                                 </label>
	                           </div>
	                           
	                           </td>
	                           <td>
	                              <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[2] %>">
	                                 <input type="checkbox" name="hobby" value="music"> 음악감상
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[3] %>">
	                                 <input type="checkbox" name="hobby" value="camping">  캠핑
	                                 </label>
	                              </div>
	                           
	                           </td>
                           </tr>
                           <tr>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[4] %>"> 
                                 <input type="checkbox" name="hobby" value="climb"> 등산
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[5] %>">
                                 <input type="checkbox" name="hobby" value="sport"> 운동
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[6] %>"> 
                                 <input type="checkbox" name="hobby" value="art"> 그림그리기
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[7] %>">
                                 <input type="checkbox" name="hobby" value="shopping"> 쇼핑
                                 </label>
                              </div>
                           
                           </td>
                           </tr>
                           <tr>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[8] %>">
                                 <input type="checkbox" name="hobby" value="bike"> 자전거
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[9] %>">
                                 <input type="checkbox" name="hobby" value="walk"> 산책
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[10] %>"> 
                                 <input type="checkbox" name="hobby" value="sleep"> 잠자기
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm <%= hchecked[11] %>"> 
                                 <input type="checkbox" name="hobby" value="dance"> 춤
                                 </label>
                              </div>
                           
                           </td>
                           </tr>
                        </table>      
                        <%-- <% } %>  --%>               
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
                  <textarea class="form-control" name="introduction" rows="5" cols="90"><%-- <%= user.getContent() %> --%></textarea>
               </div>
            </div>
            </form>
            <br>
            <form action="/hifive/hostenroll" method="post">
            <div id="myhome" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">My Home</h6>
               <div class="card-body">
                  <p class="card-text">
                  <ul>
                  <table>
                     <tr>
                        <td><li>최대 가능 인원 : </li></td>
                        <td><input type="number" class="form-control" name="hostnum" min="1" step="1" style="width:60px;"></td>
                     </tr>
                     <tr>
                        <td><li>선호하는 성별 : </li></td>
                        <td>
                           <select class="custom-select" name="preferredgender" style="width:150px;">
                            <option selected>선택</option>
                           <option value="male">남성</option>
                           <option value="female">여성</option>
                           <option value="both">상관없음</option>
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
	                                 <label class="btn btn-outline-secondary btn-sm <%-- <%= ochecked[0] %> --%>">
	                                 <input type="checkbox" name="hostcheck" value="smoking"> 흡연
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm <%-- <%= ochecked[1] %> --%>"> 
	                                 <input type="checkbox" name="hostcheck" value="kid"> 아이동반
	                                 </label>
	                           </div>	                           
	                           </td>
	                           <td>
	                              <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm <%-- <%= ochecked[2] %> --%>">
	                                 <input type="checkbox" name="hostcheck" value="pet"> 애완동물
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm <%-- <%= ochecked[3] %> --%>">
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
                                <option value="">선택</option>
                              <option value="living">거실</option>
                              <option value="single">단독 방</option>
                              <option value="sharing">공용 방</option>
                              <option value="sofa">소파</option>
                           </select>                                 
                        </td>
                     </tr>               
                     <tr>
                        <td><li>추가 정보 : </li></td>
                        <td><textarea class="form-control" name="etc" rows="3" cols="60"></textarea></td>
                     </tr>
                     <tr>
                     	<td><li> 사진 : </li></td>
                     	<td><img class="rounded-float" src="/hifive/resources/image/profile.png" width="100px" height="70px" border=""></td>
                     </tr>
                  </table>
                  </ul>
                  </p>
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
                        <td><textarea class="form-control" rows="1" cols="25"></textarea>
                     </tr>                     
                     <tr>
                        
                        <td><li><label>여행기간 : </label></li></td>
                        <td>
                           <input type="date" class="form-control" name="surferstartday">
                           <input type="date" class="form-control" name="surferlastday">
                        </td>
                       
                     </tr>
                     <tr>
                        <td><li>인원 : </li></td>
                        <td><input type="number" class="form-control" name="surfernum" min="1" step="1" style="width:60px;"></td>
                     </tr>
                  </table>
                  </ul>                  
                  </p>
               </div>
            </div>
            </form>
            <br>
            <form action="/hifive/partnerenroll" method="post">
            <div id="partner" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Partner</h6>
               <div class="card-body">
                  <p class="card-text">                  
                  <ul>
                  <table>
                     <tr>
                        <td><li>목적지 : </li></td>
                        <td><textarea class="form-control" rows="1" cols="25"></textarea>
                     </tr>                     
                     <tr>
                        <td><li>여행기간 : </li></td>
                        <td>
                           <input type="date" class="form-control" na me="partnerstartday">
                           <input type="date" class="form-control" name="partnerlastday">
                        </td>
                     </tr>
                     <tr>
                        <td><li>인원 : </li></td>
                        <td><input type="number" class="form-control" name="partnernum" min="1" step="1" style="width:60px;"></td>
                     </tr>
                  </table>
                  </ul>               
                  </p>
               </div>
            </div>
            </form>
            <br>
            <!-- <div id="photo" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Photos</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>     
               </div>
            </div> -->
            <br>
            
            <%-- ajax로 리뷰. 최근 리뷰가 맨위로 가게 내림차순 --%>
            <div id="reference" class="card" style="width: auto;">
            <input type="hidden" id="uid" value="<%= user.getUser_Id() %>">
               <h6 class="card-header" id="card_info">References</h6>
               <div class="card-body" id="review">
                  
               </div>
            </div>
            
            <br>
            <br>
            <br>
               <input type="submit" class="btn btn-primary" style="width:200px;" value="수정">&nbsp;&nbsp;&nbsp;
               <input type="reset" class="btn btn-primary" style="width:200px;" value="취소">   
                     
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