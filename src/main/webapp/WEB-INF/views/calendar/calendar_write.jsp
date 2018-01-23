<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<link href="${pageContext.request.contextPath}/resources/css/calendar_write.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
	    $("#write").click(function(){
	        $("#frm").submit();
	    })
	});
</script>
</head>
<body>
	<h1>달력일정</h1>
<div id="cal_write">
	<form action="${pageContext.request.contextPath}/calendar/calender_write" id="frm" method="post">
		<table>
			<tr>
				<td><input type="text" name="id" placeholder="id를 입력해 주세요"></td>
				<td><input type="text" name="title" placeholder="제목을 입력해주세요."></td>
				<td><input type="text" name="contents"placeholder="내용을 입력해주세요."></td>
				<td><input type='<c:formatDate value="${list.date_start}" pattern="yyyy-MM-dd" placeholder="시작일을 입력해주세요."/>' name="date_start" placeholder="시작일을 입력해주세요."></td>
				<td><input type='<c:formatDate value="${list.date_end}" pattern="yyyy-MM-dd" placeholder="종료일 입력해주세요."/>' name="date_end" placeholder="종료일 입력해주세요."></td>
				<td><input type="date" name="date_start" placeholder="시작일을 입력해주세요."></td>
				<td><input type="date" name="date_end" placeholder="종료일 입력해주세요."></td>
				<td><input type="text" name="classname" placeholder="클래스 입력해주세요."></td>
			</tr>
		</table>
		<input type="button" id="write" value="write">
	</form>
</div>
</body>
</html> --%>