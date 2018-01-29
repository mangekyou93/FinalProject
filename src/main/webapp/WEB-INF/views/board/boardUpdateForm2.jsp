<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/community/boardInsert.css" rel="stylesheet">
<!-- ck -->
<script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
<script type="text/javascript">
	$(function(){
   
		CKEDITOR.replace("contents");
		
        $("#community_insert").click(function(){
			document.frm.submit();		
		});
		
		/* 드래그 & 드롭  */
		
		var objDragAndDrop = $(".dragAndDropDiv");
        
        $(document).on("dragenter",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
            $(this).css('border', '2px solid #3f4b5e');
        });
        $(document).on("dragover",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on("drop",".dragAndDropDiv",function(e){
             
            $(this).css('border', '1px solid #3f4b5e');
            e.preventDefault();
            var files = e.originalEvent.dataTransfer.files;
         
            handleFileUpload(files,objDragAndDrop);
        });
         
        $(document).on('dragenter', function (e){
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on('dragover', function (e){
          e.stopPropagation();
          e.preventDefault();
          objDragAndDrop.css('border', '2px dotted #3f4b5e');
        });
        $(document).on('drop', function (e){
            e.stopPropagation();
            e.preventDefault();
        });
         
        function handleFileUpload(files,obj)
        {
           for (var i = 0; i < files.length; i++) 
           {
                var fd = new FormData();
                fd.append('file', files[i]);
          
                var status = new createStatusbar(obj); //Using this we can set progress.
                status.setFileNameSize(files[i].name,files[i].size);
                sendFileToServer(fd,status);
          
           }
        }
         
        var rowCount=0;
        var delCount=0;
        function createStatusbar(obj){
                 
            rowCount++;
            var row="odd";
            if(rowCount %2 ==0) row ="even";
            this.statusbar = $("<div class='statusbar "+row+"'></div>");
            this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
            this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
            this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
            this.del = $("<input type='button' id='clickBtn"+delCount+"' class='clickBtn'>").appendTo(this.statusbar);
            
            $("#fileBox").append(this.statusbar);
          
            this.setFileNameSize = function(name,size){
                var sizeStr="";
                var sizeKB = size/1024;
                if(parseInt(sizeKB) > 1024){
                    var sizeMB = sizeKB/1024;
                    sizeStr = sizeMB.toFixed(2)+" MB";
                }else{
                    sizeStr = sizeKB.toFixed(2)+" KB";
                }
          
                this.filename.html(name);
                this.size.html(sizeStr);
                this.del.val("X");
            }
             
            this.setProgress = function(progress){       
                var progressBarWidth =progress*this.progressBar.width()/ 100;  
                this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                if(parseInt(progress) >= 100)
                {
                    this.abort.hide();
                }
            }
             
            this.setAbort = function(jqxhr){
                var sb = this.statusbar;
                this.abort.click(function()
                {
                    jqxhr.abort();
                    sb.hide();
                });
            }
        }
        var fileNameAr = [];
        var count = 1;
        function sendFileToServer(formData,status)
        {
            var uploadURL = "${pageContext.request.contextPath}/upload/boardInsert"; //Upload URL
            var extraData ={}; //Extra Data.
            var jqXHR=$.ajax({
                    xhr: function() {
                    var xhrobj = $.ajaxSettings.xhr();
                    if (xhrobj.upload) {
                            xhrobj.upload.addEventListener('progress', function(event) {
                                var percent = 0;
                                var position = event.loaded || event.position;
                                var total = event.total;
                                if (event.lengthComputable) {
                                    percent = Math.ceil(position / total * 100);
                                }
                                //Set progress
                                status.setProgress(percent);
                            }, false);
                        }
                    return xhrobj;
                },
                url: uploadURL,
                type: "POST",
                contentType:false,
                processData: false,
                cache: false,
                data: formData,
                success: function(data){
                    status.setProgress(100);
          			fileNameAr.push(data);
          			$("#frm").append('<div><input type="hidden" id="ori'+count+'" name="oriName" value='+data+'></div>');
                    //$("#status1").append("File upload Done<br>");           
                }
            }); 
            status.setAbort(jqXHR);
        }
        $("#fileBox").on("click",".clickBtn",function(){
        	var str = $(this).prop("id");
        	var del = $(this);
        	var index = str.lastIndexOf("n")*1+1;
        	str = str.substring(index);
        	
        	var fileName = fileNameAr[str];
        	
        	$.ajax({
        		url:"../upload/fileFakeDelete",
        		type:"POST",
        		data:{
        			fileName:fileName
        		}, success:function(data){
        			$(del).parent().remove();
        		}
        	})
        });
        
        $("clickBtn").click(function(){
        	var index = $(this).prop("title");
        	var title_value = $("#upload"+index).prop("title");
        	$.ajax({
        		url:"../upload/fileFakeDelete",
        		type:"post",
        		data:{
        			fileName:title_value
        		}, success:function(data){
        			$("#uploadDel"+index).remove();
        		}
        	})
        });
     });
	
</script>
<style>
	.fileUpdate {
		height: 37px;
    	background: #EBEFF0;
    	padding: 10px 10px 0 10px;	
	}
</style>
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
								<a href="${pageContext.request.contextPath}/notice/">수강 후기</a>
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
					<div class="contents_input_warp">
						<form id="frm" name="frm" method="post" action="./freeboardInsert" enctype="multipart/form-data">
						<input type="hidden" name="writer" value="${list.writer}">
						<div>
							<input type="text" placeholder="제목을 입력해주세요" name="title" value="${list.title }" class="coumunity_input_title"> 
						</div>
						<textarea rows="10" cols="100" name="contents" id="contents" style="height:500px;">${list.contents }</textarea>
						<div class="community_file_warp">파일 업로드</div>
						<div id="fileUpload" class="dragAndDropDiv">파일을 올려주세요</div>
						<c:forEach items="${files}" var="fileNames" varStatus="status">
							<div class="fileUpdate"><div id="uploadDel${status.index }" title="${fileNames.file_name }" class="fileUpdateClick" style="margin-right: 5px;">${fileNames.file_name }<input type='button' id='clickBtn' style="padding-left: 10px;" title="${status.index }" value="X" class='clickBtn'></div></div>
						</c:forEach>
						<div id="fileBox"></div>
						
						
							<input type="button" value="취소" id="community_cancle">
							<input type="button" value="작성" id="community_insert">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="${pageScope.apgeContext.request.ContextPath }/WEB-INF/views/temp/footer.jsp"/>
</body>
<!-- <script>
	CKEDITOR.replace("contents");
</script> -->
</html>