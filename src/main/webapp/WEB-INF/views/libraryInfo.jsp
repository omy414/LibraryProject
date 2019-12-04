<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</script>
<style type="text/css">
body {
  background-color: #FDFCF0;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
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


p {
  margin: 0 0 20px;
  line-height: 1.5;
}

.main {
  min-width: 1200px;
  max-width: 1200px;
  padding: 50px;
  margin: 0 auto;
  background: #ffffff;
}

section {
  display: none;
  padding: 20px 0 0;
  border-top: 1px solid #ddd;
}

/*라디오버튼 숨김*/
input {
  display: none;
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

/*input 클릭시, label 스타일*/
input:checked+label {
  color: #555;
  border: 1px solid #ddd;
  border-top: 2px solid #2e9cdf;
  border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~
  #content3, #tab4:checked ~ #content4 {
  display: block;
}
</style>

</head>
<body>

	<nav class="navbar navbar-default bg-warning">
    <div class="navbar-header nav_main">
      <a class="main_title"><b>인사말</b></a> 
     <a class="navbar-brand-success main_menu" href="Main">메인 가기 |</a> 
      <a class="navbar-brand-success main_menu" href="bookfind">자료 검색 |</a>
      <a class="navbar-brand-success main_menu" href="newevent">신작 이벤트 |</a> 
      <a class="navbar-brand-success main_menu" href="Mainboard">게시판 가기 |</a> 
      <a class="navbar-brand-success main_menu" href="direction">방문 안내 |</a>
      <a class="navbar-brand-success main_menu" href="test3">테스트 |</a>
      <a class="navbar-brand-success main_menu" href="test4">테스트2 |</a>  
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

	<div class="main">
		<input id="tab1" type="radio" name="tabs" checked>
		<!--디폴트 메뉴-->
		<label for="tab1">도서관 연혁</label> 
		<input id="tab2" type="radio" name="tabs"> <label for="tab2">도서관 시설안내</label> 
		<input id="tab3" type="radio" name="tabs"> <label for="tab3">도서관장의 말</label> 
		<input id="tab4" type="radio" name="tabs"> <label for="tab4">조직도</label>

		<section id="content1">
			<p>tab menu1의 내용</p>
		</section>

		<section id="content2">
			<p>tab menu2의 내용</p>
		</section>

		<section id="content3">
			<p>tab menu3의 내용</p>
		</section>

		<section id="content4">
			<p>tab menu4의 내용</p>
		</section>
	</div>
</body>
</html>