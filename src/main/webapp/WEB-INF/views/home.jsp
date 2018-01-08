<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<script type="text/javascript">
	var message = '${message}';
	
	$(function(){
		
		if(message != '')
		{
			alert(message);
		}
		
		$("#nMenu1").mouseover(function(){
			$(".nMenus_on").prop("class", "");
			$(this).prop("class", "nMenus_on");
			$(".menus_on").prop("class", "menus");
			$("#menus1").prop("class", "menus_on");
		});
		$("#nMenu2").mouseover(function(){
			$(".nMenus_on").prop("class", "");
			$(this).prop("class", "nMenus_on");
			$(".menus_on").prop("class", "menus");
			$("#menus2").prop("class", "menus_on");
		});
		$("#nMenu3").mouseover(function(){
			$(".nMenus_on").prop("class", "");
			$(this).prop("class", "nMenus_on");
			$(".menus_on").prop("class", "menus");
			$("#menus3").prop("class", "menus_on");
		});
		$("#nMenu4").mouseover(function(){
			$(".nMenus_on").prop("class", "");
			$(this).prop("class", "nMenus_on");
			$(".menus_on").prop("class", "menus");
			$("#menus4").prop("class", "menus_on");
		});
	});
</script>
</head>
<body>
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section>
	
	</section>
	
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>
