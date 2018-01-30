<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
<script type="text/javascript">
	var message = '${message}';

	$(function(){
		
		if(message != '')
		{
			alert(message);
		}
		
		
	});
</script>
</head>
<body>
<!--  header start -->
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"></c:import>
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
							<img src="resources/images/banner_java.jpg" alt="banner1"
								style="width: 100%; height: 400px;">
						</div>
	
						<div class="item">
							<img src="resources/images/banner_notice.jpg" alt="banner2"
								style="width: 100%; height: 400px;">
						</div>
	
						<div class="item">
							<img src="resources/images/banner_simpleEdu.jpg" alt="banner3"
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
						<p>코딩이 습관이 되는곳! - IT GATEWAY</p>
					</div>
					<div class="slide_bottom_nav_img">
						<a href="${pageContext.request.contextPath}/intro/roadIntro"><img alt="nav1" src="resources/images/nav1_off.png"
							onmouseover="this.src='resources/images/nav1_on.png'"
							onmouseout="this.src='resources/images/nav1_off.png'"></a> <a
							href="${pageContext.request.contextPath}/calendar/test"><img alt="nav2" src="resources/images/nav2_off.png"
							onmouseover="this.src='resources/images/nav2_on.png'"
							onmouseout="this.src='resources/images/nav2_off.png'"></a> <a
							href="#"><img alt="nav3" src="resources/images/nav3_off.png"
							onmouseover="this.src='resources/images/nav3_on.png'"
							onmouseout="this.src='resources/images/nav3_off.png'"></a>
					</div>
				</div>
			</div>
			<div class="contents_wrap">
				<div class="contents_main">
					<div class="contents_menu_all">
						<div class="contents_top_left">
							<ul class="contents_ul">
								<li><a href="${pageContext.request.contextPath}/calendar/test"><img class="contents_img" src="resources/images/banner_01.png"></a></li>
								<li><a href="${pageContext.request.contextPath}/sign/sign_apply"><img class="contents_img" src="resources/images/banner_03.png"></a></li>
								<li><a href="#"><img style="width:254px;" class="contents_img" src="resources/images/banner_04.png"></a></li>
							</ul>
						</div>
						<div class="contents_bottom_left">
							<ul class="contents_ul">
								<li><a href="#"><img class="contents_img" src="resources/images/bottom_quick01.jpg"></a></li>
								<li><a href="#"><img class="contents_img" src="resources/images/bottom_quick02.jpg"></a></li>
								<li><a href="javascript:void(0)"><img style="width:254px;" class="contents_img" src="resources/images/banner_06.png"></a></li>
							</ul>
						</div>
					</div>
					<div class="contents_menu_top">
						<div class="contents_top_right">
							 <p class="contents_right_p">자유게시판</p>
							 <ul class="contents_right_ul">
							 	<li><a href="#">전괜찮아요</a><span>2017-12-30</span></li>
								<li><a href="#">꿀렁입니다</a><span>2017-11-01</span></li>
								<li><a href="#">전문적인놈</a><span>2017-11-01</span></li>
								<li><a href="#">배그좀하자</a><span>2017-11-01</span></li>
							 </ul>
						</div>
						<div class="contents_botton_right">
							<p class="contents_right_p">수강후기</p>
							<ul class="contents_right_ul">
								<li><a href="#">사기먹었다</a><span>2018-01-30</span></li>
								<li><a href="#">후기입니다</a><span>2018-01-01</span></li>
								<li><a href="#">강사님좋음</a><span>2018-01-01</span></li>
								<li><a href="#">질문받는다</a><span>2017-07-20</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- contents -->
	
<!-- footer start -->		
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
<!-- footer end -->	
</body>
</html>
