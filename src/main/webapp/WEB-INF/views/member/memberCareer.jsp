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
<link href="${pageContext.request.contextPath}/resources/css/memberCareer.css" rel="stylesheet">
<script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
<script type="text/javascript">
   	$(function(){
   		
		CKEDITOR.replace("career");
		
   	});
   	
   	$("#community_insert").click(function(){
   		document.frm.submit();
   	});
   	$("#community_cancle").click(function(){
   		history.back();
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
					<div class="contents_input_warp">
						<form id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/member/careerWrite" enctype="multipart/form-data">
							<div>
								<h5>강사님의 경력을 적어주세요.</h5> 
							</div>
							<textarea rows="10" cols="100" name="career" id="career" style="height:500px;">
								<c:if test="${!empty member.career}">
									${member.career}						
								</c:if>
								<c:if test="${empty member.career}">
									예) 2018년. 단국대학교 졸업
								</c:if>
							</textarea>
							<div class="btn_form">
								<input type="submit" value="작성" id="community_insert" style="background-color: RGB(18, 165, 244); margin-right: 10px;">						
								<input type="button" value="취소" id="community_cancle" style="background-color: red;">
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