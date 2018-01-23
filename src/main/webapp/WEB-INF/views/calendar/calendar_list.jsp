<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
<div id="calender_list">
	<h1>calendar list Page</h1>
	
	<form name="frm" action="${pageContext.request.contextPath}/calendar/calendar" method="get">
	<input type="hidden" name="curPage" value="1">
		<select name="kind">
			<option>Title</option>
			<option>Contents</option>
		</select>
		<input type="text" name="search">
		<button>검색</button>
	</form>
	
	<table>
		<tr>
			<th>글제목</th>
			<th>글내용</th>
			<th>등록일</th>
			<th>마감일</th>
			<th>반</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>
			<a href="${pageContext.request.contextPath}/calendar/calendar_view?num=${dto.num}">${dto.title}</a>
			</td>
			<td>${dto.contents}</td>
			<td>${dto.date_start}</td>
			<td>${dto.date_end}</td>
			<td>${dto.classname}</td>
		</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${pager.curBlock gt 1}">
			<span class="list" title="${pager.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<span class="list" title="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<span class="list" title="${pager.lastNum+1}">[다음]</span>
		</c:if>
	</div>
</div>
</body>
</html>