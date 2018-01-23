<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".header_nav_menu ul li").hover(function() {
			$(this).find("ul").stop().fadeToggle(300);
		});
		var m = "${message}";
		if(!(m=="")){
			alert(m);
		}
		
		$("#write").click(function(){
			location.href='quizWrite';
		});
		
	});
	
	/* 삭제 이벤트 */
	var deleteIcon=function(num){
		
		 if(confirm("삭제하시겠습니까?"))
		 {
		   location.href="./quizDelete?num="+num;
		  }
		 else
		 {
			
		 }
	};

	/* 삭제 이벤트 */
	var updateIcon=function(num){
		
		 if(confirm("수정하시겠습니까?"))
		 {
		   location.href="./quizUpdate?num="+num;
		  }
		 else
		 {
			
		 }
	};
	//selectOne
	var quizTitle=function(num){
		location.href="./quizView?num="+num;
	}
	
	
	
</script>
<style type="text/css">
.deleteIcon{
	cursor: pointer;
}
.updateIcon{
	cursor: pointer;
}
section {
	width: 100%;
	height: auto;
}
.allContents {
	width: 65%;
	height: auto;
	margin: 0 auto;
}
.leftContents {
	width: 25%;
	height: auto;
	float: left;
}
.leftMenu {
	width: 100%;
	height: auto;
}
.leftMenu_header {
	width: 100%;
    height: 40px;
    background-color: #3f4b5e;
    color: white;
    font-size: 20px;
    font-weight: bolder;
    line-height: 40px;
    padding-left: 10px;
}
.leftMenu_wrapper {
	width: 100%;
	height: auto;
	margin-top: 20px;
}
.leftMenu_wrapper ul {
	list-style: none;
}
.leftMenu_wrapper ul li {
	width: 100%;
    height: 40px;
    line-height: 40px;
    border-bottom: 1px solid #E0E0E0;
    padding-left: 10px;
}
.leftMenu_wrapper ul li a {
	width: 100%;
	height: 100%;
	color: black;
	font-size: 15px;
	font-weight: bold;
	display: block;
}
.leftMenu_wrapper ul li a:hover {
	color: RGB(18, 165, 244);
	text-decoration: none;
}
.containerMain {
	width: 70%;
	height: auto;
	overflow: hidden;
	padding-left: 16px;
	padding-right: 16px;
	max-width: 100%;
	box-sizing: border-box;
	background-color: yellow;
	margin: 0 auto;
}

.row {
	width: 100%;
	height: 100%;
	max-width: 100%;
	background-color: red;
	margin: 0 auto;
}

.headerMain {
	background-color: blue;
	width: 100%;
	height: 30px;
	margin: 0 auto;
	margin-top: 20px;
}

.level {
	width: 100%;
	height: auto;
	overflow: hidden;
	margin: 0 auto;
	margin-top: 3px;
	background-color: white;
	margin: 0 auto;
}
.quizTitle{
margin-top:3px;
cursor: pointer;
}
.table_quiz {
	width: calc(50% - 16px);
	margin: 1rem 0.5rem 0 0.5rem;
	transition-duration: 0.06s;
	box-shadow: inset -1px 0 #DEE6EA, inset 0 1px #DEE6EA, inset 0 -1px
		#DEE6EA;
	border-radius: 3px;
	border-left: 6px solid #DEE6EA;
	padding: 0.9375rem;
	
	float: left;
	position: relative;
	min-height: 1px;
	box-sizing: border-box;
}

.table_container {
	margin-left: 0px;
	margin-right: 0px;
	background-color: gray;
	height: auto;
	overflow: hidden;
	width: 100%;
}

body {
	font-family: "roboto", "맑은 고딕", malgun gothic, "돋움", Dotum, sans-serif;
	font-size: 16px;
	line-height: 24px;
	color: black;
}

.pageination {
	margin: 0 auto;
}

.page_contain {
	background-color: navy;
	text-align: center;
}

