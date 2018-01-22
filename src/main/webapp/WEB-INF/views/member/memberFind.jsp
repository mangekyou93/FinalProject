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
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/memberFind.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#idFindBtn").click(function(){
			
			$.ajax({
				url:"../member/memberFind",
				type:"POST",
				data: {
					name:$("#id_name").val(),
					email:$("#id_email").val()
				},
				success:function(e){
					
					if(e.trim() != "")
					{
						$("#idFind_result").css("display", "block");
						$("#idFind_result").html("<p>당신의 아이디는 <span>"+e+"</span> 입니다.</p>");						
					}
					else
					{
						alert("입력하신 이름, 이메일주소와 일치하는 회원이 존재하지 않습니다.");
					}
				}
			});
			
		});
		
		$("#pwFindBtn").click(function(){
			
			$.ajax({
				
				type:"post",
				url:"../member/memberFind",
				data:{
					id:$("#pw_id").val(),
					name:$("#pw_name").val(),
					email:$("#pw_email").val()
				},
				success:function(e){
					
					if(e.trim() != "")
					{
						alert("이메일로 임시 비밀번호를 보내드렸습니다. 확인 해 주세요.");
						location.href = e;
					}
					else
					{
						alert("입력하신 아이디, 이름, 이메일주소와 일치하는 회원이 존재하지 않습니다.");
					}
				}
			});
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
							<li>
								<a href="${pageContext.request.contextPath}/member/memberAgree">회원가입</a>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/member/memberFind" style="color: white;">ID/PW 찾기</a>
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
					<div class="idFind_box">
						<div class="find_header">
							아이디 찾기
						</div>
						<div class="find_warning">
							회원으로 가입되어 있는 본인의 이름과 이메일 주소를 입력하신후 아이디를 알려 드립니다.<br>
							<span style="color: red;">이름과 이메일 주소가 회원정보와 일치하지 않을 경우 아이디 찾기를 하실수 없으며</span><br>
							이와 관련된 문의는 학원으로 문의바랍니다.
						</div>
						<form id="idFindForm">
							<table>
								<tr>
									<td class="check_title">이름</td>
									<td><input type="text" id="id_name" name="name" class="form-control" style="width: 300px;"></td>
								</tr>
								<tr>
									<td class="check_title">이메일 주소</td>
									<td><input type="text" id="id_email" name="email" class="form-control" style="width: 300px;"></td>
								</tr>
							</table>
							<div id="idFind_result">
								
							</div>
							<div class="btn_box" style="margin-top: 20px;">
								<input id="idFindBtn" type="button" value="아이디 찾기" class="idFindBtn">
							</div>
						</form>
					</div>
					<div class="pwFind_box">
						<div class="find_header">
							비밀번호 찾기
						</div>
						<div class="find_warning">
							<span style="color: blue;">
								비밀번호는 임시 비밀번호를 재발급하여 드리며 임시 비밀번호로 로그인하신 후 <br>
								정보수정에서 비밀번호 재설정하시기 바랍니다.
							</span>
						</div>
						<form id="pwFindForm">
							<table>
								<tr>
									<td class="check_title">아이디</td>
									<td><input type="text" id="pw_id" name="id" class="form-control" style="width: 300px;"></td>
								</tr>
								<tr>
									<td class="check_title">이름</td>
									<td><input type="text" id="pw_name" name="name" class="form-control" style="width: 300px;"></td>
								</tr>
								<tr>
									<td class="check_title">이메일 주소</td>
									<td><input type="text" id="pw_email" name="email" class="form-control" style="width: 300px;"></td>
								</tr>
							</table>
							<div class="btn_box" style="margin-top: 20px;">
								<input id="pwFindBtn" type="button" value="비밀번호 찾기" class="pwFindBtn">
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