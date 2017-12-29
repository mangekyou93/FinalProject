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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#myBtn").click(function(){
			$("#myModal").modal();
		});
		
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
	<header>
		<div class="header_logo"> 로고 들어갈 자리 </div>
		<div class="header_logMenu">
			<a href="javascript:void(0)" class="loginBtn" id="myBtn">Login</a>
			<span>|</span>
			<a href="member/memberJoin" class="joinBtn">Join</a>
		</div>
	</header>
	
<section>
<%-- 	<div class="carousel_container" width="100%">
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	
	      <div class="item active">
	        <img src="${pageContext.request.contextPath}/resources/images/Koala.jpg" width="100%" style="height: 400px;">
	        <div class="carousel-caption">
	          <h3>Chania</h3>
	          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/images/Penguins.jpg" width="100%" style="height: 400px;">
	        <div class="carousel-caption">
	          <h3>Chania</h3>
	          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
	        </div>
	      </div>
	    
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/images/Tulips.jpg" width="100%" style="height: 400px;">
	        <div class="carousel-caption">
	          <h3>Flowers</h3>
	          <p>Beautiful flowers in Kolymbari, Crete.</p>
	        </div>
	      </div>
	  
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>
	</div> --%>
	
	<nav>
		<div class="nav_menu">
			<ul>
				<li id="nMenu1">교육과정</li>
				<li id="nMenu2">커뮤니티</li>
				<li id="nMenu3">나의 메뉴</li>
				<li id="nMenu4">상담센터</li>
			</ul>
		</div>
	</nav>
	<div id="menus1" class="menus">
		<div>
			<ul>
				<li><a href="#">학원 정보</a></li>
				<li><a href="#">개강 안내</a></li>
				<li><a href="#">강사 소개</a></li>
			</ul>
		</div>
	</div>
	<div id="menus2" class="menus">
		<div>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">취업 정보 게시판</a></li>
				<li><a href="#">후기 게시판</a></li>
			</ul>
		</div>
	</div>
	<div id="menus3" class="menus">
		<div>
			<ul>
				<li><a href="#">시험</a></li>
				<li><a href="#">123</a></li>
				<li><a href="#">456</a></li>
				<li><a href="#">789</a></li>
			</ul>
		</div>
	</div>
	<div id="menus4" class="menus">
		<div>
			<ul>
				<li><a href="#">Q&A</a></li>
				<li><a href="#">FAQ</a></li>
				<li><a href="#">화상 상담 센터</a></li>
				<li><a href="#">오시는 길</a></li>
			</ul>
		</div>
	</div>
</section>

<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>

<!-- Modal -->
	<div class="container">
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Login</h4>
	        </div>
	        <div class="modal-body">
	          <form action="member/memberLogin" role="form">
	            <div class="form-group">
	              <label for="id"><span class="glyphicon glyphicon-user"></span> Username</label>
	              <input type="text" class="form-control" id="id" placeholder="Enter email">
	            </div>
	            <div class="form-group">
	              <label for="pw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
	              <input type="text" class="form-control" id="pw" placeholder="Enter password">
	            </div>
	            <div class="checkbox">
	              <label><input type="checkbox" value="" checked>Remember me</label>
	            </div>
	            <button type="submit" class="btn btn-default btn-success btn-block">
	            	<span class="glyphicon glyphicon-off"></span> Login
	           	</button>
	           	  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
				  <div id="naver_id_login"></div>
				   
	          </form>
	        </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
	          <p>Not a member? <a href="member/memberJoin">Sign Up</a></p>
	          <p>Forgot <a href="#">Password?</a></p>
	        </div>
	      </div>
	    </div>
	  </div> 
	</div>

<!-- 네이버 아이디로 로그인 자바스크립트 -->
	<script type="text/javascript">
		var local = "";
	  	var naver_id_login = new naver_id_login("uRjYXEHnU9xxXFdZ8rmp", "http://localhost/ctrl/");
	  	var state = naver_id_login.getUniqState();
	  	
		naver_id_login.setButton("green", 12,50);
		naver_id_login.setDomain("");
		naver_id_login.setState(state);
	  
		naver_id_login.init_naver_id_login();
		
	  // 네이버 사용자 프로필 조회
	  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
		  var name = naver_id_login.getProfileData('name');
		  var email = naver_id_login.getProfileData('email');
	  	 
		$.ajax({
	    	type:'POST',
	    	url:'member/memberCheck',
	    	data:
	    	{
	    		name:name,
	    		email:email
	    	},
	    	success:function(){
	    		
	    	}
	    });
	  
	  }
	  
	</script>
</body>
</html>
