<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
section {
	width: 100%;
	height: 1000px;
}
.allContents {
	width: 1000px;
	height: auto;
	margin: 0 auto;
}
.leftContents {
	width: 250px;
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
.rightContents {
	width: 720px;
	height: auto;
	margin: 0 auto;
	float: right;
}
.contents_header {
	font-size: 25px;
	font-weight: bolder;
}
.contents_wrapper {
	margin-top: 20px;
}
</style>
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
								<a href="${pageContext.request.contextPath}/member/memberAgree">이용약관 및 개인정보취급방침</a>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/member/memberAgree" style="color: white;">회원가입</a>
							</li>
							<li>
								<a href="#">ID/PW 찾기</a>
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
				
				</div>
			</div>
		</div>
	</section>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>