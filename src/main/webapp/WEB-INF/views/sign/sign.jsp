<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/resources/css/sign.css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
</head>
<body>
<!--  header start -->
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"></c:import>
<!-- header end -->	
	<section>
		<div class="allContents">
			<div class="leftContents">
				<div class="leftMenu">
					<div class="leftMenu_header">
						교육과정
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/calendar/test">커리큘럼</a>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/sign/sign_apply" style="color: white;">수강신청</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
				<div class="contents_header">
					${menuTitle}			
				</div>
			<div class="rightContents">
				<div class="contents_wrapper">
					<form action="${pageContext.request.contextPath}/sign/sign_apply" method="post" id="frm">
						<div id="content_body">
							<div class="subject">
								<span class="reg">온라인 수강신청</span>
							</div>
							
							<div class="register_body">
								<div class="hope_major">
									<div class="hope_left">
										<div class="hope_banner">희망전공선택</div>
									</div>
									
									<div class="major_choose">
										
									</div>
									
								</div>
								<!-- ====================================희망전공=========================================== -->
									
									<div id="cs_info">
										<div class="cs_left">
											<div class="cs_banner">신청자 정보</div>
										</div>
										<div class="visit_register">
										<div class="visit_register_form">
											<p class="cs_p">
												<b class="choose">이름</b>
												<div class="cs_a1">
												<input type="text" id="name" name="name">
												</div>
											</p>
											
											<p class="cs_p">
												<b class="choose">생년월일</b>
												<div class="cs_a2">
												<input type="date" name="birth" id="birth">
												</div>
												
											</p>
											
											<p class="cs_p">
												<b class="choose">연락처</b>
												<div class="cs_a3">
												<input type="text" name="phone" id="phone" placeholder="-추가해서 써라">
												</div>
												
											</p>
											<p class="cs_p">
												<b class="choose">최종학력</b>
													<div class="cs_a4">
													<input type="radio" name="f_edu" value="대졸이상">대졸이상
													<input type="radio" name="f_edu" value="초대졸">초대졸
													<input type="radio" name="f_edu" value="고졸">고졸
													<input type="radio" name="f_edu" value="기타">기타
													</div>
											</p>
											
											<p class="cs_p">
												<b class="choose">수강목적</b>
													<div class="cs_a5">
													<input type="radio" name="purpose" value="취업">취업
													<input type="radio" name="purpose" value="이직">이직
													<input type="radio" name="purpose" value="창업">창업
													<input type="radio" name="purpose" value="기타">기타
													</div>
											</p>
												<p class="cs_p1">
												<b class="choose">각오</b>
												</p>
												<p class="cs_p">
												<div class="cs_a6">
													<textarea rows="4" cols="45" placeholder="각오한마디" name="resolution" style="resize: none;"></textarea>
												</div>
												</p>
										</div>
										</div>
									</div>
									
							</div>
						</div>
						<input type="button" id="button" value="수강신청">
						</form>
						<script type="text/javascript">
						$(function(){
						    $("#button").click(function(){
						        $("#frm").submit();
						    })
						});
						</script>
				</div>
			</div>
		</div>
	</section>
<!-- footer start -->		
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
<!-- footer end -->	
</body>
</html>