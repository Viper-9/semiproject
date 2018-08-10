<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

	<title>log-in</title>
	
	<style type="text/css">
		.container{
			margin: 0 auto;
		}
		
		#loginbtn{
		width: 320px;
			
		}
		
	</style>
	
	<script type= "text/javascript">
		var receiverid = $('#userid').val();
		var receiverpw = $('#userpassword').val();
	
		function checklogin() {
			//아이디 공백 먼저확인
			if ($("#userid").val() == "") {
				alert("아이디를 입력해주세요");
				$("#userid").focus();
				$("#userid").css("background-color", "#FFCECE");
				return false;
			}
			//비밀번호 공백 확인
			if ($("#userpassword").val() == "") {
				alert("비밀번호를 재입력하세요");
				$("#userpassword").focus();
				$("#userpassword").css("background-color", "#FFCECE");
				return false;
			}
			
			//로그인 성공/실패 ajax 구현중
			/* if($("#userid").val() != "") {
				
				$.ajax ({
					url : "/hifive/login",
					type : "post",
					data : { userid : receiverid, userpassword : receiverpw },
					success : function(data){
						console.log(" 로그인 success : " + succese)
						if(data == '0') {
							alert("아이디,비밀번호가 일치하지 않습니다")
							$("#userid").val('');
							$("#userid").focus();
							$("#userid").css("background-color", "#FFCECE");
							$("#userpassword").val('');
							$("#userpassword").focus();
							$("#userpassword").css("background-color", "#FFCECE");
							
							return false;
						} else {
							
							
							console.log("로그인완료");
						}
							
						}
							
						
					
				});
			} */					
		}

		function changeIDbg() {
			//아이디 입력하면 배경 하얀색으로 다시 변경
			$("#userid").css("background-color", "#FFFFFF");

		}
		
		function changePWbg() {
			//비밀번호 입력하면 배경 하얀색으로 다시 변경
			$("#userpassword").css("background-color", "#FFFFFF");
		}
		
		
	</script>
</head>
<body>

	<script src="/hifive/resources/js/jquery-3.3.1.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
	<div class="container">
			
		<div>
			<form action="/hifive/login" method="post" onsubmit = "return checklogin()">
				<div class="form-group">
    				<label for="">ID</label>
    				<input type="text" class="form-control" name="userid" id="userid" 
    				placeholder="ID" oninput = "changeIDbg()">
    			
  				</div>
  				<div class="form-group">
    				<label for="">Password</label>
    				<input type="password" class="form-control" name="userpassword" id="userpassword"
    				 placeholder="Password" oninput = "changePWbg()">
  				</div>
				<br>
 				<div style="text-align:center;">
  				<button type="submit" class="btn btn-primary btn-lg" id ="loginbtn">Log-in</button>
  				</div>
			</form>
		</div>
	
	</div>


</body>
</html>