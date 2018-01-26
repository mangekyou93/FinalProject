<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/calendar_view.css" rel="stylesheet">
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
						교육 과정
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/calendar/calendar/test" style="color: white;">커리큘럼</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/sign/sign_apply">수강신청</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="rightContents">
				<div class="contents_header">
					<div class="cal_view">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/cal_view.PNG">
					</div>
				</div>
	<div class="contents_wrapper">
			<h1>${viewTitle}</h1>
		<p>강의 내용과 일정을 확인하고 신청하세요</p>
	<div class="table-responsive">
	<table class="table">
		<thead>
      		<tr>
        		<th>#</th>
        		<th>제목</th>
        		<th>글내용</th>
        		<th>개강일</th>
        		<th>종강일</th>
     		 </tr>
   		 </thead>
		<tbody>
		<tr>
			<td></td>
			<td>${view.title}</td>
			<td>${view.contents}</td>
			<td>${view.date_start}</td>
			<td>${view.date_end}</td>
		</tr>
		</tbody>
		<!-- class="content" colspan="3" -->
		<%-- <tr>
			<td>반이름 : ${view.classname}</td>
		</tr> --%>
	</table>
	</div>
	</div>
	
	<div class="move">
		<c:if test="${member.kind eq 'admin'}">
			<a href="${pageContext.request.contextPath}/calendar/calendar_update?id=${view.id}">update</a>
			<a href="${pageContext.request.contextPath}/calendar/calendarDelete?id=${view.id}">delete</a>
		</c:if>
		<c:if test="${member.kind eq 'normal'}">
			<a href="${pageContext.request.contextPath}/sign/sign_apply">수강신청</a>
		</c:if>
		<c:if test="${member.kind eq 'student'}">
			<a href="${pageContext.request.contextPath}/sign/sign_apply">수강신청</a>
		</c:if>
			<a href="${pageContext.request.contextPath}/calendar/test">커리큘럼</a>
	</div>
	
	</div>
</div>
</section>		
	<!-- footer start -->		
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
<!-- footer end -->	
</body>
</html>