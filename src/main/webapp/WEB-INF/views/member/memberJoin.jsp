<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/memberJoin.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		
	//id체크
		$("#id").change(function(){
			$.ajax({
				type:"post",
				url:"memberIdCheck",
				
				data: {"checkId":$(this).val()},
				success:function(data){
					var result = data;
					
					if(result.trim() == "사용 가능한 아이디입니다.")
					{
						$("#idCheckResult").css("color", "#29d336");
					}
					else
					{
						$("#idCheckResult").css("color", "red");
					}
					
					$("#idCheckResult").html(data);
				}
			});
			
			
		});
	//pw체크
		function passwordCheck(str) {
			var check = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,15}$/;
		}
	
		$("#pw").change(function(){
			
		});
		
	//전화번호
		$("#phone").change(function(){
			if($(this).val().length == 11)
			{
				$(this).val($(this).val().substring(0,3)+"-"+$(this).val().substring(3,7)+"-"+$(this).val().substring(7,11));
			}
			else if($(this).val().length == 10)
			{
				$(this).val($(this).val().substring(0,3)+"-"+$(this).val().substring(3,6)+"-"+$(this).val().substring(6,10));
			}
			else if($(this).val().length == 9)
			{
				$(this).val($(this).val().substring(0,2)+"-"+$(this).val().substring(2,5)+"-"+$(this).val().substring(5,9));
			}
			else if($(this).val() == "")
			{
				
			}
			else
			{
				alert("9~11자리 번호를 입력해주세요.");
				$(this).val("");
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
        
		$("#delBtn").click(function(){
			$('#dropped').attr('src','../resources/images/defaultProfile.PNG');
			$("#fileInput").val("");
		});
	
		$("#subBtn").click(function(){
			var age = $("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
			var email = $("#emailWrite").val()+"@"+$("#emailSelected").val();
			var address = $("#sample6_address").val()+"/"+$("#sample6_address2").val();
			$("#age").val(age);
			$("#email").val(email);
			$("#address").val(address);
			$("#frm").submit();
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
						회원가입
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/member/memberAgree">이용약관 및 개인정보취급방침</a>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/member/memberAgree" style="color: white;">회원가입</a>
							</li>
							<li>
								<a href="#">ID/PW 찾기</a>
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
					<form id="frm" action="${pageContext.request.contextPath}/member/memberJoin" method="post" enctype="multipart/form-data">
						<table class="joinForm">
							<tr>
								<td class="joinTitles"><h4>아이디</h4></td>
								<td colspan="4">
									<input type="text" class="form-control" placeholder="아이디를 입력하세요." name="id" id="id">
									<div id="idCheckResult" class="checkResult"></div>
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>패스워드</h4></td>
								<td colspan="4">
									<input type="password" class="form-control" placeholder="패스워드를 입력하세요." name="pw" id="pw" maxlength="15">
									<span id="pwCheckResult1" class="checkResult">8~15자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용</span>
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>패스워드 확인</h4></td>
								<td colspan="4">
									<input type="password" class="form-control" placeholder="패스워드 확인" id="pwCheck" maxlength="15">
									<span id="pwCheckResult2" class="checkResult">8~15자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용</span>
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>이름</h4></td>
								<td colspan="4">
									<input type="text" class="form-control" placeholder="이름을 입력하세요." name="name" id="name">
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>휴대폰 번호</h4></td>
								<td colspan="4">
									<input type="text" class="form-control" placeholder="'-'을 제거하고 입력하세요" name="phone" id="phone" maxlength="13">
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>이메일 주소</h4></td>
								<td>
									<input type="text" class="form-control" placeholder="이메일" id="emailWrite">
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
									<input id="emailSelected" type="text" class="form-control">
								</td>
							</tr>
							<tr id="birth">
								<td class="joinTitles"><h4>생년월일</h4></td>
								<td>
									<input type="text" class="form-control" id="year" placeholder="XXXX" name="year" maxlength="4" style="text-align: center; display: inline-block; width: 80%;"> 년
								</td>
								<td>
									<input type="text" class="form-control" id="month" placeholder="XX" name="month" maxlength="2" style="text-align: center; display: inline-block; width: 80%;"> 월
								</td>
								<td>
									<input type="text" class="form-control" id="day" placeholder="XX" name="day" maxlength="2" style="text-align: center; display: inline-block; width: 80%;" > 일
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>주소</h4></td>
								<td colspan="4">
									<input type="hidden" id="sample6_postcode" placeholder="우편번호">
									<input type="text" onclick="sample6_execDaumPostcode()" id="sample6_address" class="form-control" readonly="readonly" style=" display: inline-block; width: 80%;">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
									<input type="text" id="sample6_address2" class="form-control" placeholder="상세주소를 입력해주세요." style=" display: inline-block; width: 100%;">
									
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
								<td class="joinTitles"><h4>프로필 이미지</h4></td>
								<td style="height: 150px; border: 2px dashed black; padding-left: 15px;" colspan="4" id='dropContainer' class="drop">
									<div id="drop" class="dropDiv">
									    <img id="dropped" src="${pageContext.request.contextPath}/resources/images/defaultProfile.PNG"/>
									</div>
									<div class="dropDiv">
										여기에 이미지를 드래그하여 넣어주세요.
									</div>
									<span id="delBtn" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</td>
							</tr>
							<tr>
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
						<input type="hidden" id="age" name="age" value="">
						<input type="hidden" id="email" name="email" value="">
						<input type="hidden" id="address" name="address" value="">
						<div class="contents_btn">
							<input type="button" id="subBtn" value="가입 ">
							<a href="../ctrl/">취소</a>
						</div>
	  				</form>
				</div>
			</div>
		</div>
	</section>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>