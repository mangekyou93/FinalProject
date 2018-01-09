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
<link href="${pageContext.request.contextPath}/resources/css/memberMypage.css" rel="stylesheet">
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
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/member/memberMypage" style="color: white;">회원정보</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/memberCheck?select=update">정보수정</a>
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
					<table class="InfoTable">
						<tr>
							<td class="myInfo_titles">회원등급</td>
							<td class="myInfo_contents">
								<c:choose>
									<c:when test="${member.kind eq 'teacher'}">
										강사
									</c:when>
									<c:when test="${member.kind eq 'student'}">
										학생
									</c:when>
									<c:when test="${member.kind eq 'normal'}">
										일반회원
									</c:when>
									<c:otherwise>
										관리자
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<c:if test="${member.kind eq 'student' or member.kind eq 'teacher'}">
							<tr>
								<td class="myInfo_titles">반 이름</td>
								<td class="myInfo_contents">${member.classname}</td>
							</tr>
						</c:if>
						<tr>
							<td class="myInfo_titles">이름</td>
							<td class="myInfo_contents">${sessionScope.member.name}</td>
						</tr>
						<tr>
							<td class="myInfo_titles">휴대전화</td>
							<td class="myInfo_contents">${sessionScope.member.phone}</td>
						</tr>
						<tr>
							<td class="myInfo_titles">이메일 주소</td>
							<td class="myInfo_contents">${sessionScope.member.email}</td>
						</tr>
						<tr>
							<td class="myInfo_titles">생년월일</td>
							<td class="myInfo_contents">${sessionScope.member.age}</td>
						</tr>
						<tr>
							<td class="myInfo_titles">주소</td>
							<td class="myInfo_contents">
								<c:forTokens items="${sessionScope.member.address}" delims="/" var="addr">
									${addr}
								</c:forTokens>
							</td>
						</tr>
						<tr>
							<td class="myInfo_titles">프로필 이미지</td>
							<td class="myInfo_contents">
								<c:choose>
									<c:when test="${!empty profileImage}">
										<div class="profileImage">
											<img src="${pageContext.request.contextPath}/resources/upload/${profileImage.file_name}">
										</div>
										<span class="imgName">${profileImage.ori_name}</span>
									</c:when>
									<c:otherwise>
										이미지를 등록하여 주세요.
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</div>
				<div class="btn_area">
					<a href="${pageContext.request.contextPath}/member/memberCheck?select=update" style="background-color: RGB(18, 165, 244); margin-right: 10px;">정보수정</a>
					<a href="${pageContext.request.contextPath}/member/memberCheck?select=delete" style="background-color: red;">회원탈퇴</a>
				</div>
			</div>
		</div>
	</section>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>