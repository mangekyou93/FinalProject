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
<link href="${pageContext.request.contextPath}/resources/css/teacherIntro.css" rel="stylesheet">
</head>
<body>
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"></c:import>
		<section>
			<div class="allContents">
				<div class="leftContents">
					<div class="leftMenu">
						<div class="leftMenu_header">
							학원 소개
						</div>
						<div class="leftMenu_wrapper">
							<ul>
								<li>
									<a href="#">교육 이념</a>
								</li>
								<li style="background-color: RGB(18, 165, 244);">
									<a href="${pageContext.request.contextPath}/intro/teacherIntro" style="color: white;">강사 소개</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/intro/roadIntro">찾아오시는 길</a>
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
						<c:forEach items="${teachers}" var="dto">
							<div class="teachers">
								<div class="teachers_info">
									<div class="info_profileImg">
										<img src="${pageContext.request.contextPath}/resources/upload/${dto.file_name}">
									</div>
									<div class="info_teacherName">
										${dto.name} <span style="font-size: 27px;">강사</span>
									</div>								
								</div>
								<div class="teachers_career">
									<div class="career_header">
										<span class="glyphicon glyphicon-education" aria-hidden="true" style="font-size: 25px; top: 5px;"></span>
										경력
									</div>
									<div class="career_contents">
										${dto.career}
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>