.levelbtn {
	display: inline-block;
	background-color: #F44336;
	/* 마진 & 패딩 */
	margin-bottom: 3px;
	margin-right: 0.0625rem;
	/* 테두리  */
	border-radius: 0;
	border-width: 1px;
	font-size: 5px;
	line-height: 20px;
	text-align: center;
	vertical-align: middle;
	touch-action: manipulation;
	border: 1px solid transparent !important;
	white-space: nowrap;
	font-weight: 500;
	cursor: pointer;
	box-sizing: border-box;
	font-family: "roboto", "맑은 고딕", malgun gothic, "돋움", Dotum, sans-serif;
	word-break: keep-all;
	-webkit-tap-highlight-color: transparent;
	width: 14%;
}

.algorithm-levels col-lg-9 col-md-12 col-sm-12 col-xs-12 {
	display: flex;
	width: 100%;
	float: left;
	position: relative;
	min-height: 1px;
	padding: 0 8px;
	box-sizing: border-box;
}

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
	padding: 8px 10px 6px;
	margin: 12px 1px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px #d35400;
	-moz-box-shadow: 0px 6px 0px #d35400;
	box-shadow: 0px 6px 0px #d35400;
}

.button-3d:HOVER {
	text-decoration: none;
	
}

.button-3d:active {
	-webkit-box-shadow: 0px 2px 0px #d35400;
	-moz-box-shadow: 0px 2px 0px #d35400;
	box-shadow: 0px 2px 0px #d35400;
	position: relative;
	top: 4px;
	text-decoration: none;
color: black;
}
.flex-space-between{
}
.updateIcon{
	float: right;
}

.deleteIcon{
	float: right;
}
</style>


</head>
<body>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp" />
	<section>
		<div class="allContents">
			<div class="leftContents">
				<div class="leftMenu">
					<div class="leftMenu_header">
						나의 메뉴
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li>
								<a href="#">반 게시판</a>
							</li>
							<li>
								<a href="#">반 메신져</a>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="#" style="color: white;">과제 게시판</a>
							</li>
							<li>
								<a href="#">팀 프로젝트</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="containerMain">
				<div class="row">
					<div class="headerMain">
						<p>${list[0].classKind}문제</p>
					</div>
					<div class="level">
						<div class="algorithm-levels col-lg-9 col-md-12 col-sm-12 col-xs-12">
		
							<a href="#" id="test" class="button-3d" style="text-decoration: none;">Level 1</a> 
							<a href="#"id="test" class="button-3d" style="text-decoration: none;">Level 2</a>
							<a href="#" id="test" class="button-3d" style="text-decoration: none;">Level 3</a>
							<a href="#" id="test" class="button-3d" style="text-decoration: none;">Level 4</a>
		
						</div>
		
					</div>
					<div class="table_container">
					<c:forEach items="${list}" var="dto">
						<div class="table_quiz">
			<div style="float: left;margin-bottom: 3px; margin-right: 3px;"> <img src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/check.png"></div>
								
								<span class="updateIcon"><img onclick="javascript:updateIcon(${dto.num});" id="updateIcon" style="width: 20px; height:20px; margin-right: 2px;" src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/updateIcon.png"></span>
								<span class="deleteIcon"><img onclick="javascript:deleteIcon(${dto.num});"  style="width: 20px; height:20px;" src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/deleteIcon.png"></span>
							<div class="flex-space-between">
							
								<h5 class="quizTitle" onclick="javascript:quizTitle(${dto.num});">${dto.title}</h5>
							</div>
		
							<div class="card-algorithm-content">
								<p class="card-algorithm-info">
									<span>${dto.quizLevel}</span>
									<!--<span>성공율: 0%</span>-->
									<span>완료: 1075명</span>
								</p>
								
							</div>
						</div>
						</c:forEach>
						<!-- 테이블 컨테이너 -->
		
					</div>
					<div class="page_contain">
						<!-- 페이징처리 -->
						<ul class="pagination">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul>
						
					<button id="write" style="float: right;  margin-top: 25px; margin-right: 25px;"> 글쓰기</button>
					</div>
					
					<!-- 페이징 처리  -->
				</div>
			</div>
		</div>
	
		
	</section>
	<h1>test</h1>
	<a href="quizInput.exec">test</a>
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp" />
</body>
</html>