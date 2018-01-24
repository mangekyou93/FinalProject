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
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

  <link href="//cdn.jsdelivr.net/emojione/1.3.0/assets/css/emojione.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/chat2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/ripples.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/material-wfont.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/favicon.png" />



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
	    </div>
	    
	    
	    <div class="container-fluid main">
        <a target="_blank" href="https://github.com/IgorAntun/node-chat"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a64448d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"></a>

        <div class="row">
            <div class="col-xs-12 col-lg-10 col-lg-offset-1"><br>
                <div class="well page active">
                    <nav class="navbar shadow-z-2">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapser">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#">Node.JS Chat <span id="version" style="font-size:7pt"></span></a>
                            </div>

                            <div class="collapse navbar-collapse" id="collapser">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="#">Chat</a></li>
                                    <li><a id="help" href="#">Help</a></li>
                                    <li><a id="user" href="#">Users</a></li>
                                    <li><a id="menu-admin" href="#" style="display:none">Admin</a></li>
                                    <li><a id="menu-options" href="#">Options</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>

                    <div class="row">
                        <div class="col-xs-12 col-md-12 ">
                            <div class="well">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h2>Messenger</h2>
                                    </div>
                                    <div class="col-xs-6">
                                        <button id="options" class="btn btn-fab btn-fab-mini btn-primary pull-right">
                                            <i id="icon-settings" class="mdi mdi-action-settings"></i>
                                        </button>
                                        <button id="audio" class="btn btn-fab btn-fab-mini btn-primary pull-right" style="display:none">
                                            <i id="icon-audio" class="mdi mdi-av-mic"></i>
                                        </button>
                                    </div>
                                </div>
                                <br>

                                <div class="panel panel-default">
                                    <div class="panel-heading">Messages</div>
                                    <div id="panel" class="panel-body"></div>
                                </div>

                                <p id="typing"><br></p>
                                <hr>

                                <div class="row">
                                    <div class="col-lg-8 col-lg-offset-2">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span id="icon" class="mdi mdi-social-person"></span></span>
                                            <input id="message" type="text" class="form-control" placeholder="Choose an username" aria-describedby="basic-addon1" maxlength="768">
                                            <span class="input-group-btn">
                                                <button id="send" class="btn btn-primary btn-flat">Connect</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <p class="text-left pull-left">Created by <a href="https://github.com/IgorAntun" target="_blank">Igor Antun</a></p>
                            <p id="badges" class="text-right pull-right">
                                <span><label id="users" class="label">0 USERS</label></span>
                                <span><label id="admin" class="label label-warning" style="display:none">ADMIN</label></span>
                                <span><label class="label label-info">BETA</label></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




	<script type="text/javascript">
	var wsocket;	
	var geustlist = new ArrayList();
	var head = "usr:";
	window.onload = pageLoad;
	
	function pageLoad() {
		wsocket = new SockJS("/ctrl/chat.sockjsB");
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