<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/memberUpdate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		
		var message = "${message}";
		
		if(message != "")
		{
			alert(message);
		}
		//pw체크
		function passwordCheck(str) {
			var check2 = false;
			
			if(str.match(/\W/g) != null && str.match(/\d/g) != null && str.match(/^[a-z]/g) != null && str.length > 8)
			{
				check2 = true;
			}
			
			return check2;
		}
		
		$("#newPw").change(function(){
			
			if($(this).val().length > 15)
			{
				alert("비밀번호는 15자리까지만 가능합니다.");
				$(this).val("");
			}
			
			if(passwordCheck($(this).val()))
			{
				$("#pwCheckResult1").css("color", "#29d336");
				$("#pwCheckResult1").html("사용 가능한 비밀번호 입니다.");
			}
			else
			{
				$("#pwCheckResult1").css("color", "red");
				$("#pwCheckResult1").html("사용이 불가능한 비밀번호 입니다.");
			}
			
			if($("#newPwCheck").val() == "")
			{
				$("#pwCheckResult2").css("color", "black");
				$("#pwCheckResult2").html("8~20 자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용");
			}
			else if($(this).val() != $("#newPwCheck").val())
			{
				$("#pwCheckResult2").css("color", "red");
				$("#pwCheckResult2").html("비밀번호가 다릅니다. 다시한번 입력해주세요.");
			}
			else
			{
				$("#pwCheckResult2").css("color", "#29d336");
				$("#pwCheckResult2").html("비밀번호가 일치합니다.");
			}
		});
		$("#newPwCheck").change(function(){
			
			if($(this).val() === $("#newPw").val())
			{
				$("#pwCheckResult2").css("color", "#29d336");
				$("#pwCheckResult2").html("비밀번호가 일치합니다.");
			}
			else if($(this).val() == "")
			{
				$("#pwCheckResult2").css("color", "black");
				$("#pwCheckResult2").html("8~20 자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용");
			}
			else
			{
				$("#pwCheckResult2").css("color", "red");
				$("#pwCheckResult2").html("비밀번호가 다릅니다. 다시한번 입력해주세요.");
			}
		});
		
	//생년월일
		$("#year").change(function(){
			var check = numberCheck($(this).val());
			
			if(check == false)
			{
				alert("숫자만 입력해주세요.");
				$(this).val("");
			}
		});
		$("#month").change(function(){
			var check = numberCheck($(this).val());
			
			if(check == false)
			{
				alert("숫자만 입력해주세요.");
				$(this).val("");
			}
		});
		$("#day").change(function(){
			var check = numberCheck($(this).val());
			
			if(check == false)
			{
				alert("숫자만 입력해주세요.");
				$(this).val("");
			}
		});
	//생년월일 체크
		function numberCheck(str) {
			var res;
			var check = false;
			res = str.replace(/^[a-zA-Z\W]*$/,"");
			
			if(res != "")
			{
				check = true;
			}
			
			return check;
		}
	
	//이메일 readonly
		$("#emailSelect").change(function(){
			if($(this).val() == 'naver')
			{
				$("#emailSelected").val("naver.com");
				$("#emailSelected").prop("readonly", true);
			}
			else if($(this).val() == 'hanmail')
			{
				$("#emailSelected").val("hanmail.net");
				$("#emailSelected").prop("readonly", true);
			}
			else if($(this).val() == 'google')
			{
				$("#emailSelected").val("gmail.com");
				$("#emailSelected").prop("readonly", true);
			}
			else if($(this).val() == 'nate')
			{
				$("#emailSelected").val("nate.com");
				$("#emailSelected").prop("readonly", true);
			}
			else
			{
				$("#emailSelected").val("");
				$("#emailSelected").prop("readonly", false);
			}
		});
