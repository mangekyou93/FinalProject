<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/footer.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
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
.freeboard_view_wrap {
	width:100%;
	height:500px;
	border-bottom:1px solid #ddd;
	border-left:0;
	border-right:0;
}
.freeboard_view_title {
	height:60px;
	color:white;
	background-color: #3f4b5e;
	padding-top: 17px;
    font-weight: bold;
    padding-left: 30px;
    font-size: 20px;
}
.view_hit {
	    /* border-bottom: 1px solid #ddd; */
    /* margin-top: 10px; */
    /* padding-right: 10px; */
    /* padding-bottom: 10px; */
    text-align: right;
    color: gray;
    display: inline-block;
    font-size: 15px;
    float: right;
}
.view_date {
	padding-left: 10px;
}
.view_contents {
	width: 100%;
    height: 398px;
    padding-top: 20px;
    padding-left: 10px;
    resize: none;

}
.view_listBack {
	margin-top: 20px;
	border-bottom: 1px solid #ddd;
    padding-bottom: 20px;
}
.view_reply_wrap {
	width:100%;
	height: 180px;
    background-color: #f9f9f9;
    margin-top: 20px;
    padding-top: 35px;
    padding-left: 41px;
}
.view_reply_contents {
	width: 500px;
    height: 90px;
    border-color: #ddd;
    resize: none;
    padding-left: 10px;
}
.view_reply_button {
	height: 90px;
	width: 120px;
	position: absolute;
	background-color: #3f4b5e;
	font-size: 17px;
    font-weight: bold;
    color: white;
    border:0;
    margin-left: 15px;
}
.check_wirte{
	padding-left: 437px;
    color: #aaa;
    font-size: 13px; 
}
.reply_writer {
	display: inline-block;
    padding-left: 25px;
    padding-top: 20px;
    vertical-align: top;
    font-weight: bold;
}
.reply_contents {
	display: inline-block;
}
.community_reply_wrap {
    margin-top: 20px;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 1px dotted #ddd;
}
.reply_contents_wrap_M {
    display: inline-block;
    margin-left: 26px;
    border-left: 2px solid #ddd;
    padding-left: 20px;
    width: 600px;
}
.view_reply_buttons {
	height: 90px;
	width: 120px;
	position: absolute;
	background-color: #3f4b5e;
	font-size: 17px;
    font-weight: bold;
    color: white;
    border:0;
    margin-left: 15px;
}
.up, .del {
	float:right;
}
.del {
	margin-left: 5px;
}
#file_output {
	border: 0;
    font-weight: bold;
    font-size: 14px;
    border-radius: 3px;
    margin-top: 10px;
}
.fileDownload {
    margin-top: 5px;
}
.view_reply_wraps {
	width:100%;
	height: 180px;
    background-color: #f9f9f9;
    margin-top: 20px;
    padding-top: 35px;
    padding-left: 41px;
}
.view_writer {
    width: 100%;
    display: inline-block;
    border-bottom: 1px solid #ddd;
    margin-top: 10px;
    padding-right: 10px;
    padding-left: 10px;
    padding-bottom: 10px;
}
</style>
<script>
	$(function(){
		$(".view_reply_contents").on('keyup', function(){
			var content = $(this).val();
			$(".check_wirte").html(content.length + '/400 글자')
			if($(this).val().length > 400) {
				$(this).val($(this).val().substring(0, 400));
			}
		});
	    $('.view_reply_contents').keyup();
		
	    $(".view_reply_button").click(function(){
	    	var writer = '${member.name}';
	    	if(${member eq null}){
	    		alert("로그인 후 댓글 작성이 가능합니다.");
	    		location.reload();
	    	} else {
	    		$.ajax({
	    			url : "../reply/freeboardreplyInsert",
	    			type : "POST",
	    			data : 
	    				{
	    					writer:writer,
	    					contents:$(".view_reply_contents").val(),
	    					board_seq:${view.board_seq}
	    				},
	    				success:function(data){
	    					$('.community_reply_contents_wrap').html(data);
	    				}
	    		});
	    			}
		    	});
	    var count = 0;
	    $(".fileDownload").hide();
	   	$("#file_output").click(function(){
	   		$(".fileDownload").toggle("slow");
	   	});
	   	$(".clickReply").click(function(){
	   		var thisDiv = $(this).prop("title");
	   		var writer = '${member.name}';
	   		$(".checkReply"+thisDiv).append("<div class='view_reply_wraps'><div class='view_reply_contents_wrap'><textarea class='view_reply_contents view_reply_contents"+thisDiv+"' name='contents'></textarea><input type='button' class='view_reply_buttons' value='댓글 등록'><p class='check_wirte'></p></div></div>");
	   		$(".checkReply"+thisDiv).on("click",".view_reply_buttons",function(){
	   			$.ajax({
	   				url : "../reply/freeboardReply",
	   				type : "POST",
	   				data : {
	   					writer:writer,
	   					contents:$(".view_reply_contents"+thisDiv).val(),
	   					ref:$("#ref"+thisDiv).val(),
	   					step:$("#step"+thisDiv).val(),
	   					depth:$("#depth"+thisDiv).val(),
	   					board_seq:${view.board_seq}
	   				}, success:function(data){
	   					alert(data);
	   				}
	   			});
	   		});
	   	});
	   	
	  });
