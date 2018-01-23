<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sockjs-0.3.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ListUtil.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/room.css"
	rel="stylesheet">


</head>
<body>
	<section class="wrap">
	<input type="hidden" id="username" value="${member.name}">

		<div class="chat_center">

			<div class="exit">
				<!-- 이름: <input type="text" id="nickname"> <input type="button"
					id="enterBtn" value="입장"> --> 
					<input type="button" id="exitBtn" value="나가기">
			</div>
			
			<div class="chat">
				<div id="chatArea">
					<div id="chatMessageArea"></div>
				</div>
			</div>
			
			<div class="chat_text">
				<input type="text" id="message" placeholder="메시지를 입력하세요..">
				<input type="button" id="sendBtn" value="전송">
			</div>
		</div>

		<div class="chat_right">
			<div class="menu">
				<div class="menu_contents">
				<div id=guest></div>
				</div>
			</div>
	
		</div>

	</section>




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
	});
	
	
</script>

</body>
</html>