/* 
	$("#files").change(function(){
	      var files;
	      if(e.dataTransfer) {
	        files = e.originalEvent.dataTransfer.files;
	        console.log("dataTransfer : "+ files);
	      } else if(e.target) {
	        files = e.target.files;
	        console.log("target : "+ files);
	      }
	     
	      
	      try{
	          let new_input = '<input id="files" type="file" name="files" multiple="multiple" class="addFile" />';
	          $('#resultSet').append(new_input);
	      }catch(err){

	      }
	});
*/
 	
	//이미지 드래그 앤 드롭 & 취소
        $('.drop').on({
            
            'dragover':function(e){
            	$(".drop").css("background-color", "RGB(18, 165, 244)");
                e.preventDefault();
            },
            'dragenter':function(e){
                e.preventDefault();
            },
            'dragleave':function(e){
            	$(".drop").css("background-color", "white");
                e.preventDefault();
            },
			'drop':function(e){
                
            	var f = e.originalEvent.dataTransfer.files[0];
                var reader = new FileReader();
                
                $(reader).on('load',function(f){
                   $('#dropped').attr('src',reader.result);
                   //$("input[type='file']").prop("files", e.originalEvent.dataTransfer.files[0]);
                   $(".drop").css("background-color", "white");
                });
                
                reader.readAsDataURL(f);
                e.preventDefault();
                
            }
        });
      
	//이미지 삭제 버튼
		$("#delBtn").click(function(){
			var counting = 1;
			$("#counting").val(counting);
			$('#dropped').attr('src','../resources/images/defaultProfile.PNG');
			$("#fileInput").val("");
		});
	
		$("#infoUpdateBtn").click(function(){
			var age = $("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
			var email = $("#emailWrite").val()+"@"+$("#emailSelected").val();
			var address = $("#sample6_address").val()+"/"+$("#sample6_address2").val();
			$("#age").val(age);
			$("#email").val(email);
			$("#address").val(address);
			$("#infoUpdate_frm").submit();
		});
		
		$("#pwUpdateBtn").click(function(){
			
			$("#pwUpdate_frm").submit();				
			
		});
		
	});
