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
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/memberCheck.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		
		var message = "${message}";
		
		if(message != "")
		{
			alert(message);
		}
		
		var selection = "${menuTitle}";
		
		if(selection == "정보수정")
		{
			$("#updateList").css("background-color", "RGB(18, 165, 244)");
			$("#updateList > a").css("color", "white");
		}
		else
		{
			$("#deleteList").css("background-color", "RGB(18, 165, 244)");
			$("#deleteList > a").css("color", "white");
		}
		
		$("#delBtn").click(function(){
			var check = confirm("정말로 탈퇴 하시겠습니까?");
			
			if($("#checkId") == "")
			{
				alert("아이디를 입력해 주세요.");
				$("#frm").prop("action", "javascript:void(0)");
			}
			if($("#checkPw") == "")
			{
				alert("비밀번호를 입력해 주세요.");
				$("#frm").prop("action", "javascript:void(0)");
			}
			
			if(check == false)
			{
				$("#frm").prop("action", "javascript:void(0)");
			}
			else
			{
				$("#frm").prop("action", "${pageContext.request.contextPath}/member/memberCheck");
			}
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
							<li id="updateList">
								<a href="${pageContext.request.contextPath}/member/memberCheck?select=update">정보수정</a>
							</li>
							<li id="deleteList">
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
					<div class="wrapper_warning">
						<span style="color: red;">주의사항</span><br>
						<c:choose>
							<c:when test="${menuTitle eq '회원탈퇴'}">
								회원탈퇴를 위해서는 사용자 인증이 필요합니다.<br>
							</c:when>
							<c:otherwise>
								정보수정을 위해서는 사용자 인증이 필요합니다.<br>
							</c:otherwise>
						</c:choose>
						회원임을 확인하기 위해 아이디와 비번을 입력해 주시기 바랍니다.
					</div>
					
					<div class="wrapper_check">
						<div class="check_header">
							본인 확인
						</div>
						<form id="frm" action="${pageContext.request.contextPath}/member/memberCheck" method="post">
							<input type="hidden" value="${menuTitle}" name="menuTitle">
							<table>
								<tr>
									<td class="check_title">아이디</td>
									<td><input type="text" id="checkId" name="checkId" class="form-control" style="width: 200px;"></td>
								</tr>
								<tr>
									<td class="check_title">비밀번호</td>
									<td><input type="password" id="checkPw" name="checkPw" class="form-control" style="width: 200px;"></td>
								</tr>
							</table>
							
							<div class="btn_area">
								<c:choose>
									<c:when test="${menuTitle eq '회원탈퇴'}">
										<input type="submit" id="delBtn" value="${menuTitle}" style="background-color: red">
									</c:when>
									<c:otherwise>
										<input type="submit" value="${menuTitle}">
									</c:otherwise>
								</c:choose>
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