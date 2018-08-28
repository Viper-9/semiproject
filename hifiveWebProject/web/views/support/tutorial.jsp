<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>튜토리얼</title>

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
          <%@ include file="../../information.jsp"%>
   
         </div>
         <div id="content1">
 			<%@ include file="../../supportmenu.jsp"%>  
 			</div>
 
  
         
         <div id="content2">
         <br>
            <div class="card" style="width: 600px;" id="safetycard">
					<div class="card-body">
						<h3 class="card-title"><font style = "color:#ff6633"><b>Travel's Couch 이용 방법</b></font></h3>
						<br>
						<p class="card-text">
						<font style = "color:black; font-size: 13pt"><b>다양한 사람과 문화를 만나고, 새로운 친구를 만드십시오.</b></font><br><br><br>					
						<font style = "color:black; font-size: 11pt">
						<b>Travel's Couch</b>은 여행자들을 커뮤니티에 연결시키는 서비스입니다.<br>
						<b>Travel's Couch</b>을 사용하여 집이나 고향을 여행자들과 공유하거나 공유 할 장소를 <br>찾으십시오.<br>
						<b>Travel's Couch</b>는 항상해야 할 일이 있고 만날 새로운 친구가 있도록 도와줍니다
						</font><br><br><br>
						<font style = "color:#ff6633; font-size: 15pt"><b>충분한 대화</b></font><br><br>
						<font style = "color:black; font-size: 12pt">
						매칭이 되고 싶은 상대를 계속해서 찾으십시오.<br>
						대화를 하는데 있어서 무례하게 보이는 것에 대해 걱정하거나,
						너의 경계에 대해 분명히하고 그들에 대해 부끄러워하지 마십시오.<br>						 
						충분한 대화를 나누어 상대가 필요한 사람인지, 안전한 사람인지 판단하십시오.
						혼자 상대와 함께 지내는 것이 불편하다면, 가족이나 커플과 함께 지내는 것을 고려하십시오.
						</font><br><br><br>
						<font style = "color:#ff6633; font-size: 15pt"><b>백업 계획을 가지십시오</b></font><br><br>
						<font style = "color:black; font-size: 12pt">
						해당 숙소에 도착이 후 대체 할 곳이 있는지 확인하십시오. <br>
						가장 가까운 호스텔 또는 호텔을 확인하거나. <br> 이동하기 전에 백업 호스트를 준비하십시오.<br>
						가능하다면, 도착하기 전에 호스트의 이웃을 조사하십시오. 						
						</font><br><br><br>
						<font style = "color:#ff6633; font-size: 15pt"><b>자신의 신상정보를 함부로 공개하지 마십시오.</b></font><br><br>
						<font style = "color:black; font-size: 12pt">
						새로운 사람에게  처음부터 전화 번호, 이메일를 알려주지 마십시오.<br>
						대화를 나누고싶다면,사이트에서 제공하는 쪽지 또는 모바일앱을 이용하십시오.<br>
						혹시 대화 중 상대방으로부터 위험이 감지되면 대화내용을 저장하시고 신고게시판을 이용하십시오.						
						</font><br><br><br>
						<font style = "color:#ff6633; font-size: 15pt"><b>리뷰를 작성하고 신고게시판을 이용하십시오</b></font><br><br>
						<font style = "color:black; font-size: 12pt">
						우리 팀은 가능한 한 가장 안전하고 신뢰할 수있는 커뮤니티를 구축하는 것을 돕기 위해 일하고 있습니다.<br>
						부정적인 유저가 있다면 그에 프로필에 리뷰를 남기십시오.<br>
						이는 다른 사람들이 추후에 더욱 안전한 매칭을 할 수 있도록 도와줍니다.<br>
						Travel's Couch에 대한 안전 문제를보고하면 향후 Travel's Couch를 안전하게 유지할 수 있습니다.<br>
						비밀리에 부정적인 경험이나 안전 문제를 신고 하십시오 .				
						</font><br><br><br>
						</p>
						<p>
						<font style = "color:red; font-size: 10pt; opacity: 0.4;">
								우리 팀에서 제공하는 안전 기본 사항을 읽고 하단에 체크와 버튼을 클릭하십시요 <br>
								이는 안전문제에 대한 충분한 지식을 습득하였다고 가정, 법적인 책임은 본인에게 있습니다								
						</font>
						</p>
         </div>
      </div>
      <br>
      <hr>
      <%@ include file="../../footer.jsp"%>
   </div>

</body>
</html>