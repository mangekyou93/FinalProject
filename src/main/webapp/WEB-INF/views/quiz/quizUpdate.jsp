<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="quizUpdate" method="POST" id ="frm">
	<input type="hidden" name = "num" value="${view.num}">
	<table>
	<tr><td>title <input type="text" name="title" value="${view.title}"></td></tr>
	<tr><td>contents <textarea name="contents">${view.contents}</textarea></td></tr>
	<tr><td>quizLevel <input type="text" name="quizLevel" value="${view.quizLevel}"></td></tr>
	<tr><td>result <input type="text" name="result" value="${view.result}"></td></tr>
	<tr><td>classKind <input type="text" name="classKind" value="${view.classKind}"></td></tr>
	<tr><td>basiccode <textarea name="basiccode">${view.basiccode}</textarea></td></tr>
	<tr><td>basicClass <input type="text" name="basicClass" value="${view.basicClass}"></td></tr>
			
	
	
	</table>
	<input type="submit" id="saveButton" value="수정">
</form>
</body>
</html>