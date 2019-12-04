<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
  <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.js"></script>
    
    <script>
  $(document).ready(function() {
	  $("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "${path}/delete";
				document.form1.submit();
			}
		});
  	
	  
    $("#btnSave").click(function() {
      var title = $("#title").val();
      var content = $("#content").val();
      var writer = $("userId").val();

      if (title == "") {
        alert("제목을 입력하세요");
        document.form1.title.focus();
        return;
      }
      if (content == "") {
        alert("내용을 입력하세요");
        document.form1.content.focus();
        return;
      }
      
      document.form1.action="${path}/update"
      document.form1.submit();

    });
    
    $("#btnreset").click(function(){
      location.href="Mainboard";
    })
  });
</script>
    <style>
  .nav_main {
  color: crimson;
  font-size: 20px;
}

.main_title {
  font-size: 30px;
}

a:hover {
  text-decoration: none;
}

.Rbtnmargin {
  margin-left: 150px;
} 
#notice{
  margin: 0 auto;
  border: 3px solid #dddddd;
  width: 800px;
  text-align: center;

}

#title{
  width: 100%;
}
#content{
  width: 100%;
}
#writer{
  float: left;
}
  
  </style>
 </head>
 <body>
 <nav class="navbar navbar-default bg-warning">
    <div class="navbar-header nav_main">
      <a class="main_title"><b>자료 검색</b></a> 
      <a class="navbar-brand-success main_menu" href="Main">메인 가기 |</a> 
      <a class="navbar-brand-success main_menu" href="bookfind">자료 검색 |</a> 
      <a class="navbar-brand-success main_menu" href="newevent">신작.이벤트 |</a> 
      <a class="navbar-brand-success main_menu" href="Mainboard">게시판 가기 |</a> 
      <a class="navbar-brand-success main_menu" href="direction">방문 안내 |</a> 
        <c:if test="${login =='success'}">
       <h1 id="lout">${sessionScope.userName}(${sessionScope.userId})님 환영합니다.</h1>
        </c:if>
    </div>
  </nav>
  <div id="notice">
      <h2>게시글 수정</h2>
    <form name="form1" method="post" action="${path}/insert">
      <div>
          <input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력하세요">
      </div>
      <div>
           <textarea name="content" id="content" rows="8" cols="180" placeholder="내용을 입력해주세요">${dto.content}</textarea>
      </div>
      <div>
            <input name="userId" id="writer" value="${dto.userId}" placeholder="이름을 입력해주세요">
      </div>
      <div class="form-group" id="filefile">
        <label for="exampleFormControlFile1"></label>
        <input type="file" class="form-control-file" id="exampleFormControlFile1">
      </div>
      <div style="width: 650px; text-align: center;">
      <input type="hidden" name="bno" value="${dto.bno}">
        <button type="button" class="btn btn-primary Rbtnmargin"
          id="btnSave">확인</button>
        <button type="reset" class="btn btn-danger" id="btnreset">취소</button>
	   <button type="button" class="btn btn-primary"  OnClick="location.href='Mainboard'">목록</button>
	  <button type="button" class="btn btn-primary" id="btnDelete" >삭제</button>
      </div>
    </form>
  </div>
</body>

</html>
