<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>hostEnroll</title>
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div>
		<form action="">
			<div class="form-row">
				<div class="col input-group mb-3" >
					<div class="input-group-prepend">
						<span class="input-group-text" id="pnums">인원</span>
					</div>
					<input type="number" placeholder="0" max="10" class="form-control col-sm-6" id="pnumber">

				</div>
				<div class="col input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="preferG">성별</span>
					</div>
					<select class="custom-select" id="hostprefergender" name="preferredgender">
						<option selected>선택</option>
						<option value="male">남성</option>
						<option value="female">여성</option>
						<option value="both">상관없음</option>
					</select>
				</div>
			</div>
			
			<div class="col input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="pnums">가능 조건</span>
					</div>
					<div class="btn-group-toggle" data-toggle="buttons">
	                    <label class="btn btn-outline-secondary"> 
	                    <input type="checkbox" name="possible" id="possible" value="kids">아이동반
	                    </label>
	                </div> &nbsp;
	                <div class="btn-group-toggle" data-toggle="buttons">
	                    <label class="btn btn-outline-secondary"> 
	                    <input type="checkbox" name="possible" id="possible" value="pet">애완동물동반
	                    </label>
	                </div> &nbsp;
	                <div class="btn-group-toggle" data-toggle="buttons">
	                    <label class="btn btn-outline-secondary"> 
	                    <input type="checkbox" name="possible" id="possible" value="smoke">흡연
	                    </label>
	                </div> &nbsp;
	                 <div class="btn-group-toggle" data-toggle="buttons">
	                    <label class="btn btn-outline-secondary"> 
	                    <input type="checkbox" name="possible" id="possible" value="drink">음주
	                    </label>
	                </div>
	               </div>
	               <div class="col input-group mb-3">
	               <div class="input-group-prepend">
						<span class="input-group-text">숙소</span>
					</div>
					<select class="custom-select" name="sleeping" id="sleepling">
                                <option value="">선택</option>
                              <option value="living">거실</option>
                              <option value="single">단독 방</option>
                              <option value="sharing">공용 방</option>
                              <option value="sofa">소파</option>
                           </select> 
                           </div> 
                            <div class="col input-group mb-3">
	               <div class="input-group-prepend">
						<span class="input-group-text">기타 사항</span>
					</div>
					<textarea class="form-control" name="hostetc" id="hostetc" rows="3" cols="60"></textarea>
                           </div> 
					<button type="submit" class="btn btn-primary" id="hostenrollbtn">등록하기</button>
		</form>
	</div>
</body>
</html>
