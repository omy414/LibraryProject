<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<title>Document</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
        function func() {
            var pw = document.getElementById("userPassword").value;
            var pwCheck = document.getElementById("userPasswordc").value;
            if (pw.length < 8 || pw.length > 16) {
                window.alert("비밀번호는 8자리이상,16자리 이하만 가능합니다.");
                document.getElementById("userPassword").value = document.getElementById("userPasswordc").value = "";
                document.getElementById("same").innerHTML = "";
            } if (document.getElementById("userPassword").value != "" && document.getElementById("userPasswordc").value != "") {
                if (document.getElementById("userPassword").value == document.getElementById("userPasswordc").value) {
                    document.getElementById("same").innerHTML = "비밀번호가 일치합니다";
                    document.getElementById("same").style.color = "blue";
                }
                else {
                    document.getElementById("same").innerHTML = "비밀번호가 일치하지 않습니다";
                    document.getElementById("same").style.color = "red";
                }
            }
            
 
        }
        function ques(){
        	var ques = $("#userPwfindQ");
        	var target = document.getElementById("findQselect");
        	var target2 = target.options[target.selectedIndex].text;

        	ques.val(target2);
        }
        
       function tar(){
			var target = document.getElementById("emailselect");
			var target2 = target.options[target.selectedIndex].text;
			
			var front = $("#useremailfront");
			var email = front.val() +"@"+ target2;
			front.val(email);
    	   
       }
    	$(document).ready(function() {
    		$("#btnSave").click(function() {
    			
    			var userId = $("#userId").val();
    			var password = $("#userPassword").val();
    			var userPwfindQ = $("#userPwfindQ").val();
    			var userPwfindA = $("#userPwfindA").val();
    			var userName = $("#userName").val();
    			var userPnum1 = $("#userPnum1").val();
    			
    			var month = $("#month").val();
    			var day = $("#day").val();
    			var Birth = $("#userbirth").val();
    			var userBirth = Birth +"-" +month +"-"+ day;
    			
    			var postcode = $("#sample4_postcode").val();
    			var roadAddress = $("#sample4_roadAddress").val();
    			var detailAddress = $("#sample4_detailAddress").val();
    			
    			var userAddress ="우편번호:"+postcode+" 주소:"+roadAddress+" "+detailAddress;
    			if (document.getElementById('userGender').checked) {
    				userGender = document.getElementById('userGender').value;
				}
    			var userEmail = $("#userEmail").val();
    			/* var userEmailAgree = $("#userEmailAgree").val(); */
    		
    			document.form3.submit();

    		});
    		
    		$("#btnreset").click(function(){
    			window.history.back();
    		})
    	});
    	  
    	
    	// 주소
    	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    	
    
    </script>
<style>
#main_header {
  text-align: center;
}

#locale_switch {
  float: right;
  margin-top: -110px;
}

.sub {
  text-align: center;
  width: 800px;
  height: auto;
}

#sub_sub {
  margin-left: auto;
  margin-right: auto;
  display: table;
}
</style>
</head>

<body>
	<header id="main_header"> <img id="dic" src="resources/images/국립중앙도서관.png" onclick="location.href='Main';">

	<div>
		<select id="locale_switch" name="언어선택">
			<option value="">언어선택</option>
			<option value="한국어">한국어</option>
			<option value="영어">영어</option>
			<option value="일본어">일본어</option>
			<option value="중국어">중국어</option>
			<option value="중국어">중국어2</option>

		</select>
	</div>
	</header>
	<div id="sub_sub">

		<form name="form3" method="post" action="${path}/Memberinsert">
			<table align="center" width="900pt" border="6" cellspacing="0" cellpadding="0" style="background-color: white">
				<tr>
					<td colspan="2" align="center" bgcolor="#ff4c4c" height="40" style="color: white"><strong>회원 기본 정보</strong></td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">아이디 :</td>
					<td><input type=text size="27" name=userId id=userId>영문+숫자 조합으로 5자리 이상작성</td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="height: 24px; color: white">비밀번호 :</td>
					<td style="height: 24px;"><input type=password name="userPassword" id="userPassword" size="27" onchange="func()" />숫자와 특수문자를 포함한 8자리 이상작성</td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">비밀번호 확인 :</td>
					<td style="height: 24px;"><input type="password" id="userPasswordc" size="27" onchange="func()" /><span id="same"></span></td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">비밀번호찾기 질문 :</td>
					<td style="height: 24px;"><input type="text" size="27" name="userPwfindQ" id="userPwfindQ"> <select id="findQselect" onchange="ques()">
							<option value="default">직접 입력</option>
							<option value="naver">가장 친한 친구의 이름은?</option>
							<option value="daum">내가 졸업한 학교는?</option>
							<option value="google">가장 소중한 물건은?</option>
							<option value="nate">가장 기억에 남는 날짜는?</option>
							<option value="nate">가장 기억에 남는 장소는?</option>
					</select>질문을 선택해주세요</td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">비밀번호찾기 답변 :</td>
					<td style="height: 24px;"><input type="text" size="27" name="userPwfindA" id="userPwfindA">
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">이름 :</td>
					<td><input type="text" name=userName id=userName size="27"></td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">이메일 :</td>
					<td><input type="text" size="27" name="userEmail" id="useremailfront"> <select id="emailselect" onchange="tar()">
							<option value="default">직접 입력</option>
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="google">google.com</option>
							<option value="nate">nate.com</option>

					</select>이메일을 입력해주세요</td>

				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">이메일수신동의 :</td>
					<td><input type='radio' name='userEmailAgree' value='Agree' />동의함 <input type='radio' name='userEmailAgree' value='disAgree' />동의하지않음</td>
				</tr>
				<tr>
					<td colspan="2" align="center" bgcolor="ff4c4c" height="40" style="color: white"><strong>회원 개인 정보</strong></td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">전화번호 :</td>
					<td><input type="text" size=27 name=userPnum1 id=userPnum1>예)01012345678</td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">생년월일 :</td>
					<td>
					<select type="number" name="userBirth1" id="userbirth">
					<script>
                    var year= 0;
                    for (i =2018; i>=1930; i--){
                        year=i;
                        document.write("<option>"+year+"</option>");
                    }
                    </script>
					</select>년
					<select name="userBirth2" id="month">
							<script>
                    var month= 0;
                    for (i =1; i<=12; i++){
                        month=i;
                        document.write("<option>"+month+"</option>");
                    }
                    </script>
					</select>월 <select name="userBirth3" id="day">
							<script>
                        var day = 0;
                        for (i = 1; i <= 31; i++) {
                            day = i;
                            document.write("<option>" + day + "</option>");
                        }
                        var r = " ";
                      
                    </script>
					</select>일</td>
				</tr>
				<tr>
					<td bgcolor="#003964" style="color: white">성별 :</td>
					<td><input type='radio' name='userGender' id='userGender' value='female' checked="checked" />여성 <input type='radio'  id='userGender' name='userGender' value='male' />남성</td>
				</tr>

				<!--  주소란 -->
				<tr>
					<td bgcolor="#003964" style="color: white">주소 :</td>
					<td>
						<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input size="45" type="text" id="sample4_roadAddress" name="userAddress" placeholder="도로명주소"><br>
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress"name="userAddress2" placeholder="상세주소">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목">
					</td>
				</tr>
				<tr>
					<td colspan="2"><div align=center>
							<button type="button" class="btn btn-primary Rbtnmargin" id="btnSave">확인</button>
							<button type="reset" class="btn btn-danger" id="btnreset">취소</button>
						</div></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>