<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
 <head>
 <meta charset="UTF-8">
 <title>게시판</title>
  <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="resources/js/jquery.raty.js"></script>
    <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
    <script src="http://vjs.zencdn.net/c/video.js"></script>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
     
    <script>
    
    $(document).ready(function() {
        $("#lout").click(function(){
  			location.href='myinfo';
  		});
      	
    	  $("#logOutBnt").click(function(){
    			if(confirm("로그아웃 하시겠습니까?")){
    				location.href='logout';
    			}
    		});
    	  
    	 
      });
    function popupOpen(){
      	var popUrl = "bookfind2";
      	var popOption= "width=370, height360, resizable=no";
      		window.open(popUrl,"",popOption);
      }
    
    //슬라이드
    $(document).ready(function() {
		var jbOffset = $('.jbMenu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.jbMenu').addClass('jbFixed');
			} else {
				$('.jbMenu').removeClass('jbFixed');
			}
		});
	});

	$(function() {
		$(".img_slide dd:eq(0)").show();

		$(".prenext .prev")
				.click(
						function() {
							//기본설정
							var ddnum = [];
							var dtnum = [];
							var num = '';
							for (var i = 0; i < $(".img_slide dd").size(); i++) {
								if ($(".img_slide dd:eq(" + i + ")").css(
										"display") == "block") {
									num = i;
								}
								ddnum.push($(".img_slide dd:eq(" + i + ")"));
							}
							//초기설정
							$(".img_slide dd").fadeOut("normal");
							var allnum = $(".img_slide dd").size() - 1;
							for (var i = 0; i < allnum; i++) {
								if (num == i + 1) {
									ddnum[i].fadeIn("normal");
								} else if (num == 0) {
									ddnum[6].fadeIn("normal");
								}
							}

						});

		//다음버튼클릭시
		$(".prenext .next")
				.click(
						function() {
							//기본설정
							var ddnum = [];
							var dtnum = [];
							var num = '';
							for (var i = 0; i < $(".img_slide dd").size(); i++) {
								if ($(".img_slide dd:eq(" + i + ")").css(
										"display") == "block") {
									num = i;
								}
								ddnum.push($(".img_slide dd:eq(" + i + ")"));//dd 배열
							}
							//초기설정
							$(".img_slide dd").fadeOut("normal");//dd가림처리
							var allnum = $(".img_slide dd").size() - 1;
							for (var i = 0; i < allnum; i++) {
								if (num == i) {
									ddnum[i + 1].fadeIn("normal");
								} else if (num == allnum) {
									ddnum[0].fadeIn("normal");
								}
							}
						});

		$(".nav_slide").hover(function() {
			$(".prenext").fadeIn("fast");
		}, function() {
			$(".prenext").fadeOut("fast");
		});
	})
</script>
    <style>
    body {
  margin: 0px;
  padding: 0px;
  background-color: #FDFCF0;
}

div#wapper {
  width: 100%;
  text-align: center;
  margin: 0 auto;
}
  
   .modal-content{
   width: 100%;
   position: relative;
   padding: 65px 40px 5px 40px;
   }
   .main_menu{
  margin-left: 20px;
  letter-spacing: 5px;
}
  #lout{
  font-size: 30px;
  color: #4E248A;
  cursor: pointer;
}
.main_submenu{
  float:right;
  font-size: 20px;
  margin-top: 30px;
  color: #008299;
 }
 
  .nav_main {
  color: crimson;
  font-size: 20px;
}

.main_title {
  font-size: 40px;
}
#logOutBnt{
  cursor: pointer;
}

a:hover {
  text-decoration: none;
}

.sub_menu{
  width:1200px;
  height: 900px;
  background-color: lime;
  margin: 0 auto;
  margin-top: 70px;
  padding: 20px;
  border: 1px solid;
}
.toptop{
  float: right;
}

.left_wrap{
 float: left;
}
.poster{
  width: 100%;
  
}

.modal-body{
  margin-top: -5px;
  font-size: 20px;
  float: left;
  font-family: 'NanumGothic','나눔고딕','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo','sans-serif';
}

