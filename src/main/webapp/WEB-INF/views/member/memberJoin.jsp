<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/memberJoin.css" rel="stylesheet">
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
</style>
<script type="text/javascript">
	$(function(){
		
	//전화번호
		var regex= /^\d{2,3}-\d{3,4}-\d{4}$/;
		
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
	
		$("#subBtn").click(function(){
			var age = $("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
			var email = $("#emailWrite").val()+"@"+$("#emailSelected").val();
			$("#age").val(age);
			$("#email").val(email);
			$("#frm").submit();
		});
	});
</script>
</head>
<body>
<div id="spaceBar"></div>
	<section>
		<div id="contents">
			<div id="contents_header">
				<h1>회원가입</h1><span></span>			
			</div>
			<div id="contents_wrapper">
				<form id="frm" action="./memberJoin" method="post">
					<table id="joinForm">
						<tr>
							<td id="joinTitles"><h4>아이디</h4></td>
							<td colspan="4">
								<input type="text" class="form-control" placeholder="아이디를 입력하세요." name="id" id="id">
							</td>
						</tr>
						<tr>
							<td id="joinTitles"><h4>패스워드</h4></td>
							<td colspan="4">
								<input type="password" class="form-control" placeholder="패스워드를 입력하세요." name="pw" id="pw">
							</td>
						</tr>
						<tr>
							<td id="joinTitles"><h4>패스워드 확인</h4></td>
							<td colspan="4">
								<input type="password" class="form-control" placeholder="패스워드 확인" id="pwCheck">
							</td>
						</tr>
						<tr>
							<td id="joinTitles"><h4>이름</h4></td>
							<td colspan="4">
								<input type="text" class="form-control" placeholder="이름을 입력하세요." name="name" id="name">
							</td>
						</tr>
						<tr>
							<td id="joinTitles"><h4>휴대폰 번호</h4></td>
							<td colspan="4">
								<input type="text" class="form-control" placeholder="'-'을 제거하고 입력하세요" name="phone" id="phone">
							</td>
						</tr>
						<tr>
							<td id="joinTitles"><h4>이메일 주소</h4></td>
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
							<td id="joinTitles"><h4>생년월일</h4></td>
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
							<td id="joinTitles"><h4>주소</h4></td>
							<td colspan="4">
								<input type="text" class="form-control" placeholder="주소를 입력하세요." name="address" id="address">
							</td>
						</tr>
					</table>
					<input type="hidden" id="age" name="age" value="">
					<input type="hidden" id="email" name="email" value="">
					<div id="contents_btn">
						<input type="button" id="subBtn" value="가입 ">
						<input type="button" id="cancelBtn" value="취소">
					</div>
  				</form>
			</div>
		</div>
	</section>
</body>
</html>