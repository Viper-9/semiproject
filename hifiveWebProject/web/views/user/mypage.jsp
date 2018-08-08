<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "user.model.vo.User, hsp.model.vo.*, java.util.*" %>    
<% User user = (User)request.getAttribute("user");  
   Host host = (Host)request.getAttribute("host");

   /* String[] hobbies = user.getHobby().split(",");
   String[] hchecked = new String[12];   
   for(String s : hobbies){
      switch(s){
      case "게임": hchecked[0]="checked"; break;
      case "독서": hchecked[1]="checked"; break;
      case "음악감상": hchecked[2]="checked"; break;
      case "캠핑": hchecked[3]="checked"; break;
      case "등산": hchecked[4]="checked"; break;
      case "운동": hchecked[5]="checked"; break;
      case "그림그리기": hchecked[6]="checked"; break;
      case "쇼핑": hchecked[7]="checked"; break;
      case "자전거": hchecked[8]="checked"; break;
      case "산책": hchecked[9]="checked"; break;
      case "잠자기": hchecked[10]="checked"; break;
      case "춤": hchecked[11]="checked"; break;      
      }
   }
   
   String[] checkOptions = host.getCheck1().split(",");
   String[] ochecked = new String[4];
   for(String s : checkOptions){
      switch(s){
      case "흡연": ochecked[0]="checked"; break;
      case "아이동반": ochecked[1]="checked"; break;
      case "애완동물": ochecked[2]="checked"; break;
      case "음주": ochecked[3]="checked"; break;
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
      
   </script>   
</head>

<body>
   <div id="tbox">
      <%@ include file="../../header.jsp"%>
      <div id="main">
         <div id="menu">
            <div class="card" style="width: 250px;">
               <font size="3" align="left"><b>Mypage</b></font>
               <img class="card-img-top" src="/hifive/resources/image/profile.png" alt="Card image cap" height="220px">
               <div class="card-body">
                  <p class="card-text">
                  <form action="/hifive/infoupdate" method="post">
                  <div id="mpageInfo" name="mpageInfo" align="center">
                     <font size="4"><b>안선민</b></font><%-- <font size="4"><b><%= user.getUser_Name() %></b></font> --%>
                     <br>
                     <br>            
                     <div class="custom-file">
                 <input type="file" class="custom-file-input" name="profileimg">
                 <label class="custom-file-label">파일 선택 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                 </div>      
                     <br>
                     <br>
                     <input type="text" class="form-control" name="address" id="sample6_postcode" placeholder="우편번호" style="width:210px;">                     
                     <textarea class="form-control" name="address" rows="3" cols="25" id="sample6_address" placeholder="주소"></textarea>
                     <!-- <input type="text" id="sample6_address" placeholder="주소"> -->
                     <input type="text" name="address" class="form-control" size="25" id="sample6_address2" placeholder="상세주소">      
                     <input type="button" class="btn btn-outline-light text-dark" onclick="sample6_execDaumPostcode()" value="주소 입력"><br>               
                     <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
                     <script>
                         function sample6_execDaumPostcode() {
                             new daum.Postcode({
                                 oncomplete: function(data) {
                                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                     
                                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                     var fullAddr = ''; // 최종 주소 변수
                                     var extraAddr = ''; // 조합형 주소 변수
                     
                                     // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                         fullAddr = data.roadAddress;
                     
                                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                         fullAddr = data.jibunAddress;
                                     }
                     
                                     // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                                     if(data.userSelectedType === 'R'){
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
                     
                                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                     document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                                     document.getElementById('sample6_address').value = fullAddr;
                     
                                     // 커서를 상세주소 필드로 이동한다.
                                     document.getElementById('sample6_address2').focus();
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
                           <input type="text" readonly class="form-control" style="width:40px;" name="gender" value="여"<%-- value="<%=user.getGender() %>" --%>>
                           </div>
                        </div>   
                     </li>                     
                     <li>
                        <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Job</label>
                           <div class="col-sm-10">
                           <input type="text" class="form-control" style="width:200px;" name="job" value="건물주" <%-- value="<%= user.getJob() %>" --%>>
                           </div>
                        </div>
                    </li>     
                     <li>
                        <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Email</label>
                      <div class="col-sm-10">
                      <input type="email" class="form-control" style="width:300px;" name="email" value="mh9460@naver.com" <%-- value="<%= user.getEmail() %>" --%>>
                      </div>
                    </div>               
                      </li>                      
                     <li>
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Phone</label>
                           <div class="col-sm-10">
                              <input type="tel" class="form-control" style="width:200px;" name="phone" value="010-2383-7670" <%-- value="<%= user.getPhone() %>" --%> placeholder="000-0000-0000">
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
	                                 <label class="btn btn-outline-secondary btn-sm">
	                                 <input type="checkbox" name="hobby" value="game"<%-- <%= checked[0] %> --%>> 게임
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm"> 
	                                 <input type="checkbox" name="hobby" value="reading"> 독서
	                                 </label>
	                              </div>
	                           
	                           </td>
	                           <td>
	                              <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm">
	                                 <input type="checkbox" name="hobby" value="music"> 음악감상
	                                 </label>
	                              </div>
	                           </td>
	                           <td>
	                           <div class="btn-group-toggle" data-toggle="buttons">
	                                 <label class="btn btn-outline-secondary btn-sm">
	                                 <input type="checkbox" name="hobby" value="music"> 음악감상
	                                 </label>
	                              </div>
	                           
	                           </td>
                           </tr>
                           <tr>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm"> 
                                 <input type="checkbox" name="hobby" value="climb"> 등산
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm">
                                 <input type="checkbox" name="hobby" value="sport"> 운동
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm"> 
                                 <input type="checkbox" name="hobby" value="art"> 그림그리기
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm">
                                 <input type="checkbox" name="hobby" value="music"> 음악감상
                                 </label>
                              </div>
                           
                           </td>
                           </tr>
                           <tr>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm">
                                 <input type="checkbox" name="hobby" value="bike"> 자전거
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm">
                                 <input type="checkbox" name="hobby" value="walk"> 산책
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm"> 
                                 <input type="checkbox" name="hobby" value="sleep"> 잠자기
                                 </label>
                              </div>
                           
                           </td>
                           <td>
                           <div class="btn-group-toggle" data-toggle="buttons">
                                 <label class="btn btn-outline-secondary btn-sm"> 
                                 <input type="checkbox" name="hobby" value="music"> 음악감상
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
                  <center><textarea class="form-control" name="introduction" rows="5" cols="90"></textarea></center>
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
                           <input type="checkbox" name="hostcheck" value="smoking"> 흡연 &nbsp;   
                           <input type="checkbox" name="hostcheck" value="kid"> 아이동반 &nbsp;   
                           <input type="checkbox" name="hostcheck" value="pet"> 애완동물 &nbsp;   
                           <input type="checkbox" name="hostcheck" value="drinking"> 음주 &nbsp;            
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