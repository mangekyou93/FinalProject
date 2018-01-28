<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>C반 메신져</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/sockjs-0.3.4.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/ListUtil.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrapchat.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/flat-ui.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/toaster.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/chat.css"
	rel="stylesheet">



</head>
<body>
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

	<div class="container" ng-controller="ChatController">
		<toaster-container></toaster-container>

		<div class="row">
			<nav class="navbar navbar-inverse navbar-embossed" role="navigation">
				<div class="collapse navbar-collapse" id="navbar-collapse-01">
					<h1>A반 메신져</h1>
					<ul class="nav navbar-nav navbar-right">
						<li><a id="exitBtn" style="cursor: pointer;">대화방 나가기
								(${member.name})</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
			<!-- /navbar -->
		</div>
		<div class="row">
			<div class="col-xs-2">
				<h4>
					접속자 [
					<div id=usercount style="display: inline-block"></div>
					]
				</h4>
				<div class="share">
					<ul ng-repeat="participant in participants">
						<li>
							<div id=guest style="margin-right: 56%"></div>

						</li>
					</ul>
				</div>
			</div>
			<div style="text-align: center">
				<h4>대화 내용</h4>
			</div>
			<div class="col-xs-8 chat-box" id="scroll">

				<div id="chatMessageArea"></div>
			</div>
		</div>
		<div class="row" style="margin-left: 18%">
			<div class="form-group">
				<input id="message" type="text" class="form-control"
					placeholder="메세지를  입력하세요..." ng-model="newMessage"
					ng-keyup="$event.keyCode == 13 ? sendMessage() : startTyping()"
					style="width: 90%; display: inline-block;" />
				<button class="btn btn-info" id="sendBtn" value="전송"
					style="width: 9%; margin-bottom: 0.2%">보내기</button>
			</div>
		</div>
	</div>




	<script type="text/javascript">
		var wsocket;
		var geustlist = new ArrayList();
		var head = "usr:";
		window.onload = pageLoad;

		function pageLoad() {
			wsocket = new SockJS("/ctrl/chat.sockjsC");
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
			} else if (data.substring(0, 4) == "접속자:") {
				appendMessage2(data.substring(4));
			} else if (data.substring(0, 4) == "유저수:") {
				appendMessage3(data.substring(4));
			} else if (data.substring(0, 4) == "log:") {
				appendMessage4(data.substring(4));
			}
		}

		function onClose(evt) {
			$("#message").on("keydown", null);
			appendMessage("연결을 끊었습니다.");
		}

		function send() {
			var nickname = $("#nickname").val();
			var msg = $("#message").val();
			wsocket.send("msg:" + $("#username").val() + ":" + msg);

			$("#message").val("");
		}

		function join() {
			wsocket.send("log:" + "▶" + $("#username").val() + "님 입장!");
		}

		function out() {
			wsocket.send("log:" + "◀" + $("#username").val() + "님이 나갔습니다.");
		}

		function appendMessage(msg) {
			var maxScroll = $("#chatMessageArea").height();
			if ($("#username").val() == msg.substring(0, 3)) {
				$("#chatMessageArea")
						.append(
								'<div id="fade-in" class="list-group-item list-group-item-warning" style="color : red;text-align: right;">'
										+ "나" + msg.substring(3) + '</div>');
			} else {
				$("#chatMessageArea")
						.append(
								'<div id="fade-in" class="list-group-item list-group-item-info" style="color : blue;text-align: left;">'
										+ msg + '</div>');
			}
			/* var chatAreaHeight = $("#chatArea").height(); */
			$("#scroll").scrollTop(maxScroll);

		}

		function appendMessage2(msg) {
			$("#guest").html(msg + "<br>");
		}

		function appendMessage3(msg) {
			$("#usercount").html(msg + "<br>");
		}

		function appendMessage4(msg) {
			var maxScroll = $("#chatMessageArea").height();
			$("#chatMessageArea")
					.append(
							'<div id="fade-in" class="list-group-item list-group-item-danger" style="color : blue; text-align: center;">'
									+ msg + '</div>');
			/* var chatAreaHeight = $("#chatArea").height(); */
			$("#scroll").scrollTop(maxScroll);

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