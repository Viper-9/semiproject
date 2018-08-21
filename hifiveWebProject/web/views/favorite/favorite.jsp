<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="favorite.model.vo.Favorite, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>favorite</title>
<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style type="text/css">
/* 전체 사이즈 1000에 맞게 사이즈 해놨으니 안 바꾸셔도 될거에여.. */

/* 여기 이새끼가 전체 우리 컨테이너 역할 */

   .container{
   margin: 0 auto;
   padding: 10px;
   }

/* 이게  우리가 이제 만들어야할 공간 */
#main { 
   width: 1000px;
   overflow: hidden;
}
/* 이게 왼쪽 메뉴부분!! float:left 가  다음 창을 붙여준다 */
#menu {
   width: 250px;
   margin: 5px 0 0 0;
   float: left;
}
/* 이게 오른쪽 본문 들어가는 부뷴 */
#content1 {
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}
#content2 {
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}

.card-body{
   text-align: center;
}

.searchdiv {
   text-align: center;
}
</style>
<script type="text/javascript">
	 $(function(){
		$.ajax({
			url : "/hifive/favoritelist",
            type : "get",
            data : {},            
            dataType : "json",
            success : function(data){	
            	//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
		        var jsonStr = JSON.stringify(data);   
		        //문자열을 json 객체로 바꿈
		        var json = JSON.parse(jsonStr);
	        
            	var value = "";                        

            	if(json.list.length == 0){
	            	value += "선호하는 유저가 없습니다.";
	               $("#content1").html($("#content1").html()+value);   
	            } else{
	            	value += "<table cellpadding='15'><tr>"
	            	for(var i in json.list){
	            		var address="입력안함";
	            		var nationality = "입력안함";
	            	  	if(json.list[i].address != null)
	            	  		address = json.list[i].address;
	            	  	if(json.list[i].nationality != null)
	            	  		nationality = json.list[i].nationality;   
	            	  	
	            	  	if(json.list[i].image != null) { // 프로필 사진 있으면 (나중에 수정)
	            	  		value += "<td><div class='card' style='width: 200px;'>" 
	            	  		+ "<img class='card-img-top' src='/hifive/resources/image/profile.png' alt='Card image cap'>";
	            	  	} else{ // 프로필 사진 없으면
	            	  		value += "<td><div class='card' style='width: 200px;'>" 
	   	       		        + "<img class='card-img-top' src='/hifive/resources/image/profile.png' alt='Card image cap'>";
	            	    }
	            	    value += "<div class='card-body'>" 
	       		       	+ "<a href='/hifive/profileinfo?userid=" + json.list[i].f_userid 
	       		        + "'><h4 class='card-title'><b>" + json.list[i].user_name + "</b></h4></a>"
	       		        + "<p class='card-text'> <h6>" + address + "</h6> <b>" + nationality + "</b><br>" 
	       		        + "<a href='/hifive/favoritedelete?f_userid=" + json.list[i].f_userid + "'>취소하기</a>" + " </p> </div> </div></td>"
	       		        
	       		        if((i+1)%3==0)
	       		        	value += "</tr><tr>";
	       		        if((i+1)==json.list.length)
	       		        	value += "</tr></table>";
	               	}
	               	$("#content1").html($("#content1").html()+value); 
	              } 
            }, // success
			error : function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			} // error			
		});
	}); 
		 
	 
</script>
</head>
<body>
   <div class="container">
      <%@ include file="../../header.jsp"%>
      <hr>
      <div id="main">
         <div id="menu">
      

              
         </div>
         
        <div id="content1">

        
		</div>
               
      </div>
      <br>
      <hr>
      <%@ include file="../../footer.jsp"%>
   </div>

</body>
</html>
