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
    $(document).ready(function(){
    	$("#replylogin").click(function(){
        	if(confirm("로그인페이지로 가시겠습니까?")){
    				location.href='Main';
    			}
        });
    	
    	
    	listReply2(); //댓글
    $("#btnComments").click(function(){
    	var reply_content = $("#reply_content").val();
    	var userId = "${sessionScope.userId}";
    	var bno="${dto.bno}"
    	var param="reply_content="+reply_content+"&bno="+bno+"&userId="+userId;
    	
    	$.ajax({
    		type: "post",
    		url: "${path}/reply/insertReply",
    		data: param,
    		success: function(){
    			alert("댓글 등록 됐어~");
    			listReply2();
    			$("#reply_content").val("");
    		}
    	});
    });
    
  	
    $("#btnUpdate").click(function(){
      location.href="change";
    });
    
  });
    	
    
    function listReply(){
    	$.ajax({
    		type: "get",
    		url: "${path}/reply/list?bno=${dto.bno}",
    		success: function(result){
    			$("#listReply").html(result);
    		}
    	});	
    }
    function listReply2(){
    	$.ajax({
    		type: "get",
    		url: "${path}/reply/listreplyJson?bno=${dto.bno}",
    		success: function(result){
    			var output = "<table>";
    			for(var i in result){
    				output += "<tr>";
    				output += "<td>"+result[i].userId;
    				output += "("+result[i].reply_regdate+")<br>";
    				output += result[i].reply_content+"<br>";
    				output += "---------------------------------------------------------------------------------------------------</td>"
    				output += "<tr>";
    			}

    			output += "</table>";
    			 $("#listReply").html(output);
    		}				
    		
    	})
    }
    

    //날짜 변환 함수

    function changeDate(date){
    	date= new Date(parseInt(date));
    	year = date.getFullYear();
    	month = date.getMonth();
    	day = date.getDate();
    	hour = date.getHours();
    	minute = date.getMinutes();
    	second = date.getSeconds();
    	strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
    	return strDate;
    }
    
  </script>
    
    <style>
  .Rbtnmargin{
    float: right;
}

.boardTable>tbody{
    cursor: pointer;
    
}
.nav_main{
    color: crimson;
    font-size: 20px;
   
}
.main_title{
    font-size: 30px;
}
a:hover{
    text-decoration: none;
}
.memo{
	font-size: 35px;
}
#listReply{
  float:left;
}
.comments{
margin: 0 auto;
  align:center;
  width: 700px;
  border: 1px solid blue;
  background-color: #F7F7F7;

}
  </style>
 </head>
 <body>
 <div class="navbar navbar-default bg-warning">
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
    </div>
    
<table align="center">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
     <tr>
      <td align="center">내 용</td>
     </tr>
    </table>
    <form name="form2" method="post">
   <table width="700"align="center" >
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="600">${dto.bno}</td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td  width="76">조회수</td>
      <td width="600">${dto.viewcnt}</td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성자</td>
      <td width="600">${dto.userId}</td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="600"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
      <td width="600">${dto.title}</td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                <td width="0"></td>
                   <td class="memo" width="407" colspan="2" height="200" >${dto.content}</td>
                </tr>
 
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399"><input type=button class="btn btn-primary Rbtnmargin" value="글쓰기"  OnClick="location.href='write'">
      <input type="hidden" name="bno" value="${dto.bno}">
	<input type=button  class="btn btn-primary Rbtnmargin" value="목록" OnClick="location.href='Mainboard'">
	    <input type=button id="btnReply" class="btn btn-primary Rbtnmargin" value="답글">
     <c:if test="${dto.userId == sessionScope.userId}">
        <input type=button class="btn btn-primary Rbtnmargin" value="수정" Onclick="location.href='${path}/change?bno=${dto.bno}'">
      </c:if>
	<!-- <input type=button class="btn btn-primary Rbtnmargin" id="btnUpdate" value="수정"> -->
     </tr>
    </table>
    </form>
   </td>
  </tr>
 </table>
 <div class=comments align="center">
    <div id="listReply"></div>
    <div style="width:650px;">
      <br>
       <c:if test="${sessionScope.userId == null}">
    <textarea style="width: 100%;" rows="5 cols="80" name="replytext" id="replylogin" placeholder="로그인이 필요합니다." readonly></textarea>
    </c:if>
    <c:if test="${sessionScope.userId != null}">
    <textarea style="width: 100%;" rows="5 cols="80" name="reply_content" id="reply_content" placeholder="댓글을 입력하세요" ></textarea>
      <br>
    <button type="button" id="btnComments" class="btn btn-info">댓글 작성</button>
    </c:if>
    </div>
 </div>
</body>

</html>
