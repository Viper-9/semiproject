<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%!public int getRandom() {
	int random = 0;
	random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 10000;
	return random;
	//생성되는 코드 암호화 필수
}%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
<title>회원가입 페이지</title>

	<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<style type="text/css">
</style>

<script type="text/javascript" >
	//사용자가 입력한 인증번호와 만들어진 인증번호 비교
 	function checkCode() {
		var v1 = $("#code_check1").val();
		var v2 = $("#code").val();
		
		console.log("code_check1 = " + v1 + ", code = " + v2);
		if(v1!=v2){
			document.getElementById('checkCode').style.color = "red";
			document.getElementById('checkCode').innerHTML = "잘못된 인증번호";
			$(".signupbtn").prop("disabled", true);
			
			
		}else{
			document.getElementById('checkCode').style.color = "blue";
			document.getElementById('checkCode').innerHTML = "인증되었습니다";
			$(".signupbtn").prop("disabled", false);
			
		}
	}
	
	// 아이디 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	var idCheck = 0;
	var pwdCheck = 0;
	

	function CheckId(){
		// 아이디 체크하여 가입버튼 비활성화, 중복확인 및 데이터 값에 따른 배경 색 변경 
		var inputed = $('#joinuserid').val();
		$.ajax({
			url : "/hifive/checkid",
			type : "post",
			data : { id : inputed },
			success : function(data){
				console.log("아이디 success : " + data);
				if(inputed == "" && data == '0'){
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					idCheck = 0;
				} else if (data == '0') {
					$("#joinuserid").css("background-color", "#FFCECE");

					alert("이미 사용중인 아이디입니다");
					//$("#joinuserid").val("");
					$("#joinuserid").focus();

					idCheck = 1;
					if(idCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("backgroud-color", "#33ff66");
						singupCheck();
					}
				} else if (data == '1') {
					$(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#33ff66");
                    $("#joinuserid").css("background-color", "#33ff66");
                    idCheck = 0;
				}
				
				
				
			}
		});
	}
	//비밀번호 = 재입력비밀번호를 비교해주고 색상표시
	function checkPwd() {
		var inputed = $('#userpwd1').val();
		var reinputed = $('#userpwd2').val();
		if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#userpwd2").css("background-color", "#FFCECE");
		}
		else if (inputed == reinputed) {
            $("#userpwd2").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#33ff66");
                signupCheck();
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#userpwd2").css("background-color", "#FFCECE");
		}
	}
	// 이름 , 이메일, 전화번호, 생년월일 , 성별 입력 안했을때 가입버튼 비활성화
	 function signupCheck() {
	        var name = $("#username").val();
	        var email = $("#email").val();
	        var phone = $("#phone").val();
	        
	        if(name== "" || email== "" || phone == "") {
	            $(".signupbtn").prop("disabled", true);
	            $(".signupbtn").css("background-color", "#aaaaaa");
	        } else {
	        }
	    }

	
	 
	function sendIt() {
		 var getId = RegExp(/^[a-z][a-z\d]{3,11}$/)
		 var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		 	
		if ($("#joinuserid").val() == "") {
			alert("아이디 입력바람");
			$("#joinuserid").focus();
			return false;
		}

		//이메일 공백 확인
		if ($("#receiver").val() == "") {
			alert("이메일을 입력해주세요");
			$("#receiver").focus();
			return false;
		}

		//이메일 유효성 검사
		if (!getMail.test($("#receiver").val())) {
			alert("이메일형식에 맞게 입력해주세요")
			$("#receiver").val("");
			$("#receiver").focus();
			return false;
		}
	}

	
	var EmailCheck = 0;
	//이메일 인증번호 누르기전 중복 확인 실시간 키입력으로 확인받음
	function checkEmail(){
		var Einputed = $('#receiver').val();
		// ajax로 사용자가 입력한 이메일이 DB에 중복되어 있는지 실시간 체크
		$.ajax({
			url : "/hifive/checkemail",
			type : "post",
			data : { useremail : Einputed},
			success : function(data){
				console.log(" 이메일 중복확인 success : " + data)
				if(Einputed == "" && data == '0'){
					$("#emailsubmit").prop("disabled", true);
					EmailCheck = 0;
				} else if (data == '0') {
					$("#receiver").css("background-color", "#FFCECE");
					alert("이미 사용중인 이메일입니다");					
					$("#receiver").val("");
					$("#receiver").focus();
					EmailCheck = 1;
					$("#emailsubmit").prop("disabled", true);
					
					if(EmailCheck == 0){
						$("#emailsubmit").prop("disabled", false);
						$("#receiver").css("background-color", "#FFCECE");
					}
				} else if (data == '1') {
					$("#emailsubmit").prop("disabled", false);
					$("#receiver").css("background-color", "#B0F6AC");
					EmailCheck = 0;
				}
			}
		});
	}
	
	
	//이메일 인증번호보내기 눌렀을 때 
	function Emailsubmit(){
	
			var sendreceiver = $("#receiver").val();
			var makecode = $("#code").val();
			
			// ajax로 사용자가 작성한 이메일 + 동시에 발생한 랜덤변수 서블릿으로 보내는 구문
			$.ajax({
				url : "/hifive/send",
				type : "post",
				data : {sreceiver : sendreceiver, code_check : makecode},
				success : function(data){
					 console.log(data);
					 $("#receiver").html($("#receiver").text() + data);
				}							
			});
	}

	//캔슬 눌렀을때 모든 텍스트필드 null 배경색 초기화
	 function cancelbtn(){
        $("#joinuserid").val(null);
        $("#joinuserid").css("background-color", "#ffffff");
        $("#userpwd1").val('');
        $("#userpwd2").val('');
        $("#userpwd2").css("background-color", "#ffffff");
        $("#username").val(null);
        $("#receiver").val(null);
        $("#receiver").css("background-color", "#ffffff");
        $("#emailsubmit").prop("disabled", true);
        $("#code_check1").val('');
        $("#code_check1").css("background-color", "#ffffff");
        $("#phone").val('');
        $(".signupbtn").prop("disabled", true);
       // $(".signupbtn").css("background-color", "#aaaaaa");
	 } 
	