.modal-footer{
   float: left;
}
.modalout{
  float: right;
}
.Modal_booking{
  
}

<!-- ㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ -->
.jbTitle {
  text-align: center;
}

.jbMenu {
  z-index: 4; text-align : center;
  background-color: #EBE9DC;
  padding: 10px 0px;
  width: 100%;
  font-size: 25px;
  word-spacing: 15px;
  cursor: pointer;
  min-width: 1400px;
}
.jbMenu p{
   text-align: right;
}
.jbMenu a{
  float: left;
  margin-left: 50px;
  margin-top: 18px;
}

.jbFixed {
  position: fixed;
  top: 0px;
}

.nav_slide {
  margin: 0 auto;
  width: 100%;
  height: 600px;
  margin-top: -15px;
  cursor: pointer;
}

.img_slide dd {
height: 600px;
 width: 100%; 
  position: absolute;
  float: left;
}


.prenext {
  z-index: 3;
  position: absolute;
  top: 50%;
  left: 0;
  width: 100%;
}

.prev {
  width: 66px;
  height: 66px;
  color: #198591;
  text-decoration: none;
  position: absolute;
  display: block;
  background-image:
    url("http://image2.megabox.co.kr/mop/home/main/arrow.png");
  background-repeat: no-repeat;
  background-position: 0px;
}

.next {
  right: 30px;
  width: 66px;
  height: 66px;
  color: #198591;
  overflow: hidden;
  position: absolute;
  text-decoration: none;
  text-indext: -999px;
  display: block;
  background-image:
    url("http://image2.megabox.co.kr/mop/home/main/arrow.png");
  background-repeat: no-repeat;
  background-position-x: right;
  background-position-y: 0;
}

.Main_section {
  height: 1000px;
  width: 1200px;
  margin: 0 auto;
  background-color: teal;
}

.event_main{
  width: 100%;
  height: 1000px;
}
  
  </style>
 </head>
 <body>
 <nav class="navbar navbar-default bg-warning">
    <div class="navbar-header nav_main">
      <a class="main_title"><b>신작.이벤트안내</b></a> 
     <a class="navbar-brand-success main_menu" href="Main">메인 가기 |</a> 
      <a class="navbar-brand-success main_menu" href="bookfind">자료 검색 |</a> 
      <a class="navbar-brand-success main_menu" href="Mainboard">게시판 가기 |</a> 
      <a class="navbar-brand-success main_menu" href="direction">방문 안내 |</a>
        <c:if test="${login =='success'}">
       <h1 id="lout">${sessionScope.userName}(${sessionScope.userId})님 환영합니다.</h1>
        </c:if>
    </div>
     <c:if test="${login !='success'}">
    <a class="navbar-brand-success main_submenu" href="New">회원가입 가기</a>
    </c:if>
    <c:if test="${login =='success'}">
    <a class="navbar-brand-success main_submenu" id="logOutBnt">로그아웃 하기</a>
    </c:if>
  </nav>
  
  <div id="wapper">
    
    <nav class="nav_slide">
      <div class="prenext" style="display: none;">
        <a class="prev" href="javascript:void(0);" title="이전 메인비주얼보기"></a>
        <a class="next" href="javascript:void(0);" title="다음 메인비주얼보기"></a>
      </div>
      <dl class="img_slide">
        <dd style="display: block;">
          <img class="Main_img" alt=""
            src="http://image2.megabox.co.kr//mop/frontbanner/2019/D1/8FE2D1-1795-4801-95FB-F1303E0991EB.jpg" data-toggle="modal" data-target="#exampleModal">
        </dd>
        <dd style="display: block;">
          <img class="Main_img" alt=""
            src="http://image2.megabox.co.kr//mop/frontbanner/2019/DD/D95A67-F12B-4C4F-8D07-03AF3A4ED72E.jpg">
        </dd>
        <dd style="display: block;">
          <img class="Main_img" alt="날씨의아이"
            src="http://image2.megabox.co.kr//mop/frontbanner/2019/D7/C9AB75-C206-4EAC-B85A-8FA5D7E9A11B.jpg" data-toggle="modal" data-target="#exampleModal">
        </dd>
      </dl>
    </nav>
    <!--  --------------------------------------------------------------------------------------------------------- -->
    
    
        <!-- ----------------------------- 모달 부분  ---------------------------------------------------- -->


