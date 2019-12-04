<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<title>국립 중앙 도서관</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<link href='resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='resources/fullcalendar/daygrid/main.css' rel='stylesheet' />

<script src='resources/fullcalendar/core/main.js'></script>
<script src='resources/fullcalendar/daygrid/main.js'></script>

<!-- <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script type="text/javascript" src="resources/js/bootstrap.js"></script> -->
<%
	Object userId;
%>
<%
	userId = session.getAttribute("userId");
%>

<script>
        var idc =' ';
        var namec = ' ';
       $(function(){

        $(".sub").click(function(){
            location.href='New';
        })
    });
       
      
    

        $(function () {
            /* $('#logOutBnt').click(function () {
                if (onoff)
                    document.getElementById("onoff").style.display = "";
                document.getElementById("logout").style.display = "none";
            }); */

            $("#main_gnb>div#main_table>ul>li").mouseenter(function(){
                $("#front").css('z-index',"-10");
                $("#main_gnb>div#main_table>ul>li#"+this.id+">div.sub"+this.id).css("background-color", "lightgoldenrodyellow");
            })
            $("#main_gnb>div#main_table>ul>li").mouseleave(function(){
                 $("#front").css('z-index',"10");
                $("#main_gnb>div#main_table>ul>li#"+this.id+">div.sub"+this.id).css("background-color", "white");
            })
            	
             $("#main_menu01").click(function(){
               location.href='libraryInfo';
            }) 		
            	
             $("#main_menu02").click(function(){
                location.href='bookfind';
            })
            
            $("#main_menu03").click(function(){
                location.href='newevent';
            })
            
            $("#main_menu04").click(function(){
                location.href='Mainboard';
            })
            
             $("#main_menu05").click(function(){
                location.href='direction';
            })
            
            
        });
        
        $(document).ready(function() {
    		$("#login").click(function() {
    			var userId = $("#userId").val();
    			var password = $("#password").val();
				
    			document.form2.submit();

    		});
    		
    		$("#login").keydown(function() {
    		if(event.keyCode == '13'){
    			var userId = $("#userId").val();
    			var password = $("#password").val();
				
    			document.form2.submit();
    		}
    	  });  		
    		
    });
        
        $(document).ready(function() {
          $("#myInfo").click(function(){
    			location.href='myinfo';
    		});
        	
      	  $("#logOutBnt").click(function(){
      			if(confirm("로그아웃 하시겠습니까?")){
      				location.href='logout';
      			}
      		});
        });
        
        function popupOpen(){
        	var popUrl = "direction";
        	var popOption= "width=370, height360, resizable=no";
        		window.open(popUrl,"",popOption);
        }
      	 
    
        
        <%-- function Info(){
            alert("아이디 ="<%=userId%>+"\n이름 ="+namec);
        }; --%>
  
        //달력 부분 --------------------------------------
        
        document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid' ],
			header: {
			    left: 'prev,next',
			    center: 'title',
			    right: 'today'
			  },
			  editable: true,
			  droppable: true, // this allows things to be dropped onto the calendar
			  drop: function(info) {
			    // is the "remove after drop" checkbox checked?
			    if (checkbox.checked) {
			      // if so, remove the element from the "Draggable Events" list
			      info.draggedEl.parentNode.removeChild(info.draggedEl);
			    }
			  },
			  locale: 'ko',
				  events: [
				        {
				            title : 'evt1',
				            start : '2019-12-03'
				        },
				        {
				            title    :    'evt2',
				            start    :    '2019-12-14',
				            end    :    '2019-12-20'
				        },
				        {
				            title    :    'evt3',
				            start    :    '2019-12-25T12:30:00',
				            allDay    :    false
				        }
				    ]
		});

		calendar.render();
	});


    </script>

<style>
a {
  color: #222;
  text-decoration: none;
} /*링크 초기화*/
a:hover {
  font-weight: bold;
  color: rgb(102, 28, 241);
}

body {
  min-width: 1130px;
  max-width: 1130px;
  margin: 0 auto;
}

#main_header {
  border-bottom: solid 2px red;
  text-align: center;
}

#locale_switch {
  float: right;
  margin-top: -110px;
}

#main_gnb>div#main_table {
  text-align: center;
  position: relative;
  cursor: pointer;
  margin-top: -15px;
  height: 450px;
  background-color: white;
}

.sub {
  margin-top: -24px;
  float: right;
  color: red;
}

.sublog {
  color: blue;
}

#main_table>ul {
  border-bottom: solid 3px blue;
  height: 60px;
  list-style: none;
}

