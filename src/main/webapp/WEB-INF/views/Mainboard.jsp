<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<!-- <link rel="stylesheet" href="resources/css/site.css"> -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript"
  src="http://code.jquery.com/jquery-2.1.0.min.js"></script>


<script>
	$(document).ready(function() {
		$(".Rbtnmargin").click(function() {
			if(${sessionScope.userNum == null}){
				alert("로그인후에 사용가능합니다");
				location.href = "${path}/Mainboard";
			}else{
			location.href = "${path}/write";				
			}
		});
	});
	function list(page) {
		location.href = "${path}/Mainboard?curPage=" + page
				+ "&searchOption-${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
	
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
body{
    background-color: #FDFCF0;
   }
.Rbtnmargin {
  float: right;
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

.boardTable>tbody {
  cursor: pointer;
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

#title {
  padding-left: 170px;
}

.formcon_sel {
  width: 200px;
  float: left;
  margin-left: 210px;
}

.formcon_key {
  width: 300px;
  float: left;
}

.formcon_sub {
  float: left;
}

#main_footer {
  clear: both;
  width: 100%;
  height: 150px;
  background-color: #FDFCF0;
  margin: 0 auto;
}

.copyright {
  overflow: hidden;
  position: relative;
  text-align: center;
  vertical-align: baseline;
  margin: 80px 0px 0px 0px;
}
</style>
</head>
<body>

  <div class="navbar navbar-default bg-warning">
    <div class="navbar-header nav_main">
      <a class="main_title"><b>도서관 게시판</b></a>
       <a class="navbar-brand-success main_menu" href="Main">메인 가기   |</a> 
      <a class="navbar-brand-success main_menu" href="bookfind">자료 검색   |</a> 
      <a class="navbar-brand-success main_menu" href="newevent">신작.이벤트   |</a> 
      <a class="navbar-brand-success main_menu" href="direction">방문 안내   |</a> 
      <c:if test="${login =='success'}">
        <h1 id="lout">${sessionScope.userName}(${sessionScope.userId})님
          환영합니다.</h1>
      </c:if>
    </div>
     <c:if test="${login !='success'}">
    <a class="navbar-brand-success main_submenu" href="New">회원가입 가기</a>
    </c:if>
    <c:if test="${login =='success'}">
    <a class="navbar-brand-success main_submenu" id="logOutBnt">로그아웃 하기</a>
    </c:if>
  </div>
  <div class="container">
    <table class="table table-hover boardTable">
      <thead>
        <tr>
          <th>번호</th>
          <th id="title" width="400">제목</th>
          <th>작성자</th>
          <th>작성일</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>

        <c:if test="${map.count ==0}">
          <tr align="center" bgcolor="#FFFFFF" height="30">
            <td colspan="6">등록된 글이 없습니다.</td>
          </tr>
        </c:if>
        <c:forEach var="row" items="${map.list}">
          <tr height="25" align="center">
            <td align="left">${row.bno}</td>
            <td align="center" width="400">
             <a href="${path}/view?bno=${row.bno}"> ${row.title}
             <c:if test="${row.recnt >0 }">
             <span style="color:red;">(${row.recnt})
             </span>
             </c:if>
             </a></td>
            <td align="left" width="300">${row.userId}</td>
            <td align="left">
              <!--  원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
                value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
            </td>
            <td align="left">${row.viewcnt}</td>
          </tr>
        </c:forEach>
        <tr>
      </tbody>
    </table>
    <button class="btn btn-primary Rbtnmargin" type="button"
      >글쓰기</button>

    <div class="text-center">
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <%-- <c:if test="${map.boardPager.curBlock > 1 }"> 처음으로 가는 코드 --%>
          <a class="page-link" href="javascript:list('1')"
          aria-label="previous"> <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">previous</span>
        </a>
        </li>
        <c:forEach var="num" begin="${map.boardPager.blockBegin}"
          end="${map.boardPager.blockEnd}">
          <c:choose>
            <c:when test="${num ==map.boardPager.curPage}">
              <li class="page-item"><a class="page-link"
                style="color: red">${num}</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item"><a class="page-link"
                href="javascript:list('${num}')">${num}</a></li>
            </c:otherwise>
          </c:choose>
        </c:forEach>
        <li class="page-item"><c:if
            test="${map.boardPager.curBlock <=map.boardPager.totBlock}">
            <a class="page-link"
              href="javascript:list('${map.boardPager.nextPage}')"
              aria-label="Next"> <span aria-hidden="true">&raquo;</span>
              <span class="sr-only">Next</span>
            </a>
          </c:if></li>
        <li class="page-item"><c:if
            test="${map.boardPager.curPage <=map.boardPager.totPage}">
            <a class="page-link"
              href="javascript:list('${map.boardPager.totPage}')"
              aria-label="Next"> <span aria-hidden="true">&raquo;</span>
              <span class="sr-only">Next</span>
            </a>
          </c:if></li>
      </ul>
    </div>
    <div class="formcon">
      <form name="form" method="post" action="${path}/Mainboard">
        <select class="form-control formcon_sel" name="searchOption">
          <option value="all"
            <c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+이름+내용</option>
          <option value="userId"
            <c:out value="${map.searchOption == 'userId'?'selected':''}"/>>이름</option>
          <option value="content"
            <c:out value ="${map.searchOption == 'content'?'selected':''}"/>>내용</option>
          <option value="title"
            <c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목
          </option>
        </select> <input name="keyword" class="form-control formcon_key"
          value="${map.keyword}"> <input type="submit"
          class="btn btn-primary formcon_sub" value="조회">
      </form>
    </div>
  </div>
  <footer id="main_footer">
    <p class="copyright">
      "위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며 국립중앙도서관의 입장과 다를 수 있습니다."<br>
      "Copyright (c)" <a href="//www.naver.com">www.naver.com</a> " All
      right reserved."
    </p>
  </footer>
</body>
</html>
