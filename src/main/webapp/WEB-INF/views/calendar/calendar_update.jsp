<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="${pageContext.request.contextPath}/resources/css/calendar_update.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
	    $("#write").click(function(){
	        $("#frm").submit();
	    })
	});
</script>
</head>
<body>

<h1>calendar Update Form</h1>

<form action="${pageContext.request.contextPath}/calendar/calendar_update" method="post" id="frm">
		<input type="hidden" name="num" value="${view.num}">
		<table>
		<tr>
			<td><input type="text" name="title" value="${view.title}"></td>
			<%-- <td><input type="text" name="contents" value="${view.contents}"></td> --%>
			<td><input type="date" name="date_start"  value="${view.date_start}"><!--  readonly="readonly" --></td>
			<td><input type="date" name="date_end" value="${view.date_end}"><!--  readonly="readonly" --></td>
			<td><input type="text" name="classname" value="${view.classname}"><!--  readonly="readonly" --></td>
			
		</tr>
		<tr>
			<td class="content" colspan="2"><textarea id="contents" name="contents" draggable="false">${view.contents}</textarea></td>
		</tr>
		
	</table>
	
	<input type="button" id="write" value="수정">
	</form>
</body>
</html>