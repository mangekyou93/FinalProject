<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/codemirror.css">
<script
	src="${pageContext.request.contextPath}/resources/css/codemirror.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/matchbrackets.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/show-hint.css">
<script
	src="${pageContext.request.contextPath}/resources/css/show-hint.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/clike.js"></script>
<style>
.button-3d {
	position: relative;
	width: auto;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #f39c12;
	background: #e67e22;
	text-align: center;
	padding: 16px 18px 14px;
	margin: 12px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px #d35400;
	-moz-box-shadow: 0px 6px 0px #d35400;
	box-shadow: 0px 6px 0px #d35400;
	float: right;;
}

.button-3d:active {
	-webkit-box-shadow: 0px 2px 0px #d35400;
	-moz-box-shadow: 0px 2px 0px #d35400;
	box-shadow: 0px 2px 0px #d35400;
	position: relative;
	top: 4px;
}

.CodeMirror {
	border: 2px inset #dee;
}

.top {
	display: block !important;
	padding-bottom: 0;
	overflow: hidden !important;
	width: auto;
	border-top: 0;
	height: 10%;
}

.CodeMirror cm-s-default {
	height: 450px;
}

#result {
	font-family: 굴림;
	font-size: 9pt;
	color: (rgb(118, 17, 17);
	letter-spacing: 120%;
	line-height: 150%;
	background-color: rgb(243, 243, 243);
	padding: 5px;
	border-width: 1;
	border-color: rgb(250, 196, 196);
	border-style: solid;
	margin-top: 10px;
}

hr.garo {
	border: solid black;
	border-width: 1px 0 0;
}
</style>
<script type="text/javascript">
	window.onfocus = function() {
	}
	window.onload = function() {
		window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
		window.moveTo(0, 0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
		window.resizeTo(1280, 800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
		window.scrollTo(0, 250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정

	}
</script>
</head>

<body style="background-color: aliceblue; padding-left: 10px;">
	<div style="background-color: gray;" class="top">

		<img
			style="display: inline-block; width: auto; height: auto; margin-right: 1%; vertical-align: middle; max-width: 30px; margin-left: 1%; max-height: 30px;"
			src="${pageContext.request.contextPath}/resources/images/symbol.png">
		<h4 style="display: inline-block; position: inherit;">
			<a href="#" id="home">과제게시판</a> > ${view.title} 
		</h4>
	</div>
	<span
		style="background-color: green; float: left; display: inline-block;"></span>
	<div>
		<!-- 문제	내기 -->
		<div
			style="width: 400px; float: left; height: 700px; display: inline-block; background-color: white-space; margin-right: 2%;">

			<div style="height: 30px;">
				<p><h5>${view.num}.${view.title}  ${view.quizLevel}</h5></p>
				
				<hr class="garo">
			</div>
			<div style="height: 70%;">
				<p><h4>${view.contents}</h4></p>
			</div>
		</div>
		<!-- 문제	끝 -->
		<div style="width: 70%; height: 60%;; display: inline-block;">
			<div>
				
					<div><h3>소스</h3></div>
				<form action="quizView" method="POST">
					<input type="hidden" value="${view.basicClass}" id="basicClass"
						name="basicClass">
					<textarea id="java-code" name="text"
						style="height: 450px; display: inline-block;">
				${view.basiccode}
</textarea>
					<div><h4>실행결과</h4></div>
					<textarea style="width: 100%; height: 250px; overflow: auto;"
						readonly="readonly" id="result"></textarea>
					<br>
					<div id=button_Div>

						<input type="button" class="button-3d btn btn-info btn-lg"
							id="submit" data-toggle="modal" data-target="#myModal" value="제출">
						<input value="컴파일" class="button-3d btn btn-info btn-lg" id="ing"
							type="button"><br>

					</div>
				</form>
			</div>
<!-- modal -->
			<div>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog" >
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">OOO님!</h4>
							</div>
							<div class="modal-body" style="text-align: center;">
								<div id ="tt"></div>
								<img id="resultImg" style="width: 200px ; height: 200px;" src="${pageContext.request.contextPath}/resources/images/Ximg.jpg">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
			</div>
<!-- modal -->


			<script>
				var javaEditor = CodeMirror.fromTextArea(document
						.getElementById("java-code"), {
					lineNumbers : true,
					matchBrackets : true,

					mode : "text/x-java",

					val : document.getElementById("java-code").value
				});

				$(function() {

					$("#ing").click(function() {

						$.ajax({
							url : "quizView",
							type : "POST",
							data : {
								text : javaEditor.getValue(),
								basicClass : $("#basicClass").val()
							},
							success : (function(data) {
								$("#result").val(data);

							})

						});
					});
					
					
					$("#submit").click(function() {
						$("#result").val("");
						$("#tt").html("<p><h3>진행중입니다.</h3></p>");
						
						$.ajax({
							url : "../ajax/quizCompiler",
							type : "POST",
							data : {
								text : javaEditor.getValue(),
								basicClass : $("#basicClass").val(),
								num : ${view.num}
							},
							success : (function(data) {
								
								
								
								
								 for(var i = 0 ; i <data.size ; i ++){
									$("#result").val($("#result").val()+data.content);				
								} 
								 
								if((data.result)=='suc'){
									$("#tt").html("<p><h3>성공입니다!</h3></p>");
									$("#resultImg").prop("src","${pageContext.request.contextPath}/resources/images/Oimg.jpg");
								}
								else{
									$("#tt").html("<p><h3>실패입니다!</h3></p>");
									$("#resultImg").prop("src","${pageContext.request.contextPath}/resources/images/Ximg.jpg");
								}
							})
						});
						
					});

				});
			</script>
		</div>


	</div>
</body>
</html>