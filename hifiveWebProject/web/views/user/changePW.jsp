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
<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function changebg1(){
	$("#nowpw").css("background-color", "#FFFFFF");
}
function changebg2(){
	$("#changepw").css("background-color", "#FFFFFF");
}
function changebg3(){
	$("#changepwcheck").css("background-color", "#FFFFFF");
}

function check() {
    
		var inputnow = $('#nowpw').val();
		var changepw = $('#changepw').val();
		var changepwcheck = $('#changepwcheck').val();
		var login = $('#loginid').val();
		 
       			
   		 if(inputnow == null || inputnow == ''){
 	    	 alert("이전 비밀번호를 입력해주세요");
  			 $("#nowpw").css("background-color", "#FFCECE");
  			 $("#nowpw").focus();
  		 	 return false;
  		 
		 } else if(changepw == null || changepw == ""){
			 alert("변경 비밀번호를 입력해주세요");
			 $("#changepw").css("background-color", "#FFCECE");
			 $("#changepw").focus();
			 return false;
			 
		 } else if(changepwcheck == null || changepwcheck == ""){
	 		 alert("재확인 비밀번호를 입력해주세요");
			 $("#changepwcheck").css("background-color", "#FFCECE");
			 $("#changepwcheck").focus();
	 		 return false;
	 		 
		 } else if ( changepw != changepwcheck ) {
			
  			 alert("변경 비밀번호가 일치하지 않습니다");
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
			 		alert("비밀번호가 일치하지 않습니다");
			 		$("#nowpw").val('');
			 		$("#changepw").val('');
			 		$("#changepwcheck").val('');
			 		$("#nowpw").focus();
			 	}
			 	else if(data == '1'){
			 		alert("비밀번호 변경 성공");
			 	opener.parent.location.reload();
			 	window.close();
			 	} else {
			 		alert("관리자에게 문의하세요");
			 	}      		 
	       }    
			
	    });  
   		
	 }
}

</script>


</head>
<body>
    <h1> 비밀번호 변경 </h1>
    <br /> <form action="/hifive/changepwd" method="post" onsubmit = "return false"  >
    		<input type = "hidden" value = "<%=user.getUser_Id()%>" id = "loginid" name = "loginid">
    <br />
    <br /> 지금 비밀번호 : <input type = "password" id="nowpw" name="nowpw" oninput = "changebg1()">
    <br />
    <br /> 변경 비밀번호 : <input type = "password" id="changepw" name="changepw" oninput = "changebg2()">
    <br /> 
    <br /> 변경 비밀번호 재확인 : <input type = "password" id="changepwcheck" name="changepwcheck" oninput = "changebg3()">
    <br />
    <br /> <button onclick = "check()"> 변경 </button>
    <br /> </form>
    
    
    
    


</body>
</html>