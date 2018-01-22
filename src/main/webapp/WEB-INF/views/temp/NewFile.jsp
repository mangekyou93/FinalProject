<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">

<title>INDEX</title>
<style type="text/css">
	#spacebar {
 		height:0;
	}
</style>
</head>
<body>
	<!--  header start -->
		<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/temp/header.jsp"/>
	<!-- header end -->
	<!-- contents -->
	<section>
	<div class="contents_all">
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner">
					<div class="item active">
						<img src="resources/images/1.jpg" alt="banner1"
							style="width: 100%; height: 400px;">
					</div>

					<div class="item">
						<img src="resources/image/2.jpg" alt="banner2"
							style="width: 100%; height: 400px;">
					</div>

					<div class="item">
						<img src="resources/image/3.jpg" alt="banner3"
							style="width: 100%; height: 400px;">
					</div>
				</div>

				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" data-slide="next"> 
					<span class="glyphicon glyphicon-chevron-right"></span> 
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="slide_bottom_nav">
			<div class="slide_bottom_nav_wrap">
				<div class="slide_bottom_nav_span">
					<p>코딩이 습관이 되는곳! - OO IT학원</p>
				</div>
				<div class="slide_bottom_nav_img">
					<a href="#"><img alt="nav1" src="resources/image/nav1_off.png"
						onmouseover="this.src='resources/image/nav1_on.png'"
						onmouseout="this.src='resources/image/nav1_off.png'"></a> <a
						href="#"><img alt="nav2" src="resources/image/nav2_off.png"
						onmouseover="this.src='resources/image/nav2_on.png'"
						onmouseout="this.src='resources/image/nav2_off.png'"></a> <a
						href="#"><img alt="nav3" src="resources/image/nav3_off.png"
						onmouseover="this.src='resources/image/nav3_on.png'"
						onmouseout="this.src='resources/image/nav3_off.png'"></a>
				</div>
			</div>
		</div>
		<div class="contents_wrap">
			<div class="contents_main">
				<div class="contents_menu_all">
					<div class="contents_top_left">
						<ul class="contents_ul">
							<li><a href="#"><img class="contents_img" src="resources/image/banner_01.png"></a></li>
							<li><a href="#"><img class="contents_img" src="resources/image/banner_03.png"></a></li>
							<li><a href="#"><img style="width:254px;" class="contents_img" src="resources/image/banner_04.png"></a></li>
						</ul>
					</div>
					<div class="contents_bottom_left">
					
					</div>
				</div>
				<div class="contents_menu_top">
					<div class="contents_top_right">
						 <p class="contents_right_p">공지사항</p>
						 <ul class="contents_right_ul">
						 	<li><a href="#">임시 입니다1</a><span>2017-01-01</span></li>
						 	<li><a href="#">임시 입니다2</a><span>2017-01-01</span></li>
						 	<li><a href="#">임시 입니다3</a><span>2017-01-01</span></li>
						 	<li><a href="#">임시 입니다4</a><span>2017-01-01</span></li>
						 	<li><a href="#">임시 입니다5</a><span>2017-01-01</span></li>
						 </ul>
					</div>
					<div class="contents_botton_right">
						<p class="contents_right_p">수강후기</p>
						<ul class="contents_right_ul">
							<li><a href="#">수강 후기 1</a><span>2017-01-01</span></li>
							<li><a href="#">수강 후기 2</a><span>2017-01-01</span></li>
							<li><a href="#">수강 후기 3</a><span>2017-01-01</span></li>
							<li><a href="#">수강 후기 4</a><span>2017-01-01</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!— contents  —>
	<!— footer start —>
		<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/temp/footer.jsp"/>
</body>
	<!— footer end —>
</html>