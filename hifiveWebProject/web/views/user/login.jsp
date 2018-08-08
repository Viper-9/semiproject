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

	</script>
</head>
<body>

	<script src="/hifive/resources/js/jquery-3.3.1.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
	<div class="container">
			
		<div>
			<form action="/hifive/login" method="post">
				<div class="form-group">
    				<label for="">ID</label>
    				<input type="text" class="form-control" name="userid" id="userid" placeholder="ID">
    			
  				</div>
  				<div class="form-group">
    				<label for="">Password</label>
    				<input type="password" class="form-control" name="userpassword" id="userpassword" placeholder="Password">
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