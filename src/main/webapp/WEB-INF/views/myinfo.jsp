<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
 <head>
 <meta charset="UTF-8">
 <title>내 정보</title>
  <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.js"></script>
    
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
    <style>
  .nav_main {
  color: crimson;
  font-size: 20px;
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

.main_title {
  font-size: 40px;
}
#logOutBnt{
  cursor: pointer;
}

a:hover {
  text-decoration: none;
}
.main_view{
  width: 1200px;
  height: 300px;
  background-color: red;
  margin: 0 auto;
  font-size: 50px;
  
}
.sub_view{
  width: 1200px;
  height: 500px;
  margin: 0 auto;
  font-size: 50px;
}
.sub_view1{
  float: left;
  width: 700px;
  height: 500px;
  background-color: blue;
}
.sub_view2{
float: left;
  width: 500px;
  height: 500px;
  background-color: lime;

}
.subsub_view{
margin: 0 auto;
  width: 1200px;
  height: 300px;
  background-color: olive;
  font-size: 50px;
}


  
  </style>
 </head>
 <body>
 <nav class="navbar navbar-default bg-warning">
    <div class="navbar-header nav_main">
      <a class="main_title"><b>내 정보 보기</b></a> 
     <a class="navbar-brand-success main_menu" href="Main">메인 가기 |</a>
     <a class="navbar-brand-success main_menu" href="bookfind">자료 검색 |</a> 
      <a class="navbar-brand-success main_menu" href="newevent">신작.이벤트 |</a> 
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
  <div class="main_view">
    멤버쉽 포인트
    기본 개인정보
    도서 대출 현황 
  </div>
  
  <div class="sub_view">
    <div class="sub_view1">
      내가 남긴 한줄 도서 평
    </div>
    <div class="sub_view2">
      위시 리스트
    </div>
  </div>
  <div class="subsub_view">
    이벤트 
    문의 내역 등등
  </div>
  
  
</body>

</html>
