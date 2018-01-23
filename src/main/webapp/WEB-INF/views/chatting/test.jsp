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
<link href="${pageContext.request.contextPath}/resources/css/room.css"
	rel="stylesheet">
	 <script src='resources/js/adapter.js'></script>
	 
	 <!-- webrtc script -->


</head>
<body>


	<section class="wrap">


		<div class="chat_left">

			<div class="video1"></div>
			<div class="video1"></div>
			<div class="video2"></div>

		</div>

		<div class="chat_center">
			<div class="share"></div>

			<div class="exit">
				이름: <input type="text" id="nickname"> <input type="button"
					id="enterBtn" value="입장"> <input type="button" id="exitBtn"
					value="나가기">
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
			<div class="user"></div>
			<div class="menu">
				<div class="menu_top">
					<div class="top_frd"></div>

					<div class="top_list"></div>
					<div class="top_video"></div>
				</div>
				<div class="menu_contents"></div>
			</div>
			<div class="mycam">
				<video id="localVideo" autoplay muted></video>
			    <button id="startButton">Start</button>
			</div>
		</div>

	</section>


<script>
var localStream, localPeerConnection, remotePeerConnection;
var turnStream;

var localVideo = document.getElementById("localVideo");
var remoteVideo = document.getElementById("remoteVideo");
var anotherVideo = document.getElementById("anotherVideo");

var startButton = document.getElementById("startButton");
/* var callButton = document.getElementById("callButton");
var hangupButton = document.getElementById("hangupButton"); */

//startButton.disabled = false;
/* callButton.disabled = true;
hangupButton.disabled = true; */

//startButton.onclick = start;
/* callButton.onclick = call;
hangupButton.onclick = hangup;
anotherButton.onclick = another; */

function trace(text) {
  console.log((performance.now() / 1000).toFixed(3) + ": " + text);
}

function gotStream(stream){
  trace("Received local stream");
  turnStream = URL.createObjectURL(stream);
  localVideo.src = turnStream;
  localStream = stream;
  trace("video : " + localVideo.src + " stream: " + localStream.id); 
  
  for(var key in localStream){
	  console.log(" key : " + key +"  value :  " +localStream[key])
  }
 
  //callButton.disabled = false;
}

$("#startButton").click(function(){
	
	trace("================== video Start ==================");
	  trace("Requesting local stream");
	  startButton.disabled = true;
	  getUserMedia({audio:true, video:true}, gotStream,
	    function(error) {
	      trace("getUserMedia error: ", error);
	    }); 
	  trace("================== video end ==================");
	
});

function start() {
  trace("================== video Start ==================");
  trace("Requesting local stream");
  startButton.disabled = true;
  getUserMedia({audio:true, video:true}, gotStream,
    function(error) {
      trace("getUserMedia error: ", error);
    }); 
  trace("================== video end ==================");
}

function another(){
	trace("================== another start ==================");
	anotherVideo.src = turnStream;
	 trace("video : " + anotherVideo.src + " stream: " + localStream);
	trace("================== another end ==================");
}


function call() {
	
	trace("================== call Start ==================");
/*   callButton.disabled = true;
  hangupButton.disabled = false; */
  trace("Starting call");

  if (localStream.getVideoTracks().length > 0) {
    trace('Using video device: ' + localStream.getVideoTracks()[0].label);
  }
  if (localStream.getAudioTracks().length > 0) {
    trace('Using audio device: ' + localStream.getAudioTracks()[0].label);
  }

  var servers = sock;

  localPeerConnection = new RTCPeerConnection(servers);
  trace("Created local peer connection object localPeerConnection");
  localPeerConnection.onicecandidate = gotLocalIceCandidate;

  remotePeerConnection = new RTCPeerConnection(servers);
  trace("Created remote peer connection object remotePeerConnection");
  remotePeerConnection.onicecandidate = gotRemoteIceCandidate;
  remotePeerConnection.onaddstream = gotRemoteStream;

  localPeerConnection.addStream(localStream);
  trace("Added localStream to localPeerConnection");
  localPeerConnection.createOffer(gotLocalDescription,handleError);
  trace("================== call end ==================");
  
}

function gotLocalDescription(description){
  localPeerConnection.setLocalDescription(description);	
  trace("Offer from localPeerConnection: \n" + description.sdp);
  remotePeerConnection.setRemoteDescription(description);
  remotePeerConnection.createAnswer(gotRemoteDescription,handleError);
}

function gotRemoteDescription(description){
  remotePeerConnection.setLocalDescription(description);
  trace("Answer from remotePeerConnection: \n" + description.sdp);
  localPeerConnection.setRemoteDescription(description);
}

function hangup() {
	
	trace("================== hang Start ==================");
	
  trace("Ending call");
  localPeerConnection.close();
  remotePeerConnection.close();
  localPeerConnection = null;
  remotePeerConnection = null;
  
  /* hangupButton.disabled = true;
  callButton.disabled = false;
   */
  trace("================== hang end ==================");
}

function gotRemoteStream(event){
  remoteVideo.src = URL.createObjectURL(event.stream);
  trace("Received remote stream");
}

function gotLocalIceCandidate(event){
  if (event.candidate) {
    remotePeerConnection.addIceCandidate(new RTCIceCandidate(event.candidate));
    trace("Local ICE candidate: \n" + event.candidate.candidate);
  }
}

function gotRemoteIceCandidate(event){
  if (event.candidate) {
    localPeerConnection.addIceCandidate(new RTCIceCandidate(event.candidate));
    trace("Remote ICE candidate: \n " + event.candidate.candidate);
  }
}

function handleError(){}

/* ======================================================================= */


</script>

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

</body>
</html>