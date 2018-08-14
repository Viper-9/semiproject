<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
	
	<style type="text/css">
		.container{
			margin: 0 auto;
		}
		
		#idsearch{
		width: 320px;
			
		}
		
		#passwordsearch{
		width: 320px;
			
		}
		
	</style>
	<script type="text/javascript" src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	
	
	function searchid(){
		
		var receiveremail = $('#searchuseremail').val();
		
		if($('#searchuseremail').val() == ''){
			
			alert("이메일을 입력하세요");
			return false;
		} 
		
		return true;
		
		
			
		
		
	}
	
	</script>
	
	
	<title>search</title>
</head>

<body>
	<script src="/hifive/resources/js/jquery-3.3.1.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
	
	<div class="container">

		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  			<li class="nav-item">
    			<a class="nav-link active" id="pills-id-tab" data-toggle="pill" href="#pills-id" role="tab" aria-controls="pills-id" aria-selected="true">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디 찾기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
  			</li>
  			<li class="nav-item">
    			<a class="nav-link" id="pills-password-tab" data-toggle="pill" href="#pills-password" role="tab" aria-controls="pills-password" aria-selected="false">&nbsp;&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;&nbsp;</a>
  			</li>
  		</ul>
		<div class="tab-content" id="pills-tabContent">
  			<div class="tab-pane fade show active" id="pills-id" role="tabpanel" aria-labelledby="pills-id-tab">아이디를 잊어버리셨나요? <br> 가입할 때 입력한 이메일로 아이디를  <br>보내드립니다. 				
  				<div>
  					<br>
					<form action="/hifive/searchid" method="post">
						<div class="form-group">
    						<label for="">Email</label>
    						<input type="email" class="form-control" id="searchuseremail" name = "searchuseremail" placeholder="Email">
    			
  						</div>
  						<br>
  						
  						<button type="submit" class="btn btn-primary btn-lg" id ="idsearch" >아이디 찾기</button>
					</form>
				</div>  			 			
  			</div>
  			
  			<div class="tab-pane fade" id="pills-password" role="tabpanel" aria-labelledby="pills-password-tab">비밀번호를 잊어버리셨나요? <br> 가입할 때 입력한 이메일로 비밀번호를  <br>보내드립니다.
  				<div>
  					<br>
					<form action="" method="post">
						<div class="form-group">
    						<label for="">ID</label>
    						<input type="text" class="form-control" id="usereid" placeholder="ID">
    			
  						</div>
  						<div class="form-group">
    						<label for="">Email</label>
    						<input type="email" class="form-control" id="useremail" placeholder="Email">
  						</div>
  						<br>
  						<button type="submit" class="btn btn-primary btn-lg" id ="passwordsearch">비밀번호 찾기</button>
					</form>
				</div>  			 
  			</div> 
		
		</div>
	
	</div>
	
</body>

</html>