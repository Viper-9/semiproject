<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User, java.util.*" %>
<%
	User user = (User)request.getAttribute("user");
	String userid = (String)session.getAttribute("userId"); 
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

	<script>
	    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            }
	        }).open();
	    });
	</script>
	<style type="text/css">
      /* 여기 이새끼가 전체 우리 컨테이너 역할 */
      .container{
   margin: 0 auto;
   padding: 10px;
   }
   
      /* 이게  우리가 이제 만들어야할 공간 */
      #main{width:1000px;overflow:hidden;}
      /* 이게 왼쪽 창 float:left 가  다음 창을 붙여준다 */
      #menu{width:250px;margin:5px 0 0 0;float:left;}
      /* 이게 오른족 꾸미는거  */
      #content1{width:740;margin:5px 0 0 0;float:left;padding:0 0 0 10px;}   
   </style>
	<script type="text/javascript">
		
	</script>	
</head>

<body>


	
	

	<div class="container">
		<%@ include file = "../../header.jsp" %> 
		<hr>
		<div id="main">
			<div id="menu">
				<div class="card" style="width: 250px;">
					<font size="3" align="left"><b>Mypage</b></font>
					<img class="card-img-top" src="/hifive/resources/image/profile.png" alt="Card image cap" height="220px">
					<div class="card-body">
						<p class="card-text">
						<div id="mpageInfo" name="mpageInfo" align="center">
							<font size="4"><b><%= userName %></b></font>
							<br>
							<br>
							<input type="file" name="profileimg"></input>
							<br>
							<br>
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
							<input type="text" id="sample2_postcode" placeholder="우편번호"><br>
							<input type="text" id="sample2_address" placeholder="한글주소">
							<input type="text" id="sample2_addressEnglish" placeholder="영문주소">
							
							<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
							<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
							<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
							
							<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
							<script>
							    // 우편번호 찾기 화면을 넣을 element
							    var element_layer = document.getElementById('layer');
							
							    function closeDaumPostcode() {
							        // iframe을 넣은 element를 안보이게 한다.
							        element_layer.style.display = 'none';
							    }
							
							    function sample2_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
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
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample2_postcode').value = data.zonecode; //5자리 새우편번호 사용
							                document.getElementById('sample2_address').value = fullAddr;
							                document.getElementById('sample2_addressEnglish').value = data.addressEnglish;
							
							                // iframe을 넣은 element를 안보이게 한다.
							                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							                element_layer.style.display = 'none';
							            },
							            width : '100%',
							            height : '100%',
							            maxSuggestItems : 5
							        }).embed(element_layer);
							
							        // iframe을 넣은 element를 보이게 한다.
							        element_layer.style.display = 'block';
							
							        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
							        initLayerPosition();
							    }
							
							    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
							    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
							    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
							    function initLayerPosition(){
							        var width = 300; //우편번호서비스가 들어갈 element의 width
							        var height = 400; //우편번호서비스가 들어갈 element의 height
							        var borderWidth = 5; //샘플에서 사용하는 border의 두께
							
							        // 위에서 선언한 값들을 실제 element에 넣는다.
							        element_layer.style.width = width + 'px';
							        element_layer.style.height = height + 'px';
							        element_layer.style.border = borderWidth + 'px solid';
							        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
							        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
							        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
							    }
							</script>
							
							<br>
							<select name="countries" style="width:150px;">
								<option>국적</option>
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
									<th><input type="button" class="btn btn-danger" style="width:200px;" value="회원 탈퇴"></th>
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
							<tr align="center" valign="middle">
								<th width="80">Host</th>
								<th>Surfer</th>
								<th>Partner</th>
							</tr>
							<tr>
								<td align="center"><input type="checkbox" name="role" value="host"></input></td>
								<td align="center"><input type="checkbox" name="role" value="surfer"></input></td>
								<td align="center"><input type="checkbox" name="role" value="partner"></input></td>
							</tr>
						</table>
						<ul>
						<table>
							<li>Gender : <input type="text" name="gender" <%-- value="<%=user.getGender() %>" --%> readonly="readonly"></li>
							<br>
							<li>Job : <input type="text"></li>
							<br>
							<li>Email : <input type="email" name="email"></li>
							<br>
							<li>Phone : <input type="tel" name="phone"></li>
							<br>
							<li>Hobby : 
								<table align="right" width="520" cellspacing="0" cellpadding="0">
									<tr align="center">
										<td width="130"><input type="checkbox" name="hobby" value="game" <%-- <%= checked[0] %> --%>> 게임</td>
										<td width="130"><input type="checkbox" name="hobby" value="reading"> 독서</td>
										<td width="130"><input type="checkbox" name="hobby" value="music"> 음악감상</td>
										<td width="130"><input type="checkbox" name="hobby" value="music"> 음악감상</td>
									</tr>
									<tr align="center">
										<td><input type="checkbox" name="hobby" value="climb"> 등산</td>
										<td><input type="checkbox" name="hobby" value="sport"> 운동</td>
										<td><input type="checkbox" name="hobby" value="art"> 그림그리기</td>
										<td><input type="checkbox" name="hobby" value="music"> 음악감상</td>
									</tr>
									<tr align="center">
										<td><input type="checkbox" name="hobby" value="bike"> 자전거</td>
										<td><input type="checkbox" name="hobby" value="walk"> 산책</td>
										<td><input type="checkbox" name="hobby" value="sleep"> 잠자기</td>
										<td><input type="checkbox" name="hobby" value="music"> 음악감상</td>
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
						<center><textarea name="introduction" rows="3" cols="85"></textarea></center>
					</div>
				</div>
				<br>
				<div id="myhome" class="card" style="width: auto;">
					<h6 class="card-header" id="card_info">My Home</h6>
					<div class="card-body">
						<p class="card-text">
						<ul>
						<table>
							<tr>
								<td><li>최대 가능 인원 : </li></td>
								<td><input type="number" name="hostnum"></input>&nbsp;명</td>
							</tr>
							<tr>
								<td><li>선호하는 성별 : </li></td>
								<td><select name="preferredgender">
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
									<select name="sleeping">
										<option value="living">거실</option>
										<option value="single">단독 방</option>
										<option value="sharing">공용 방</option>
										<option value="sofa">소파</option>
									</select>											
								</td>
							</tr>					
							<tr>
								<td><li>추가 정보 : </li></td>
								<td><textarea name="etc" rows="3" cols="60"></textarea></td>
							</tr>
						</table>
						</ul>
						</p>
					</div>
				</div>
				<br>
				<div id="surfer" class="card" style="width: auto;">
					<h6 class="card-header" id="card_info">Surfer</h6>
					<div class="card-body">
						<p class="card-text">
						<ul>
						<table>
							<tr>
								<td><li>목적지 : </li></td>
								<td><textarea rows="1" cols="25"></textarea>
							</tr>							
							<tr>
								<td><li>여행기간 : </li></td>
								<td>
									<input type="date" name="surferstartday">&nbsp;~&nbsp;
									<input type="date" name="surferlastday">
								</td>
							</tr>
							<tr>
								<td><li>인원 : </li></td>
								<td><input type="number" name="surfernum"></input>&nbsp;명</td>
							</tr>
						</table>
						</ul>						
						</p>
					</div>
				</div>
				<br>
				<div id="partner" class="card" style="width: auto;">
					<h6 class="card-header" id="card_info">Partner</h6>
					<div class="card-body">
						<p class="card-text">						
						<ul>
						<table>
							<tr>
								<td><li>목적지 : </li></td>
								<td><textarea rows="1" cols="25"></textarea>
							</tr>							
							<tr>
								<td><li>여행기간 : </li></td>
								<td>
									<input type="date" name="partnerstartday">&nbsp;~&nbsp;
									<input type="date" name="partnerlastday">
								</td>
							</tr>
							<tr>
								<td><li>인원 : </li></td>
								<td><input type="number" name="partnernum"></input>&nbsp;명</td>
							</tr>
						</table>
						</ul>					
						</p>
					</div>
				</div>
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
					<input type="submit" class="btn btn-primary" style="width:200px;" value="수정"></input>&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn btn-primary" style="width:200px;" value="취소"></input>				
				<br>
				<br>
				<br>
				<br>
			</div>					
		</div>
		<hr>
		<%@ include file="../../footer.jsp"%>
	</div>	

</body>
</html>