</script>
</head>
<body>
<!--  header start -->
		<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"/>
	<!-- header end -->
		<section>
		<div class="allContents">
			<div class="leftContents">
				<div class="leftMenu">
					<div class="leftMenu_header">
						자유게시판
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li style="background-color: RGB(18, 165, 244);">
								<a style="color: white;" href="${pageContext.request.contextPath}/notice/freeboard">자유게시판</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/memberAgree">수강 후기</a>
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
					<div class="freeboard_view_wrap">
						<div class="freeboard_view_title">${view.title}</div>
						<div class="view_writer">작성자 : ${view.writer }
						<div class="view_hit"><img style="padding-right: 5px;" src="${pageContext.request.contextPath }/resources/images/icon_view.png">${view.hit } <span class="view_date">${view.reg_date }</span></div>
						</div>
						<div class="view_contents">${view.contents}</div>
					</div>
					<c:if test="${files ne null }">
						<button type="button" id="file_output">파일첨부 <img src="${pageContext.request.contextPath }/resources/images/icon_reply01.png"></button>
					</c:if>
					<div class="fileDownload">
					<c:forEach items="${files}" var="fileNames">
						<span style="margin-right: 5px;"><a href="../upload/filedown?file_name=${fileNames.file_name }&ori_name=${fileNames.ori_name}">${fileNames.file_name }</a></span>
					</c:forEach>
					</div>
					<div class="view_listBack">
						<a href="./freeboard"><input style="margin-left: 5px;" class="btn btn-default" type="button" value="목록"></a>
						<a href="./delete?board_seq=${view.board_seq}"><input class="del btn btn-default" type="button" value="삭제"></a>
						<a href="./update?board_seq=${view.board_seq}"><input class="up btn btn-default" type="button" value="수정"></a>
					</div>
					<div class="view_reply_wrap">
						<div class="view_reply_contents_wrap">
							<textarea class="view_reply_contents" name="contents"></textarea>
								<input type="button" class="view_reply_button" value="댓글 등록">
							<p class="check_wirte"></p>
							
						</div>
					</div>
					<div class="community_reply_contents_wrap">
                  <c:forEach items="${list}" var="dto2" varStatus="status">
                     <div class="community_reply_wrap">
                        <p class="reply_writer">${dto2.writer }</p>
                        <div class="reply_contents_wrap_M">
                        <p class="reply_contents">${dto2.contents }</p>
                        <p style="font-size: 12px;color: #aaa;" class="reply_date_wrap">${dto2.reply_date }<span class="clickReply" title="${status.index }" style="padding-left: 10px;font-size: 12px;color: RGB(18, 165, 244);">답글 달기</span></p>
                        </div>
                     <br>
                     </div>
                     <div class="checkReply${status.index }">
                     	<input type="hidden" id="ref${status.index }" name="ref" value="${dto2.ref }">
                     	<input type="hidden" id="step${status.index }" name="step" value="${dto2.step}">
                     	<input type="hidden" id="depth${status.index }" name="depth" value="${dto2.depth}">
                     </div>
                  </c:forEach>
               </div> 
				</div>
			</div>
		</div>
	</section>
	<!-- footer start -->
		<c:import url="${pageScope.pageContext.request.ContextPath }/WEB-INF/views/temp/footer.jsp"/>
	<!-- footer end -->
</body>
</html>