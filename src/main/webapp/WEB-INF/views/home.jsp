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
<script type="text/javascript">
	$(function(){
		$("#myBtn").click(function(){
			$("#myModal").modal();
		});
	});
	
	
</script>
</head>
<body>
<h1>
	Main Page
</h1>
	<p>
		<button type="button" class="btn btn-danger btn-lg" id="myBtn">Login</button>
		<a href="member/memberJoin">회원 가입</a>
	</p>
	
	<p>
		<a href="../member/memberLogout">로그 아웃</a>
		<a href="../member/memberMypage">내 정보</a>
	</p>
	
	<div id="result"></div>
	
	
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
			  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
			   
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

<input id="txt-roomid" placeholder="">
 
 <button id="btn-open-or-join-room">
      open or join room
   </button>
  
   <a href="./">home</a>
   <div>
   <a href="./chat?one=protocolone">1반채팅방 이동</a>
   <a href="./chat?one=protocoltwo">2반채팅방 이동</a>
   </div>
<script>
$(function(){
   $("#btn-open-or-join-room").click(function(){
      
      var connection = new RTCMultiConnection();

      // this line is VERY_important
      connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

      // if you want audio+video conferencing
      connection.session = {
          audio: true,
          video: true
      };

      connection.openOrJoin($("#txt-roomid").val());
            
   });
   
});

</script>
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