#main_table>ul>li>div>ul>li {
  list-style: none;
  margin-left: -50px;
}

#main_gnb>div#main_table>ul>li {
  float: left;
  width: 180px;
  line-height: 2em;
  min-height: 380px;
  margin-top: -5px;
  max-height: 380px;
}

#main_gnb>div#main_table>ul>li>div {
  min-height: 380px;
  max-height: 380px;
}

.main_article {
  float: left;
  width: 90%;
  max-width: 1600px;
  height: 500px;
}

.main_aside {
  float: right;
  background-color: cornsilk;
  width: 9.6%;
  height: 200px;
  border: solid 2px;
  max-height: 200px;
  /* border-left-style:initial; */
}

#main_footer {
  margin-top: 10px;
  text-align:center;
  width: 1130px;
  background-color: teal;
  position: absolute;
}


#main_section {
  width: 100%;
  max-width: 1800px;
  height: 500px;
  overflow: hidden;
}

#front {
  position: absolute;
  width: 1130px;
  height: 380px;
  z-index: 10;
  margin-top: -380px;
}

.log {
  float: left;
  position: absolute;
  width: 25%;
  height: 15%;
  background-color: beige;
  max-width: 170px;
  max-height: 90px;
  min-height: 90px;
  overflow: hidden;
}

#lout {
  margin-top: -3px;
  font-size: 15px;
}

h1 {
  font-size: 18px;
  font-style: italic;
}

#logOutBnt {
  border: 1px solid blue;
}

#newBook {
  background-color: lavender;
}

#newBook_1 {
  margin: 0 auto;
  border: solid 2px;
  float: left;
  overflow: hidden;
  width: 39.5%;
  height: 200px;
  font-size: 10pt;
}

#newBook_1>div {
  float: left;
  width: 50%;
  color: red;
}

#newBook_1>div>ul.last {
  width: 50%;
  color: blue;
}

#newAthor {
  margin: 0 auto;
  border: solid 2px;
  border-left-style: initial;
  float: left;
  overflow: hidden;
  width: 40%;
  height: 40%;
  background-color: aliceblue;
  list-style: none;
}

#newAthor>ul>li {
  list-style: none;
  max-height: 170px;
}

#newAthor>ul>li>img {
  width: 120px;
  height: 120px;
  list-style: none;
}
/* #newAthor>ul>li>img>b{
            text-align: center;
            position: absolute;
            
        } */
.newAthor_img01>p {
  width: auto;
  position: relative;
  text-align: left;
  top: -130px;
  left: 130px;
}

.newAthor_img01>dl {
  width: auto;
  position: relative;
  text-align: left;
  top: -150px;
  left: 130px;
}

.newAthor_img01>dl>dd {
  width: auto;
  position: relative;
  text-align: left;
  top: -20px;
  left: 20px;
}

.newAthor_img02 {
  width: auto;
}

#banner1 {
  margin-top: 110px;
  width: auto;
  height: 120px;
  max-width: 200px;
  max-height: 100px;
}

#banner2 {
  width: auto;
  height: 115px;
  max-width: 200px;
}

#banner3 {
  width: auto;
  height: auto;
  max-width: 200px;
}

#banner4 {
  width: auto;
  height: auto;
  max-width: 200px;
}

#notice {
  margin: 0 auto;
  border-top-style: initial;
  border: solid 2px;
  float: left;
  left: 20%;
  top: 100%;
  width: 57%;
  height: 295px;
}

#notice input {
  display: none;
}

#notice>div {
  display: none;
  padding: 20px 0 0;
  border-top: 1px solid #ddd;
  height: 225px;
  background-color: #FDFCF0;
}

label {
  display: inline-block;
  margin: 0 0 -1px;
  padding: 15px 25px;
  font-weight: 600;
  text-align: center;
  color: #bbb;
  border: 1px solid transparent;
}

label:hover {
  color: #2e9cdf;
  cursor: pointer;
}

#notice input:checked+label {
  color: #555;
  border: 1px solid #ddd;
  border-top: 2px solid #2e9cdf;
  border-bottom: 1px solid #ffffff;
  background-color: #FDFCF0;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~
  #content3, #tab4:checked ~ #content4 {
  display: block;
}

#calendar {
  position: relative;
  top: -295px;
  float: right;
  width: 345px;
  height: 295px;
  font-size: 12px;
}

.copyright {
text-align: center;
  margin: 80px 0px 0px 0px;
}

.aside {
  float: left;
}
</style>
</head>

