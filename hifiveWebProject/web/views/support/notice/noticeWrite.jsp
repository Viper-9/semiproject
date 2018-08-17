<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">>
<title>공지사항 글쓰기</title>

<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style type="text/css">
/* 전체 사이즈 1000에 맞게 사이즈 해놨으니 안 바꾸셔도 될거에여.. */

/* 여기 이새끼가 전체 우리 컨테이너 역할 */
.container {
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

.card-body {
   text-align: center;
}

.rounded-circle {
   width: 50px;
   height: 50px;
}

#reporttable {
   width: 600px; 

} 
#reporttable1 {
   
   left: 8%;
}


#circle2 {
   width: 30px;
   height: 30px;
}
</style>

<script type="text/javascript">
   
</script>
</head>
<body>
<div class="container">
      <%@ include file="../../../header.jsp"%>
      <hr>
      <div id="main">
         <div id="menu">
            <div class="card" style="width: 250px;">
               <div class="card-body">
                  <h5 class="card-title">사용자 기본정보</h5>
                  <h6 class="card-subtitle mb-2 text-muted">(이름및 지역)</h6>
                  <p class="card-text">
                     ......<br> <br> <br> <br> <br> <br>
                     <br> <br> <br>
                  </p>
                  <a href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a>

               </div>
            </div>

         </div>
         <div id="content1">
            <%@ include file="../../../supportmenu.jsp"%>
         </div>

         <div id="content2">

            <br>
              <div class="card border-0" style="width: 600px;" id="reporttable1">
            <table
               class="table table-borderless table-sm border"
               id=reporttable>
               <thead>
               </thead>
               <tbody>
               
                <tr class="p-3 mb-2 bg-light text-dark">
                     <th style="width:70px">제목</th>
                     <td colspan="2" class="text-left"><input type="text" class="form-control" style="width:400px" name="ntitle" ></td>
                  </tr>
                  <tr >
                     <th>작성자</th>

                     <td class="text-left"><input type="text" class="form-control" style="width:150px" name="nwriter" value="관리자" readonly></td>
                     <td></td>
                  </tr>
                  <tr>
                     <th >내용</th>
                     <td class="text-left"> 
                        <textarea name="ncontent" class="form-control" cols="70" rows="7"></textarea>
                     </td> 
                     <td></td>
                  </tr>
               
                  <tr>

                     <td colspan="3">
                        <button type="submit" class="btn btn-primary btn-sm">등록</button>
                        <button type="submit" class="btn btn-primary btn-sm" onclick="location.href='/hifive/reportlist'">취소</button></td>
                  </tr>
               </tbody>
            </table>

         </div>
      </div>
      <br>
      
      </div>
      <hr>
      <%@ include file="../../../footer.jsp"%>
   
</div>

</body>
</html>