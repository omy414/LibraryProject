<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script type="text/javascript"
  src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>

<script>
	$(document).ready(function() {
		$("#btnSave").click(function() {
			var title = $("#title").val();
			var content = $("#content").val();
			var userId = $("userId").val();

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
			document.form1.action="${path}/insert";
			document.form1.submit();
		});
		
		$("#btnreset").click(function(){
			location.href="Mainboard";
		})
	});
	
	
	//-------------------------------------------------------------------------
	
	function noPreview() {
  $('#image-preview-div').css("display", "none");
  $('#preview-img').attr('src', 'noimage');
  $('upload-button').attr('disabled', '');
}

function selectImage(e) {
  $('#file').css("color", "green");
  $('#image-preview-div').css("display", "block");
  $('#preview-img').attr('src', e.target.result);
  $('#preview-img').css('max-width', '250px');
}

$(document).ready(function (e) {

  var maxsize = 500 * 1024; // 500 KB

  $('#max-size').html((maxsize/1024).toFixed(2));

  $('#upload-image-form').on('submit', function(e) {

    e.preventDefault();

    $('#message').empty();
    $('#loading').show();

    $.ajax({
      url: "upload-image.php",
      type: "POST",
      data: new FormData(this),
      contentType: false,
      cache: false,
      processData: false,
      success: function(data)
      {
        $('#loading').hide();
        $('#message').html(data);
      }
    });

  });

  $('#file').change(function() {

    $('#message').empty();

    var file = this.files[0];
    var match = ["image/jpeg", "image/png", "image/jpg"];

    if ( !( (file.type == match[0]) || (file.type == match[1]) || (file.type == match[2]) ) )
    {
      noPreview();

      $('#message').html('<div class="alert alert-warning" role="alert">Unvalid image format. Allowed formats: JPG, JPEG, PNG.</div>');

      return false;
    }

    if ( file.size > maxsize )
    {
      noPreview();

      $('#message').html('<div class=\"alert alert-danger\" role=\"alert\">파일 사이즈가 너무 큽니다.' + (maxsize/1024).toFixed(2) + ' KB 까지만 허락됩니다. 현재파일크기' +(file.size/1024).toFixed(2) + ' KB</div>');

      return false;
    }

    $('#upload-button').removeAttr("disabled");

    var reader = new FileReader();
    reader.onload = selectImage;
    reader.readAsDataURL(this.files[0]);

  });

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

.RbtSave {
  margin-left: 450px;
  font-size: 30px;
}
.RbtReset{
  margin-left: 5px;
  font-size: 30px;
}
#notice{
  margin: 0 auto;
  border: 3px solid #dddddd;
  width: 800px;
  text-align: center;

}
#notice_main{
  font-size:70px;
  font-family: cursive;
  color:orange;
}
/* .info{
  color:gray;
} */

#title{
  width: 100%;
}
#content{
  width: 100%;
}
#writer{
  float: left;
}
#loginWriter{
  font-size:50px;
  font-family: fantasy;
  float: left;
  color:olive;
}
#upload-image-form{
  margin-left:-500px;
  margin-top:-30px;
}
.upload{
  margin-left:-130px;
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
      <h2 id="notice_main">도서관 게시글 작성</h2>
    <form name="form1" method="post">
      <div>
          <input name="title" id="title" size="80" placeholder="제목을 입력하세요">
      </div>
      <div>
           <textarea name="content" id="content" rows="8" cols="180" placeholder="내용을 입력해주세요"></textarea>
      </div>
      <div>
          <label id="loginWriter"><input type="hidden" name="userId" id="writer" value="${sessionScope.userId}">${sessionScope.userId} 님</label>
          </div>
      <div style="width: 650px; text-align: center;">
        <button type="button" class="btn btn-primary RbtSave"
          id="btnSave">확인</button>
        <button type="reset" class="btn btn-danger RbtReset" id="btnreset">취소</button>
      </div>
    </form>
    
   <div class="container">
    <div style="max-width: 650px; margin: auto;">
        <form id="upload-image-form" action="" method="post" enctype="multipart/form-data">
          <div id="image-preview-div" style="display: none">
            <label for="exampleInputFile">선택된 파일:</label>
            <br>
            <img id="preview-img" src="noimage">
          </div>
          <div class="form-group">
            <input type="file" name="file" id="file" required>
          </div>
          <button class="btn btn-lg btn-primary upload" id="upload-button" type="submit" disabled>Upload image</button>
        </form>
        <div class="alert alert-info" id="loading" style="display: none;" role="alert">
          Uploading image...
          <div class="progress">
            <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
            </div>
          </div>
        </div>
        <div id="message"></div>
      </div>

      <a target="_blank" href="https://github.com/ShinDarth/Bootstrap-image-upload-form"><img style="position: absolute; top: 50px; right: 0; border: 0;" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a64448d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="자료를 나에게 달라" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"></a>
      </div>
   </div>

</body>
</html>