</script>
</head>
<body>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"></c:import>
	<section>
		<div class="allContents">
			<div class="leftContents">
				<div class="leftMenu">
					<div class="leftMenu_header">
						마이페이지
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/member/memberMypage">회원정보</a>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/member/memberCheck?select=update" style="color: white;">정보수정</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/memberCheck?select=delete">회원탈퇴</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="rightContents">
				<div class="contents_header">
					${menuTitle}			
				</div>
				<div class="contents_wrapper">
					<div class="pwUpdate_box">
						<div class="check_header">
							비밀번호 수정
						</div>
						<form id="pwUpdate_frm" action="${pageContext.request.contextPath}/member/memberPwUpdate" method="post">
							<table>
								<tr>
									<td class="check_title">현재 비밀번호</td>
									<td><input type="password" id="currPw" name="currPw" class="form-control"></td>
									<td colspan="2">현재 사용중인 비밀번호 입력</td>
								</tr>
								<tr>
									<td class="check_title">새 비밀번호</td>
									<td><input type="password" id="newPw" name="newPw" class="form-control"></td>
									<td colspan="2" id="pwCheckResult1">8~20 자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용</td>
								</tr>
								<tr>
									<td class="check_title">새 비밀번호 확인</td>
									<td><input type="password" id="newPwCheck" name="newPwCheck" class="form-control"></td>
									<td colspan="2" id="pwCheckResult2">8~20 자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용</td>
								</tr>
							</table>
							<div class="btn_box" style="margin-top: 20px;">
								<input id="pwUpdateBtn" type="button" value="비밀번호 변경" class="pwUpdateBtn">
							</div>
						</form>
					</div>
					
					<div class="infoUpdate_box">
						<div class="check_header">
							회원정보 수정
						</div>
						<form id="infoUpdate_frm" action="${pageContext.request.contextPath}/member/memberInfoUpdate" method="post" enctype="multipart/form-data">
							<table>
								<tr>
									<td class="check_title2">아이디</td>
									<td colspan="2">${member.id}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td class="check_title2">이름</td>
									<td colspan="2"><input type="text" id="name" name="name" class="form-control" value="${member.name}"></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td class="check_title2">생년월일</td>
									<td>
										<input type="text" class="form-control" id="year" placeholder="XXXX" maxlength="4" style="text-align: center; display: inline-block; width: 80%;" value="${age[0]}"> 년
									</td>
									<td>
										<input type="text" class="form-control" id="month" placeholder="XX" maxlength="2" style="text-align: center; display: inline-block; width: 80%;" value="${age[1]}"> 월
									</td>
									<td>
										<input type="text" class="form-control" id="day" placeholder="XX" maxlength="2" style="text-align: center; display: inline-block; width: 80%;" value="${age[2]}"> 일
									</td>
								</tr>
								<tr>
									<td class="check_title2">휴대폰 번호</td>
									<td colspan="4">
										<input type="text" class="form-control" placeholder="'-'를 포함하면서 입력해 주세요." name="phone" id="phone" maxlength="13" value="${member.phone}">
									</td>
								</tr>
								<tr>
									<td class="check_title2">이메일 주소</td>
									<td>
										<input type="text" class="form-control" placeholder="이메일" id="emailWrite" value="${email[0]}">
									</td>
									<td style="text-align: center;">@</td>
									<td>
										<select id="emailSelect">
												<option selected="selected" value="write">직접입력</option>
												<option value="naver">네이버</option>
												<option value="hanmail">한메일</option>
												<option value="google">구글</option>
												<option value="nate">네이트</option>
										</select>
									</td>
									<td>
										<input id="emailSelected" type="text" class="form-control" value="${email[1]}">
									</td>
								</tr>
								<tr style="height: 110px;">
									<td class="check_title2">주소</td>
									<td colspan="4">
										<input type="hidden" id="sample6_postcode" placeholder="우편번호">
										<input type="text" onclick="sample6_execDaumPostcode()" id="sample6_address" class="form-control" readonly="readonly" style=" display: inline-block; width: 80%;" value="${address[0]}">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
										<input type="text" id="sample6_address2" class="form-control" placeholder="상세주소를 입력해주세요." style=" display: inline-block; width: 100%;" value="${address[1]}">
										
										<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
										<script>
										    function sample6_execDaumPostcode() {
										        new daum.Postcode({
										            oncomplete: function(data) {
										                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										
										                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
										                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										                var fullAddr = ''; // 최종 주소 변수
										                var extraAddr = ''; // 조합형 주소 변수
										
										                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										                    fullAddr = data.roadAddress;
										
										                } else { // 사용자가 지번 주소를 선택했을 경우(J)
										                    fullAddr = data.jibunAddress;
										                }
										
										                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
										                if(data.userSelectedType === 'R'){
										                    //법정동명이 있을 경우 추가한다.
										                    if(data.bname !== ''){
										                        extraAddr += data.bname;
										                    }
										                    // 건물명이 있을 경우 추가한다.
										                    if(data.buildingName !== ''){
										                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										                    }
										                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
										                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
										                }
										
										                // 우편번호와 주소 정보를 해당 필드에 넣는다.
										                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
										                document.getElementById('sample6_address').value = fullAddr;
										
										                // 커서를 상세주소 필드로 이동한다.
										                document.getElementById('sample6_address2').focus();
										            }
										        }).open();
										    }
										</script>
									</td>
								</tr>
								<tr style="height: 30px;"></tr>
								<tr>
									<td class="check_title2">프로필 이미지</td>
									<td style="height: 150px; border: 2px dashed black; padding-left: 15px;" colspan="4" id='dropContainer' class="drop">
										<div id="drop" class="dropDiv">
											<c:choose>
												<c:when test="${!empty profileImage}">
												    <img id="dropped" src="${pageContext.request.contextPath}/resources/upload/${profileImage.file_name}"/>												
												</c:when>
												<c:otherwise>
													<img id="dropped" src="${pageContext.request.contextPath}/resources/images/defaultProfile.PNG"/>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="dropDiv">
											여기에 이미지를 드래그하여 넣어주세요.
										</div>
										<span id="delBtn" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</td>
								</tr>
								<tr style="height: 30px;">
									<td></td>
									<td colspan="4">
										<input id="fileInput" type="file" name="files" class="addFile" style="display: none;"/>
										<script type="text/javascript">
											$(function(){
												dropContainer.ondragover = dropContainer.ondragenter = function(evt) {
												  evt.preventDefault();
												};
					
												dropContainer.ondrop = function(evt) {
												  // pretty simple -- but not for IE :(
												  fileInput.files = evt.dataTransfer.files;
												  evt.preventDefault();
												};								
											});
										</script>
									</td>
								</tr>
							</table>
							<input type="hidden" id="age" name="age" value="${member.age}">
							<input type="hidden" id="email" name="email" value="${member.email}">
							<input type="hidden" id="address" name="address" value="${member.address}">
							<input type="hidden" id="member_seq" name="member_seq" value="${member.member_seq}">
							<input type="hidden" id="counting" name="counting" value="0">
							<div class="btn_box">
								<input id="infoUpdateBtn" type="button" value="회원정보 변경" class="infoUpdateBtn">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>