<body>
	<div class="main">
		<header id="main_header">
			<img id="dic" src="resources/images/국립중앙도서관.png">
	</div>
	<div>
		<select id="locale_switch" name="언어선택">
			<option value="">언어선택</option>
			<option value="한국어">한국어</option>
			<option value="영어">영어</option>
			<option value="일본어">일본어</option>
			<option value="중국어">중국어</option>
		</select>
	</div>
	<nav id="main_gnb">
		<div id="main_table">
			<ul>
				<li id="main_menu01"><span><h2>인사말</h2></span>
					<div class="submain_menu01">
						<ul>
							<li><a href="#">도서관 소개</a></li>
							<li><a href="#">도서관 연혁</a></li>
							<li><a href="#">역대 도서관장</a></li>
							<li><a href="#">도서관장의 인사</a></li>
							<li><a href="#">조직도</a></li>
						</ul>
					</div></li>
				<li id="main_menu02"><span><h2>자료검색</h2></span>
					<div class="submain_menu02">
						<ul>
							<li><a href="#">소장 자료</a></li>
							<li><a href="#">정부 간행물</a></li>
							<li><a href="#">디지털화 자료</a></li>
							<li><a href="#">국가자료종합목록</a></li>
							<li><a href="#">한국고전적종합목록</a></li>
							<li><a href="#">해외 한국관련기록물</a></li>
							<li><a href="#">Web DB</a></li>
							<li><a href="#">연계 자료</a></li>
							<li><a href="#">신착 자료</a></li>
						</ul>
					</div></li>
				<li id="main_menu03"><span><h2>신작.이벤트안내</h2></span>
					<div class="submain_menu03">
						<ul>
							<li><a href="#">신작안내</a></li>
							<li><a href="#">이벤트안내</a></li>
							<li><a href="#">사회 봉사</a></li>
							<li><a href="#">견학</a></li>
							<li><a href="#">자료당일 열람</a></li>
							<li><a href="#">비치희망도서</a></li>
							<li><a href="#">연구정보서비스</a></li>
						</ul>
					</div></li>
				<li id="main_menu04"><span><h2>소통.참여</h2></span>
					<div class="submain_menu04">
						<ul>
							<li><a href="#">전시행사</a></li>
							<li><a href="#">도서관 소식</a></li>
							<li><a href="#">발간자료</a></li>
							<li><a href="#">정보공개</a></li>
							<li><a href="#">설문조사</a></li>
							<li><a href="#">자주하는질문</a></li>
							<li><a href="#">국민신문고</a></li>
							<li><a href="#">오류신고</a></li>
						</ul>
					</div></li>
				<li id="main_menu05"><span><h2>방문.이용</h2></span>
					<div class="submain_menu05">
						<ul>
							<li><a href="#">본관이용시간</a></li>
							<li><a href="#">본관자료실</a></li>
							<li><a href="#">찾아오시는길</a></li>
							<li><a href="#">편의시설</a></li>
							<li><a href="#">모바일서비스</a></li>
							<li><a href="#">관내사이트</a></li>
						</ul>
					</div></li>
				<li id="main_menu06"><span><h2>주요서비스</h2></span>
					<div class="submain_menu06">
						<ul>
							<li><a href="#">국가 전자도서관</a></li>
							<li><a href="#">도서관 사진</a></li>
							<li><a href="#">시설 자료현황</a></li>
							<li><a href="#">도서관 업무</a></li>
							<li><a href="#">도서관 협력망</a></li>
							<li><a href="#">찾아오시는길</a></li>
						</ul>
					</div></li>
		</div>
		<img id="front" src="resources/images/도서관전경.png">
	</nav>
	</header>
	<div id="content">
		<section id="main_section">
			<article class="main_article">
				<div class="aside">
					<fieldset class="log">

						<c:if test="${login == null}">
							<div id="onoff" style="display: block">
								<legend>로그인</legend>
								<form name="frm2" method=post action="${path}/login">
									<input type="text" placeholder="아이디" name="userId" id="userId"> <input type="password" placeholder="비밀번호" name="userPassword" id="userPassword"> <input class="sublog" type="submit" id="login" name="login" value="로그인">
								</form>
								<button class="sub">회원가입</button>
						</c:if>
						<c:if test="${login == 'error'}">
							<%
								out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.');history.back();</script>");
									session.invalidate();
							%>

							<div id="onoff" style="display: block">
								<legend>로그인</legend>
								<form name="frm2" method=post action="${path}/login">
									<input type="text" placeholder="아이디" name="userId" id="userId"> <input type="password" placeholder="비밀번호" name="userPassword" id="userPassword"> <input class="sublog" type="submit" id="login" name="login" value="로그인">
								</form>
								<button class="sub">회원가입</button>
								<!-- <button id="logout" style="display: none;">로그아웃</button> -->
						</c:if>

						<c:if test="${login =='success'}">
							<div id="logout" style="display: block">
								<h1 id="lout">${sessionScope.userName}<br>(${sessionScope.userId})님 <br>환영합니다.
								</h1>
								<input id="myInfo" type="button" value="내정보보기"> <input id="logOutBnt" type="button" value="로그아웃">
						</c:if>
				</div>
				</fieldset>

				<div>
					<img id="banner1" src="resources/images/책광고.jpg">
				</div>
				<div>
					<img id="banner2" src="resources/images/책광고2.jpg">
				</div>
				<div>
					<img id="banner3" src="resources/images/책광고3.jpg">
				</div>
				<div>
					<img id="banner4" src="resources/images/책광고.jpg">
				</div>
	</div>
	<div id="newBook">
		<div id="newBook_1">
			<div>
				<ul class="best_book">
					<h2>베스트셀러</h2>
					<li><a href="#">단위 테스트의 모든것</a></li>
					<li><a href="#">JAVA Fundamental</a></li>
					<li><a href="#">JAVA프로그래밍</a></li>
					<li><a href="#">JSP쇼핑몰구축기초</a></li>
					<li><a href="#">오라클11g와함께하는SQL</a></li>
					<li><a href="#">HTML+css3</a></li>
				</ul>
			</div>
			<div>
				<ul class="last">
					<h2>신간</h2>
					<li><a href="#">넷플릭스의 시대</a></li>
					<li><a href="#">Go! 독학 독일어</a></li>
					<li><a href="#">슬픈 쥐의 윤회</a></li>
					<li><a href="#">여름밤에</a></li>
					<li><a href="#">스타의 서재</a></li>
					<li><a href="#">양들의 침묵</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="newAthor">
		<strong>이달의 저자</strong>
		<ul>
			<li class="newAthor_img01"><img src="resources/images/juhomin.png">
				<dl>
					<dt>
						<b>작가: </b>
					</dt>
					<dd>주호민</dd>
					<dt>
						<b>대표작: </b>
					</dt>
					<dd>
						방탕후루<br> 신과함께<br> 무한동력<br> 아시아신화여행<br> 웹툰의시대
					</dd>
				</dl></li>
			<li class="newAthor_img02"><img src="resources/images/kimjinmyoung.jpg"></li>
			<li class="newAthor_img03"><img src="resources/images/조석.png"></li>
			<li class="newAthor_img04"><img src="resources/images/kiyom.jpg"></li>
			<li class="newAthor_img05"><img src="resources/images/ekuni.jpg"></li>
			<li class="newAthor_img06"><img src="resources/images/higashino.jpg"></li>
			<li class="newAthor_img07"><img src="resources/images/murakami.jpg"></li>
			<li class="newAthor_img08"><img src="resources/images/konan.jpg"></li>
			<li class="newAthor_img09"><img src="resources/images/malnyun.jpg">작가: 이말년 대표작:ㅁㄴㅇ</li>
		</ul>
	</div>

	<div id="notice">
		<input id="tab1" type="radio" name="tabs" checked>
		<!--디폴트 메뉴-->
		<label for="tab1">공지공고</label> <input id="tab2" type="radio" name="tabs"> <label for="tab2">보도자료</label> <input id="tab3" type="radio" name="tabs"> <label for="tab3">인재채용</label> <input id="tab4" type="radio" name="tabs"> <label for="tab4">포토뉴스</label>

		<div id="content1">
			<p>tab menu1의 내용</p>
		</div>

		<div id="content2">
			<p>tab menu2의 내용</p>
		</div>

		<div id="content3">
			<p>tab menu3의 내용</p>
		</div>

		<div id="content4">
			<p>tab menu4의 내용</p>
		</div>
	</div>

	</article>
	<aside class="main_aside">
		<div>
			<a href="javascript:popupOpen();">홈으로가기</a>
		</div>
	</aside>
	</section>
	<div id='calendar'></div>
	</div>

	<footer id="main_footer">
		개인정보보호 및 주소 등
		<p class="copyright">
			"위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며 국립중앙도서관의 입장과 다를 수 있습니다."<br> "Copyright (c)" <a href="Main">www.국립중앙도서관.com</a> " All right reserved."
		</p>
	</footer>
</body>
</html>