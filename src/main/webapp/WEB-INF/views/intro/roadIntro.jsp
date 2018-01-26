<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/roadIntro.css" rel="stylesheet">

</head>
<body>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"></c:import>
	<section>
		<div class="allContents">
			<div class="leftContents">
				<div class="leftMenu">
					<div class="leftMenu_header">
						회원가입
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li>
								<a href="#">교육 이념</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/intro/teacherIntro">강사 소개</a>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/intro/roadIntro" style="color: white;">찾아오시는 길</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="rightContents">
				<div class="contents_header">
					${menuTitle}			
				</div>
				<div class="contents_wrapper">
					<div id="map"></div>
					<script>
						function initMap() {
					    	var uluru = {lat: 37.499, lng: 127.0329};
					        var map = new google.maps.Map(document.getElementById('map'), {
					          zoom: 19,
					          center: uluru
					        });
					        var marker = new google.maps.Marker({
					          position: uluru,
					          map: map
					        });
					      }
					</script>
					<script async defer
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV_xvLlH4AMIFeiDKA-8mXPfEpjz3gRI4&callback=initMap">
					</script>
					<div class="location_info">
						<table>
							<tr>
								<td class="info_header">주소</td>
								<td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F <br> (T: 1544-9970 / F: 070-8290-2889)</td>
							</tr>
							<tr>
								<td class="info_header">버스</td>
								<td>
									역삼역.포스코P&S타워 정류장 <br>
									<div>
										<img src="${pageContext.request.contextPath}/resources/images/blueBus.jpg">
									</div>
									146 / 740 / 341 / 360
									<div style="margin-left: 10px;">
										<img src="${pageContext.request.contextPath}/resources/images/redBus.jpg">
									</div>
									1100 / 1700 / 2000 / 7007 / 8001
								</td>
							</tr>
							<tr>
								<td class="info_header">지하철</td>
								<td>지하철 2호선 역삼역 3번출구 100m</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>