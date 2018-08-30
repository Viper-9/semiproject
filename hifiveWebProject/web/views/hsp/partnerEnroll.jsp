<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>surferEnroll</title>
<!-- <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places" type="text/javascript"></script> 
<script src="https://maps.googleapis.com/maps/api/place/autocomplete/json?sensor=false&amp;libraries=places&key=AIzaSyC1PejTS_mPvUuakgb1rMn0_WcInfKrqgM"></script>  -->
<script type="text/javascript">
	function partnerEnroll(){		
		var today = new Date();
		var sDate = new Date($("#startdateP").val());
		var eDate = new Date($("#enddateP").val());
		
		if($("#destinationP").val()=="" || $("#startdateP").val()=="" || $("#enddateP").val()=="" || $("#numberP").val()==""){
			alert("빈칸을 확인해주세요.");
			return false;
		}		
		if((sDate > eDate) || (today > sDate)){
			alert("날짜를 확인해주세요.");
			return false;
		} 	
		if($("#numberP").val()<=0) {
	         alert("인원수를 확인해주세요.");
	         return false;
	      }
	}
</script>

</head>
<div>
	<form action="/hifive/partnerenroll?userid=<%= user_id %>" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">* 목적지</span>
			</div>
			<input type="text" class="form-control" id="destinationP" name="destination">
		</div>
		<br>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">* 여행기간</span>
			</div>
			<input type="date" class="form-control" id="startdateP" name="startdate"> &nbsp; ~ &nbsp; 
			<input type="date" class="form-control" id="enddateP" name="enddate">
		</div>
		<br>
		<div class="input-group mb-3" >
			<div class="input-group-prepend">
				<span class="input-group-text">* 인원</span>
			</div>
			<input type="number" placeholder="0" max="10" class="form-control col-sm-3" id="numberP" name="num">
		</div>
		<br>
		<button type="submit" class="btn btn-primary" id="surferenrollbtn" onclick="return partnerEnroll();">등록하기</button>
	</form>
</div>
</body>
</html>