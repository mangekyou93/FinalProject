<%@ page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var wsocket;

	function connect() {
		wsocket = new WebSocket("ws://localhost:80/ctrl/chat-ws");
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
		$("#guest").val("");
		$("#guest").append($("#nickname").val()+"<br/>");
		alert(websocektsession.val());
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}

	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		wsocket.send("msg:" + nickname + ":" + msg);
		$("#message").val("");
	}
	
	function join() {
		var nickname = $("#nickname").val();
		wsocket.send("msg:" + nickname+"님 입장!");
	}
	
	function out() {
		var nickname = $("#nickname").val();
		wsocket.send("msg:" + nickname+"님이 나갔습니다.");
	}

	function appendMessage(msg) {
		
		$("#chatMessageArea").append(msg + "<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);

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
<style>
#chatArea {
	width: 200px;
	height: 100px;
	overflow-y: auto;
	border: 1px solid black;
}

#guest {
	width: 100px;
	height: 200px;
	overflow-y: auto;
	border: 1px solid black;
}
</style>
</head>
<body>


	이름:
	<input type="text" id="nickname">
	<input type="button" id="enterBtn" value="입장">
	<input type="button" id="exitBtn" value="나가기">

	<h1>대화 영역</h1>
	<div id="chatArea">
		<div id="chatMessageArea"></div>
	</div>
	<br />
	<input type="text" id="message" placeholder="메시지를 입력하세요..">
	<input type="button" id="sendBtn" value="전송">
	<h2>접속자</h2>
	<div id="guest"></div>
</body>
</html>

