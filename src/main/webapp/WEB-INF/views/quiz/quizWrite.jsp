<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form action="quizWrite"  method="POST"> 
	<p>제목</p>
	<input type="text" name="title" value="홀수 짝수 문제">
	<p>내용</p>
	<textarea name="contents"></textarea>
	<p>레벨</p>
	<input type="text" name="quizLevel">
	<p>출력값</p>
	<input type="text" value="OddEven" name="result">
	<p>반</p>
	<input type="text" value="R" name="classKind">
	
	<p>기본코드</p>
	<textarea name="basiccode">
	
	</textarea>
	<p>기본 클래스</p>
	<input type="text" name="basicClass">
	<br>
	<input type="submit" value="제출하기">
	</form>
	
	
</body>
</html>