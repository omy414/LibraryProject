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
    
    <script>
 
    $(document).ready(function() {
    	listReply2();
        $("#lout").click(function(){
  			location.href='myinfo';
  		});
      	
    	  $("#logOutBnt").click(function(){
    			if(confirm("로그아웃 하시겠습니까?")){
    				location.href='logout';
    			}
    		});
      });
    
    function listReply2(){
    	$.ajax({
    		type: "get",
    		url: "http://www.nl.go.kr/app/nl/search/openApi/search.jsp?key=52958c5a4003d7a9414cd8823fe9a13a&dan=on&topF1=title_author&kwd=히가시노",
    		success: function(result){
    			var output = "<table>";
    			for(var i in result){
    				output += "<tr>";
    				output += "<td>"+result[i].author;
    				output += "("+result[i].regdate+")<br>";
    				output += result[i].publisher+"<br>";
    				output += "---------------------------------------------------------------------------------------------------</td>"
    				output += "<tr>";
    			}

    			output += "</table>";
    			$("#listReply").html(output);
    		}				
    		
    	})
    }
    
    
</script>
    <style>
   body{
    background-color: #FDFCF0;
    padding: 0px;
    margin: 0px;
   }
   .main_menu{
  margin-left: 20px;
  letter-spacing: 5px;
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

.formcon{
  margin-top: 20px;
 margin-left: 35%;
}

.formcon_key {
  width: 400px;
  float: left;
}

.formcon_sub {
  float: left;
}
.sub_menu{
  width:1200px;
  background-color: #FDFCF0;
  margin: 0 auto;
  margin-top: 70px;
  padding: 20px;
  border: 1px solid;
}
#lout{
  font-size: 30px;
  color: #4E248A;
  cursor: pointer;
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
.search{
  margin: 0 auto;
}
ul{
   list-style:none;
}
.img{
  float: left;
  width: 82px;
}
dl{
  font-size: 12px;
}
.booksearch{
  float: left;
  margin-top: 5px;
  margin-left: 15%;
  font-size: 30px;
  position: absolute;
  color: fuchsia;
}
  
  </style>
 </head>
 <body>
 <nav class="navbar navbar-default bg-warning">
    <div class="navbar-header nav_main">
      <a class="main_title"><b>자료 검색</b></a> 
      <a class="navbar-brand-success main_menu" href="Main">메인 가기 |</a> 
      <a class="navbar-brand-success main_menu" href="newevent">신작.이벤트 |</a> 
      <a class="navbar-brand-success main_menu" href="Mainboard">게시판 가기 |</a> 
      <a class="navbar-brand-success main_menu" href="direction">방문 안내 |</a> 
      <a class="navbar-brand-success main_menu" href="test">테스트 |</a> 
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
  <div class="formcon">
      <form name="form" action="bookfind">
        <input name="keyword" class="form-control formcon_key" type="text"> 
        <input type="submit" class="btn btn-primary formcon_sub" value="검색">
      </form>  
    </div>
   <div class="booksearch">
    책검색
   </div>
   <div class="sub_menu">
    <ul class="search">
   <c:if test="${bookList == null}">
        <li>
            <div width="100%" bgcolor="pink" align="center">원하는 책을 검색해주세요~</div>
        </li>
   </c:if>
   <c:if test="${bookList != null}">
        <li>
            <div colspan="7" width="100%" bgcolor="pink"></div>
        </li>
   </c:if>
        <c:forEach items="${bookList}" var ="b">
            <li style="position:relative;">
                <div class="img"><img src="${b.image}"></div>
            <dl>
                <dt><a href="${b.link}">${b.title}</a></dt>
                <dd >글쓴이 : ${b.author} | 출판사 : ${b.publisher } | 발행일 : ${b.pubdate } |</dd>
                <dd >가격 : ${b.price } | 할인가 : ${b.discount }</dd>
                <dd >책소개 : ${b.description}</dd>
            </dl>
            </li>
            <li>
                <br>
            </li>
        </c:forEach>
    </ul>
   </div>
  
</body>

</html>