<!-- Modal -->
<div class="modal fade bd-example-modal-xl" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modalstyle" role="document">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    <div class="modal-content">
      <div class="modal-header">
      	<div class="title clearfix">
          <h2><span>날씨의 아이</span></h2>
          <p>Weathering With You , </p>
        </div>
        <div class="left_wrap">
          <img class="poster" src="resources/images/book.jpg" alt="날씨의 아이">
            <!-- 소셜버튼 -->
            <div class="social_btn_wrap">
              <div>
                <div class="fb-share-button fb_iframe_widget" data-href="http://www.megabox.co.kr/?menuId=movie&amp;p=movie_detail&amp;p2=015807" data-type="button" data-title="새 창 열림" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=356285641381572&amp;container_width=0&amp;href=http%3A%2F%2Fwww.megabox.co.kr%2F%3FmenuId%3Dmovie%26p%3Dmovie_detail%26p2%3D015807&amp;locale=en_US&amp;sdk=joey&amp;type=button"><span style="vertical-align: bottom; width: 59px; height: 20px;"><iframe name="f970d898c7a2c8" width="1000px" height="1000px" title="fb:share_button Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v2.0/plugins/share_button.php?app_id=356285641381572&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D44%23cb%3Df24ee093816b964%26domain%3Dwww.megabox.co.kr%26origin%3Dhttp%253A%252F%252Fwww.megabox.co.kr%252Ff28322d8c1d9914%26relation%3Dparent.parent&amp;container_width=0&amp;href=http%3A%2F%2Fwww.megabox.co.kr%2F%3FmenuId%3Dmovie%26p%3Dmovie_detail%26p2%3D015807&amp;locale=en_US&amp;sdk=joey&amp;type=button" style="border: none; visibility: visible; width: 59px; height: 20px;" class=""></iframe></span></div>
              </div>
              <div>
                <iframe id="twitter-widget-0" scrolling="no" frameborder="0" allowtransparency="true" class="twitter-share-button twitter-share-button-rendered twitter-tweet-button" style="position: static; visibility: visible; width: 60px; height: 20px;" title="Twitter Tweet Button" src="https://platform.twitter.com/widgets/tweet_button.2d991e3dfc9abb2549972ce8b64c5d85.en.html#dnt=false&amp;id=twitter-widget-0&amp;lang=en&amp;original_referer=http%3A%2F%2Fwww.megabox.co.kr%2F%3Fshow%3Ddetail%26rtnShowMovieCode%3D015807&amp;size=m&amp;text=%EC%98%81%ED%99%94%EC%83%81%EC%84%B8(%EB%82%A0%EC%94%A8%EC%9D%98%20%EC%95%84%EC%9D%B4)&amp;time=1572507909903&amp;type=share&amp;url=http%3A%2F%2Fwww.megabox.co.kr%2F%3Fshow%3Ddetail%26rtnShowMovieCode%3D015807"></iframe>
                  <script>
                !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
                </script>
             </div>
           </div>
        
      
          <hr>
          
         <div class="rating">
         	<span class="small_star">
            <span class="fill" style="width:78.61702127659%;"><span class="blind">별점4 기대해도 좋아요!</span></span> <!-- 별 그래프 -->
            </span>
            <p class="left_p">
            <span id="starMemberCount_015807">188</span><span>명 참여</span>
            <strong id="averageScoreDetail_015807">7.9</strong>
            <span class="divider"></span>
            </p>
          <div class="my_rate">
              <span>내 평점</span>
              <span id="movieDetailStarScore" style="min-width: 119px; cursor: pointer; width: 119px;"></span>
              <span id="movieDetailStarScoreTxt">평점을 입력해주세요</span>
          </div>
         </div>
            <script type="text/javascript">
        $(document).ready(function() {
          $('#movieDetailStarScore').raty({
            half      : true,
            size      : 32,
            path : "resources/images/img",
            starOff   : 'star_mid_off.png',
            starHalf  : 'star_mid_harf.png', 
            starOn    : 'star_mid_on.png',
            targetType  : 'hint',
            hintList    : ['별점1 괜히봤어요', '별점2 기대하진 말아요', '별점3 무난했어요', '별점4 기대해도 좋아요!', '별점5 너무 멋진 영화였어요!'],
            halfShow  : false,
            cancelHint: 'none',
            target:     '#movieDetailStarScoreTxt',
            score   : (0 / 2),
            click: function(score){
            	$("#movieDetailStarScoreTxt").text(score);
            }  
        });
          $("#movieDetailStarScore").click(function(){
          	  $("#movieDetailStarScoreTxt").text(target);
            });
        $("#movieDetailStarScore").width("119");
        });
        </script>
        </div>
      
    </div>
     <div class="modal-body">
        <div class="sys">
                                줄거리 <br>
                      “이제 비는 그치고, 우리의 세상이 빛나기 시작할 거야”<br>
                      <br>
                      비가 그치지 않던 어느 여름날,<br>
                      가출 소년 ‘호다카’는 수상한 잡지사에 취직하게 되고<br>
                      비밀스러운 소녀 ‘히나’를 우연히 만난다.<br>
                      <br>
                      “지금부터 하늘이 맑아질 거야”<br>
                      <br>
                      그녀의 기도에 거짓말 같이 빗줄기는 멈추고,<br>
                      사람들의 얼굴에 환한 빛이 내려온다.<br>
                      <br>
                      “신기해, 날씨 하나에 사람들의 감정이 이렇게나 움직이다니”<br>
                      <br>
                      하지만, 맑음 뒤 흐림이 찾아오듯<br>
                      두 사람은 엄청난 세계의 비밀을 마주하게 되는데…<br>
                      <br>
                      흐리기만 했던 세상이 빛나기 시작했고, 그 끝에는 네가 있었다.<br>
                          </div>    
                      </div>
        <hr>
        <div class="sm_mv_bg" style="background-image: url(http://image2.megabox.co.kr//mop/frontbanner/2019/D7/C9AB75-C206-4EAC-B85A-8FA5D7E9A11B.jpg);">
                    <span class="blind">날씨의 아이 Weathering With You 지금부터 하늘이 맑아질 거야</span>

                    <figure class="mv_view">
                      <div class="mv_full">
                          <video controls="controls" width="100%;" height="100%;" poster="http://image2.megabox.co.kr//mop/frontbanner/2019/D7/C9AB75-C206-4EAC-B85A-8FA5D7E9A11B.jpg" preload="none">
                              <source src="http://m.mvod.megabox.co.kr/encodeFile/3550/2019/06/10/0c538a4992f6184e4327647ac76b8e9e_I.mp4" type="video/mp4" />
                          </video>
                      </div>
                    </figure>
                </div>
        <!--  예매 전용 모달 -->
       <div class="modal fade Modal_booking" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
       <div class="modal-dialog modal-sm">
          <div class="modal-content">
           <p>날짜를 선택 해주세요: <input type="text" id="datepicker"></p>
          </div>
          </div>
        </div>
        <!--  예매전용 스크립트 -->
        <script>
			$(function() {
			$( "#datepicker" ).datepicker(
			{
        		dateFormat:    'yymmdd'
			}
 
			);
			});
		</script>
        

          <hr>
      <div class="modal-footer">
             댓글넣을 예정~
      </div>
      <hr>
   </div> 
        <button type="button" class="btn btn-secondary modalout" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
  </div>
</div>
        
    <div>
    	<table class="event_main" border="solid 1px;">
    		<tr><h1>각종 이벤트페이지</h1>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		</tr>
    	</table>
                        <a href="javascript:popupOpen();">홈으로가기</a>
    </div>
    <a href="#" onclick="window.scrollTo(0,0);return false;"><span class="toptop">젤위로 가자</span></a>
    </div>
  
</body>

</html>
