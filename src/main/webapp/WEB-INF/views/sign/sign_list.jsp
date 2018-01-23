<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
</head>
<body>
<table>
<c:forEach items="${slist}" var="dto">
		<tr>
			<td>${dto.major}</td>
			<td>
			<a href="${pageContext.request.contextPath}/sign/sign_view?sid=1">내가 신청한거</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>