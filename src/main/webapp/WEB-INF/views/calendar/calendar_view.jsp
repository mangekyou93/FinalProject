<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="${pageContext.request.contextPath}/resources/css/calendar_view.css" rel="stylesheet">
</head>
<body>
<h1>calendar View Page</h1>
	
	<table>
		<tr>
			<td>제목: ${view.title}</td>
		</tr>
		<tr>
			<td class="content" colspan="3">글내용:${view.contents}</td>
		</tr>
		<tr>
			<td>개강일: ${view.date_start}</td>
			<td>종강일: ${view.date_end}</td>
			<td>반이름 : ${view.classname}</td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/calendar/calendar_update?id=${view.id}">update</a>
	<a href="${pageContext.request.contextPath}/calendar/calendarDelete?id=${view.id}">delete</a>
	<a href="${pageContext.request.contextPath}/sign/sign_apply">수강신청</a>
	<a href="${pageContext.request.contextPath}/calendar/test">calender</a>
</body>
</html>