<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>JSP</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<!-- stomp -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
 <script src='resources/js/adapter.js'></script>
<script type="text/javascript">

var sock;
var stompClient;

    $(document).ready(function() {
		 	$("#sendBtn").attr("disabled",true);
			$("#endBtn").attr("disabled",true);
			$("#startBtn").attr("disabled",false);
    	 
        $("#sendBtn").click(function() {
            sendMessage();
        });
        
         $("#startBtn").click(function(){
        	onOpen();	
        	$("#startBtn").attr("disabled",true);
			$("#sendBtn").attr("disabled",false);
			$("#endBtn").attr("disabled",false);
        });
        
        $("#endBtn").click(function(){
        	onClose(sock);
        	$("#startBtn").attr("disabled",false);
			$("#sendBtn").attr("disabled",true);
			$("#endBtn").attr("disabled",true);
        }); 
        
    });


    //웸소켓을 지정한 url로 연결한다.
    function onOpen(){
        sock = new SockJS("<c:url value="/echo"/>");
        $("#data").append("연결 : "+sock+"<br/>");
      //자바스크립트 안에 function을 집어넣을 수 있음.
        //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
        sock.onmessage = onMessage;
        //데이터를 끊고싶을때 실행하는 메소드
        sock.onclose = onClose;
        /* sock.onopen = function(){
            sock.send($("#message").val());
        }; */
    
        
        stompClient = Stomp.over(sock);
        console.log("stomp: "+stompClient);
        
    }
    
    function sendMessage() {
        /*소켓으로 보내겠다.  */
        sock.send($("#message").val());
        $("#message").val("");
        }

    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

    function onMessage(evt) {

        var data = evt.data;
        console.log("msg: "+ data +" evt: "+evt);
        $("#data").append(data + "<br/>");
        //sock.close();

    }


    function onClose(evt) {
        console.log(" close evt: "+evt);
        $("#data").append("연결 끊김"+"<br/>");
        sock.close();
    }

</script>

</head>

<body>

    <input type="text" id="message" />
    <input type="button" id="startBtn" value="연결" />
    <input type="button" id="sendBtn" value="전송" />
    <input type="button" id="endBtn" value="끊기" />
    <div id="data"></div>

	<video id="localVideo" autoplay muted></video>
  	<video id="remoteVideo" autoplay muted></video>
  	
  	<video id="anotherVideo" autoplay muted></video>

  <div>
    <button id="startButton">Start</button>
    <button id="anotherButton">Another</button>
    <button id="callButton">Call</button>
    <button id="hangupButton">Hang Up</button>
  </div>

<!-- webrtc script -->

<script>
var localStream, localPeerConnection, remotePeerConnection;
var turnStream;

var localVideo = document.getElementById("localVideo");
var remoteVideo = document.getElementById("remoteVideo");
var anotherVideo = document.getElementById("anotherVideo");

var startButton = document.getElementById("startButton");
var callButton = document.getElementById("callButton");
var hangupButton = document.getElementById("hangupButton");

startButton.disabled = false;
callButton.disabled = true;
hangupButton.disabled = true;

startButton.onclick = start;
callButton.onclick = call;
hangupButton.onclick = hangup;
anotherButton.onclick = another;

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
 
  callButton.disabled = false;
}

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
  callButton.disabled = true;
  hangupButton.disabled = false;
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
  hangupButton.disabled = true;
  callButton.disabled = false;
  
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

</body>

</html>