</script>

</head>
<body>
	<form action="" method="post" onsubmit = "return sendIt()" >
		<table width="auto" align="center" cellspacing="5" bgcolor="#FFFFFF">
			<tr>
				<td width="150">ID</td>
				<td width="500">
				<input class="form-control" type="text" placeholder = "Enter ID" 
					name="userid" id="joinuserid" <%-- oninput = "CheckId();"--%>>
					&nbsp;
					</td>
					
			</tr>
			
			<tr>
				<td>암 호</td>
				<td><input class="form-control" type="password" placeholder = "Enter Password"
				 name="userpwd" id="userpwd1" <%-- oninput = "checkPwd()"--%>>
				</td>
			</tr>
			<tr>
				<td>암호확인</td>
				<td><input class="form-control" type="password" placeholder = "Repeat Password" 
				id="userpwd2" <%-- oninput = "checkPwd()"--%> ></td>
			</tr>
			<tr>
				<td>이 름</td>
				<td><input class="form-control" type="text" name="username"></td>
			</tr>
			<tr>
				<td>이 메 일</td>
				<td><br>
					<div class="input-group mb-3">
						<input style="width: 150px;" class="form-control" type="email"
							id="receiver" name="email" placeholder="TravelsCouch@welcome.com" autocomplete = "off"
							oninput = "checkEmail()" aria-label="이메일을 입력하시오" aria-describedby="emailsubmit" />
						<div class="input-group-append">

							<input style="width: 150px;" class="btn btn-primary" disabled = "disabled"
								id="emailsubmit" type="button" value="인증번호발송" onclick = "Emailsubmit()">
						</div>
					</div> 
				</td>
				<td><input class="form-control" type="hidden" readonly="readonly" name="code"
					id="code" value="<%=getRandom()%>" /></td>
			
			</tr>
					
			
			<%-- 인증번호 라인 --%>
			<tr>
				<td><span>인증번호</span></td>
				<td><input class="form-control" type="text" name="code_check1" id="code_check1"
					onkeyup="checkCode()" placeholder="인증번호를 입력하세요" />
					<div id="checkCode"></div></td>
				<%-- <td><input class="form-control" type="hidden" readonly="readonly"
							name="code_check2" id="code_check2"
							value="<%=request.getAttribute("code")%>" /></td> --%>
			</tr>
			<!--  <input class="form-control" id="h1" type="hidden" value='인증하기' />-->
			<tr>
				<td>전화번호</td>
				<td><input class="form-control" type="tel" name="phone" id = "phone" placeholder = "010-1234-5678"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input class="form-control" type="date" name="birth" id = "birth" value="2018-01-01"></td>
			</tr>
			<tr>
				<td>성 별</td>
				<td><input type="radio" name="gender" id = "gender" value="M"> 남
					&nbsp; <input type="radio" name="gender" value="F"> 여</td>
			</tr>
		</table>

		<table align="center">
			<tr>
				<td><br> &nbsp; &nbsp;
				<!-- 기존적으로 sign up 버튼은 비활성화 되어 있음 -->
					<button type = "button" class = "btn btn-primary cancelbtn" onclick = "cancelbtn()">Cancel</button>
					<button type = "submit" class = "btn btn-primary signupbtn" onclick = "sendIt()" <%-- disabled = "disabled"--%> >Sign up</button>
					
				</td>
			</tr>
		</table>
	</form>
</body>
</html>