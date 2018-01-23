<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sign_view.css" rel="stylesheet">
</head>
<body>
<table>
		<tr>
			<td>제목: ${sview.title}</td>
		</tr>
		<tr>
			<td class="content" colspan="3">글내용:${sview.contents}</td>
		</tr>
		<tr>
			<td>개강일: ${sview.date_start}</td>
			<td>종강일: ${sview.date_end}</td>
			<td>반이름 : ${sview.classname}</td>
			
			
			<td>교과목 : ${sview.major}</td>
			<td>신청방법 : ${sview.type}</td>
			<td>이름 : ${sview.name}</td>
			<td>생일 : ${sview.birth}</td>
			<td>전화번호 : ${sview.phone}</td>
			<%-- <td>최종학력 : ${sview.F_edu}</td> --%>
			<td>교육모적 : ${sview.purpose}</td>
			<td>각오 : ${sview.resolution}</td>
			<td>지점 : ${sview.location}</td>
			<td>id : ${sview.sid}</td>
		</tr>
	</table>
</body>
</html>