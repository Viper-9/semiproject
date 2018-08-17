<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>


</style>
<script type="text/javascript">

</script>
</head>
<body>

<div>
	<form>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">목적지</span>
			</div>
			<input type="text" class="form-control" id="destinationS">
		</div>
		<br>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">여행기간</span>
			</div>
			<input type="date" class="form-control" id="startdateS"> &nbsp; ~ &nbsp; 
			<input type="date" class="form-control" id="enddateS">
		</div>
		<br>
		<div class="input-group mb-3" >
			<div class="input-group-prepend">
				<span class="input-group-text">인원</span>
			</div>
			<input type="number" placeholder="0" max="10" class="form-control col-sm-3" id="numberS">
		</div>
		<br>
		<button type="submit" class="btn btn-primary" id="surferenrollbtn">등록하기</button>
	</form>
</div>
</body>
</html>
