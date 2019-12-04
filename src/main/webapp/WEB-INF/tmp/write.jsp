<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
   <link rel="stylesheet" href="css/site.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/bootstrap.js"></script>
<title>jsp 게시판 웹사이트</title>

<style>
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
.Rbtnmargin{
    float: right;
}

</style>
</head>

<body>

	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

		}
	%>
	<!-- 네비게이션  -->

	<nav class="navbar navbar-default bg-warning">
     <div class="navbar-header nav_main">
        <a class="main_title"><b>도서관 게시판</b></a>
        <a class="navbar-brand-success" href="Main.jsp">메인가기</a>
        <a class="navbar-brand-success" href="newnew.html">회원가입가기</a>
        </div>
    </nav>

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<form method="post" action="bbsAdd">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="TITLE" maxlength="50" /></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="MEMO" maxlength="2048" style="height: 350px; width:900px"></textarea></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="작성자"
									name="USERNAME" /></td>
							<td><input type="text" class="form-control" placeholder="조회수"
									name="HIT" /></td>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary Rbtnmargin" value="글쓰기" />
			</form>
		</div>
	</div>
</body>
</html>
