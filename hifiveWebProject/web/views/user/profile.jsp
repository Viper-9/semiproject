<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Profile</title>

<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script type="text/javascript"  src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=it6Bx0b47tvhxxRDP2mg&submodules=geocoder"></script>
<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<style type="text/css">
   /* 여기 이새끼가 전체 우리 컨테이너 역할 */
   .container{
   margin: 0 auto;
   padding: 10px;
   }

   /* 이게  우리가 이제 만들어야할 공간 */
   #main{width:1000px;overflow:hidden;}
   /* 이게 왼쪽 창 float:left 가  다음 창을 붙여준다 */
   #menu{width:250px;margin:5px 0 0 0;float:left;}
   /* 이게 오른족 꾸미는거  */
   #content1{width:740px;margin:5px 0 0 0;float:left;padding:0 0 0 10px;}
   
   #card_info { text-align:center; }
</style>

<script type="text/javascript">

</script>
</head>
<body>
   <div class="container">
      <%@ include file="../../header.jsp"%>
      <hr>
      <div  id="main">
         <div id="menu">
            <div class="card" style="width: 250px;">
               <font size="3"><b>Profile</b></font> <img class="card-img-top"
                  src="/hifive/resources/image/profile.png" alt="Card image cap"
                  height="220px">
               <div class="card-body">
                  <p class="card-text">
                  <div id="userInfo" name="userInfo" align="center">
                     <font size="4"><b>오승연</b></font> <br>
                     <!-- 여기에 username 불러와야함!!!!!!!!!!!!! -->
                     <button class="mapopen" style="border: 0; background: white;"
                        data-toggle="modal" data-target="#openMap">
                        <img src="/hifive/resources/image/map.png" width="27"
                           height="27">
                     </button>
                     <font size="2">경기도 성남시 분당구 ~~~ </font>
                     <!-- 여기에 주소 불러와야함!!!! -->
                  </div>
                  <br>
                  <div id="request" name="request" align="center">
                     <table border="0">
                        <tr>
                           <th><input type="button" class="btn btn-primary"
                              value="Host에게 요청하기" style="width: 200px;"></th>
                        </tr>
                        <tr>
                           <th><input type="button" class="btn btn-primary"
                              value="Surfer에게 요청하기" style="width: 200px;" disabled></th>
                        </tr>
                        <tr>
                           <th><input type="button" class="btn btn-primary"
                              value="Partner에게 요청하기" style="width: 200px;" disabled></th>
                        </tr>
                     </table>
                  </div>
                  <br> <br>
                  <div id="favorite" name="favorite" align="center">
                     <input type="button" class="btn btn-warning" value="선호"
                        style="width: 200px;">
                  </div>
                  </p>
               </div>
            </div>
         </div>
         <div id="content1">
            <div class="card" id="basisinfo" style="width: auto;">
               <div class="card-body">
                  <ul>
                     <!-- 여기에 사용자 정보 불러오기 -->
                     <li>Gender : <br> <br>
                     <li>Job : <br> <br>
                     <li>Hobby :
                        <button type="button" class="btn btn-outline-dark btn-sm">Game</button>
                        <button type="button" class="btn btn-outline-dark btn-sm">Book</button>
                  </ul>
               </div>
            </div>
            <br>
            <div id="infomenu" style="margin-left: 8px;">
               <a href="#intro"><input type="button"
                  class="btn btn-outline-info" value="Introduction"
                  style="width: 110px;"></a>&nbsp; <a href="#myhome"><input
                  type="button" class="btn btn-outline-info" value="My Home"
                  style="width: 110px;"></a>&nbsp; <a href="#surfer"><input
                  type="button" class="btn btn-outline-info" value="Surfer"
                  style="width: 110px;"></a>&nbsp; <a href="#partner"><input
                  type="button" class="btn btn-outline-info" value="Partner"
                  style="width: 110px;"></a>&nbsp; <a href="#photo"><input
                  type="button" class="btn btn-outline-info" value="Photos"
                  style="width: 110px;"></a>&nbsp; <a href="#reference"><input
                  type="button" class="btn btn-outline-info" value="References"
                  style="width: 110px;"></a>
            </div>
            <br>
            <div id="intro" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Introduction</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
            <br>
            <div id="myhome" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">My Home</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
            <br>
            <div id="surfer" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Surfer</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
               </div>
            </div>
            <br>
            <div id="partner" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Partner</h6>
               <div class="card-body">
                  <p class="card-text">With supporting text below as a natural
                     lead-in to additional content.</p>
                  <br> <br> <br> <br> <br> <br> <br>
                  <br>
               </div>
            </div>
            <br>
            <div id="photo" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Photos</h6>
               <div class="card-body">
                  <img src="/hifive/resources/image/home.JPG" class="rounded" data-toggle="modal"
                     data-target="#photoDetail" style="width: 225px;">
                  <img src="/hifive/resources/image/home2.png" class="rounded" data-toggle="modal"
                     data-target="#photoDetail" style="width: 225px;">
                  <img src="/hifive/resources/image/home3.jpg" class="rounded" data-toggle="modal"
                     data-target="#photoDetail" style="width: 225px;">
                  
               </div>
            </div>
            <br>
            <div id="reference" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">References</h6>
               <div class="card-body">
                  <p class="card-text">With
                     supportinzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzvvvvvvvvvzzzzzzzzzzzzzg text
                     below as a natural lead-in to additional content.</p>
                  <br> <br> <br> <br> <br> <br> <br>
                  <br> <br> <br> <br> <br> <br> <br>
                  <br> <br>
               </div>
            </div>
         </div>
      </div>
      <br>
      <hr>
      <%@ include file="../../footer.jsp"%>
   </div>


   <!-- Modal -->
   <div class="modal fade" id="openMap" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">
                  <b>지도 확인</b>
               </h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <div id="map" style="width: 430px; height: 400px;"></div>
            </div>
         </div>
      </div>
   </div>

   <div class="modal fade bd-example-modal-lg align-middle" id="photoDetail"
      tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog modal-lg" " role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">
                  <b>사진 상세보기</b>
               </h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <div id="carouselExampleControls" class="carousel slide"
                  data-ride="carousel">
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <img class="d-block w-100"
                           src="/hifive/resources/image/home.JPG" alt="First slide">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100"
                           src="/hifive/resources/image/home2.png" alt="Second slide">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100"
                           src="/hifive/resources/image/home3.jpg" alt="Third slide">
                     </div>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleControls"
                     role="button" data-slide="prev"> <span
                     class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                     class="sr-only">Previous</span>
                  </a> <a class="carousel-control-next" href="#carouselExampleControls"
                     role="button" data-slide="next"> <span
                     class="carousel-control-next-icon" aria-hidden="true"></span> <span
                     class="sr-only">Next</span>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>


   <script>
      var map = new naver.maps.Map('map');
      var myaddress = '운중동';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!) 여기에 사용자 주소
      naver.maps.Service.geocode({
         address : myaddress
      }, function(status, response) {
         if (status !== naver.maps.Service.Status.OK) {
            return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
         }
         var result = response.result;
         // 검색 결과 갯수: result.total
         // 첫번째 결과 결과 주소: result.items[0].address
         // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
         var myaddr = new naver.maps.Point(result.items[0].point.x,
               result.items[0].point.y);
         map.setCenter(myaddr); // 검색된 좌표로 지도 이동
         // 마커 표시
         var marker = new naver.maps.Marker({
            position : myaddr,
            map : map
         });
         // 마커 클릭 이벤트 처리
         naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
               infowindow.close();
            } else {
               infowindow.open(map, marker);
            }
         });
         // 마크 클릭시 인포윈도우 오픈
         var infowindow = new naver.maps.InfoWindow({
            content : myaddress
         });
      });
   </script>


</body>
</html>