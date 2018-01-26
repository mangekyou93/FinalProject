<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>B반 메신져</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/sockjs-0.3.4.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ListUtil.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="//cdn.jsdelivr.net/emojione/1.3.0/assets/css/emojione.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">

<!-- Our styles import -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">


</head>
<body class="container" id="body">
<input type="hidden" id="username" value="${member.name}">
	<%-- <section class="wrap">
		<input type="hidden" id="username" value="${member.name}">

		<div class="chat_center">

			<div class="exit">
				<!-- 이름: <input type="text" id="nickname"> <input type="button"
					id="enterBtn" value="입장"> -->
				<input type="button" id="exitBtn" value="나가기">
			</div>

			<!-- <div class="chat">
				<div id="chatArea">
					<div id="chatMessageArea"></div>
				</div>
			</div> -->

			<div class="chat_text">
				<!-- <input type="text" id="message" placeholder="메시지를 입력하세요.."> -->
				<!-- <input type="button" id="sendBtn" value="전송"> -->
			</div>
		</div>

		<div class="chat_right">
			<div class="menu">
				<div class="menu_contents">
					<!-- <div id=guest></div> -->
				</div>
			</div>

		</div>

	</section> --%>
	<%-- 
	<div class="container" ng-controller="ChatController">
			<toaster-container></toaster-container>
			
			<div class="row">
				<nav class="navbar navbar-inverse navbar-embossed" role="navigation">
		            <div class="collapse navbar-collapse" id="navbar-collapse-01">
		              <h1>A반 메신져</h1>
		              <ul class="nav navbar-nav navbar-right">           
		                <li><a id="exitBtn">Logout (${member.name})</a></li>
		               </ul>
		            </div><!-- /.navbar-collapse -->
		          </nav><!-- /navbar -->
			</div>
	        <div class="row">
        		<div class="col-xs-4">
        			<h4>대화상대 []</h4>
        			<div class="share">
	        			<ul ng-repeat="participant in participants">
	        				<li>
	        					<div id=guest></div>
	        					
	        				</li>
	        			</ul>
        			</div>
        		</div>
        		<div class="col-xs-8 chat-box">
        			<h4>대화 내용</h4>
	        		<div id="chatMessageArea">
	       	 			<small print-message></small>
	      			</div>
        		</div>
        	</div>
        	<div class="row">
       			<div class="form-group">
				  <input id="message" type="text" class="form-control" placeholder="메세지를  입력하세요..." ng-model="newMessage" ng-keyup="$event.keyCode == 13 ? sendMessage() : startTyping()"/>
				<input type="button" id="sendBtn" value="전송">
				</div>
        	</div>
	    </div> --%>
	    
	    <div class="header">
        <h2>B반 메신져</h2>
    </div>

    <!-- Display all messagess -->
    <div>
        <div id="chatMessageArea" class="col-12 all-messages"></div>
    </div>

    <!-- Input and button send -->
    <form class="row" id="form">
        <input id="message" placeholder="메세지를 입력하세요...." type="text" class="form-control message-input col-7 col-sm-8 col-md-10">
        <button id="sendBtn"  class="btn btn-primary submit-btn col-5 col-sm-4 col-md-2">보내기</button>
    </form>




	<script type="text/javascript">
	var wsocket;	
	var geustlist = new ArrayList();
	var head = "usr:";
	window.onload = pageLoad;
	
	function pageLoad() {
		wsocket = new SockJS("/ctrl/chat.sockjsA");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		out();
		wsocket.close();
	}
	function onOpen(evt) {
		join();
		
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}else if (data.substring(0, 4) == "접속자:"){
			appendMessage2(data.substring(4));
		}
	}
	
	function onClose(evt) {
		$("#message").on("keydown",null);
		appendMessage("연결을 끊었습니다.");
	}

	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		wsocket.send("msg:" + $("#username").val() + ":" + msg);
		
		$("#message").val("");
	}
	
	function join() {
		wsocket.send("msg:" + "▶" + $("#username").val() +"님 입장!");
	}
	
	function out() {
		wsocket.send("msg:" + "◀" +$("#username").val()+"님이 나갔습니다.");
	}

	function appendMessage(msg) {
		
		$("#chatMessageArea").append(msg + "<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);

	}
	
function appendMessage2(msg) {
		$("#guest").html(msg + "<br>");
	}

	$(document).ready(function() {
			
		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() {
			send();
		});
		$('#enterBtn').click(function() {
			connect();
		});
		$('#exitBtn').click(function() {
			disconnect();
		});
		window.onbeforeunload = function() {

			disconnect();

		}
	});
	
	
</script>

</body>
</html>