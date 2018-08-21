<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.model.vo.User" %> 
<% 
    
   User user = (User)session.getAttribute("loginuser");
   
%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script type="text/javascript"  src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=it6Bx0b47tvhxxRDP2mg&submodules=geocoder"></script>
<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
   #content1{width:740px;margin:5px 0 0 0;float:left;padding:0 0 0 10px;}
   
   #card_info { text-align:center; }
   
   #errorMS { -webkit-transition: all 1s; }
</style>
<script type="text/javascript">
var getPassword = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/); //패스워드 유효성 영문(대소문자)+숫자+특수문자 포함 8~16자리

function changebg1(){
	$("#nowpw").css("background-color", "#FFFFFF");
	$("#nowpw").tooltip("dispose");
}
function changebg2(){
	 if(!getPassword.test($("#changepw").val())){
		 $("#changepw")
		    .attr('data-original-title', '비밀번호 강도 : 낮음')
		    .attr('data-placement', 'right').tooltip('show')
		 $("#changepw").css("background-color", "#FFCECE");
		 // $("#changepw").css("background-color", "#FFFFFF");
	     //$("#changepw").tooltip("dispose");
	 }else if(getPassword.test($("#changepw").val())){
		 $("#changepw")
		    .attr('data-original-title', '비밀번호 강도 : 높음')
		    .attr('data-placement', 'right').tooltip('show')
		 $("#changepw").css("background-color", "#B0F6AC");
	 }
}
function changebg3(){
	$("#changepwcheck").css("background-color", "#FFFFFF");
	$("#changepwcheck").tooltip("dispose");
	
}

function check() {
	
		
		var inputnow = $('#nowpw').val();
		var changepw = $('#changepw').val();
		var changepwcheck = $('#changepwcheck').val();
		var login = $('#loginid').val();
		 
       			
   		 if(inputnow == null || inputnow == ""){
   			$("#nowpw")
		  	    .attr('data-original-title', '현재 비밀번호를 입력해주세요')
		    	.attr('data-placement', 'right').tooltip('show')
  			 $("#nowpw").css("background-color", "#FFCECE");
  			 $("#nowpw").focus();
  		 	 return false;
  		 
		 } else if(changepw == null || changepw == ""){
			 $("#changepw")
			    .attr('data-original-title', '변경할 비밀번호를 입력해주세요')
			    .attr('data-placement', 'right').tooltip('show')
			 $("#changepw").css("background-color", "#FFCECE");
			 $("#changepw").focus();
			 return false;
			 
		 } else if(changepwcheck == null || changepwcheck == ""){
	 		 $("#changepwcheck")
			    .attr('data-original-title', '확인 비밀번호를 입력해주세요')
			    .attr('data-placement', 'right').tooltip('show')
			 $("#changepwcheck").css("background-color", "#FFCECE");
			 $("#changepwcheck").focus();
	 		 return false;
	 	
 		  } else if(!getPassword.test($("#changepw").val())){
 			 $("#errorMS").css("color", "red").text('변경 비밀번호를 다시 입력해주세요.')
 			 $("#errorMS").css("display", "block"); 
			 $("#changepw").val("");
			 $("#changepw").css("background-color", "#FFCECE");
	         $("#changepw").focus();
	         
	         return false;	   
	 		 
		 } else if ( changepw != changepwcheck ) {
			
			 $("#changepwcheck")
			    .attr('data-original-title', '재확인 비밀번호가 일치하지 않습니다')
			    .attr('data-placement', 'right').tooltip('show')
  			 $("#changepwcheck").css("background-color", "#FFCECE");
  			 $("#changepwcheck").val('');
  		     $("#changepwcheck").focus();
  			 return false;
  		 
		 } else {	 
			$.ajax({
        	url : "/hifive/changepwd",
        	tpye : "post",
        	data : { nowpw : inputnow, changepw : changepw, userid : login },
       		success : function(data){
			 	if(data == '0'){
			 		/* $("#errorMS").animate({

					      height:'50px'

				    }); */
				    
				    $("#errorMS").css("color", "red").text('이전 비밀번호가 일치하지 않습니다.')
			 		$("#errorMS").css("display", "block");  
				    $("#nowpw").css("background-color", "#FFCECE");
			 		$("#nowpw").val('');
			 	    $("#changepw").val('');
			 	   $("#nowpw").css("background-color", "#FFFFFF");
			 		$("#changepwcheck").val('');
			 		$("#nowpw").focus();
			 		return false;
			 		
			 	}
			 	else if(data == '1'){
			 		alert("비밀번호 변경 성공");
			 	location.href="/hifive/views/user/mypage.jsp"
			 	} else {
			 		alert("관리자에게 문의하세요");
			 		return false;
			 	}      		 
	       }    
			
	    });  
   		
	 }
}
	
		 $(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip({
			//container: "body",
			delay: { "show": 1000}
			
			
		});
			
	    
}); 
	
	
	 
</script>


</head>
<body>
  <div class="container">
      <%@ include file="../../header.jsp"%>
      <hr>
      <div  id="main">
         <div id="menu">
            
             여기에 마이페이지 왼쪽부분 들어갈거임
         
         </div>
         <div id="content1">
       	 <h3>Password Reset</h3>
       	 <br>
    	 <form action="/hifive/changepwd" method="post" onsubmit = "return false"  >
         <input type = "hidden" value = "<%=user.getUser_Id()%>" id = "loginid" name = "loginid">
         
         <div class="form-group row" id = "errorMS" style = "display:none">
              <label class="col-form-label"> <font color = "red"></font></label>
              <div class="col-sm-10">
              </div>
         </div>   
         <div class="form-group row">
              <label class="col-form-label">현재 비밀번호 </label>
              <div class="col-sm-10">
                  <input class="form-control col-sm-5" type = "password" id="nowpw" name="nowpw" oninput = "changebg1()">
              </div>
         </div>   
		 <div class="form-group row">
              <label class="col-form-label">변경 비밀번호 </label>
              <div class="col-sm-10">
                  <input class="form-control col-sm-5" type = "password" id="changepw" name="changepw" oninput = "changebg2()"
                  data-toggle="tooltip" title="az, AZ, 0-9, 기호 포함 8 ~ 16자리 암호 입력" data-placement="right" >
                  <!-- data-delay='{ "show": 500, "hide": 1000 }' -->
              </div>
         </div>
         <div class="form-group row">
              <label class="col-form-label">비밀번호 확인 </label>
              <div class="col-sm-10">
                  <input class="form-control col-sm-5" type = "password" id="changepwcheck" name="changepwcheck" oninput = "changebg3()">
              </div>
         </div>   
  	     <div style="text-align:center;">
   		 <button class="btn btn-primary col-sm-2" onclick = "check()">비밀번호 변경</button>
   		 </div>
     </form>
         </div>
      </div>
      <br>
      <hr>
      <%@ include file="../../footer.jsp"%>
   </div>
   
</body>
</html>