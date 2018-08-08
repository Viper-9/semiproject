<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User, java.util.*" %>
<%
   String userid = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메인화면</title>

<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

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
.card-body{text-align: center;
}
</style>

<script type="text/javascript">

</script>
</head>
<body>
   <div class="container">
      <%@ include file="../../header.jsp"%>
      <hr>
      <div id="main">
         <div id="menu">
      
      <div class="card" style="width: 250px;">
  <div class="card-body">
    <h5 class="card-title">사용자 기본정보</h5>
    <h6 class="card-subtitle mb-2 text-muted">(이름및 지역)</h6>
    <p class="card-text">......<br><br><br><br><br><br><br><br><br></p>
    <a href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a>
    
  </div>
</div>
   
         </div>
         <div id="content1">
         메인오른쪽위
   

  

         </div>
         
         <div id="content2">   
         메인 오른쪽 밑
         </div>
      </div>
      <br>
      <hr>
      <%@ include file="../../footer.jsp"%>
   </div>

</body>
</html>