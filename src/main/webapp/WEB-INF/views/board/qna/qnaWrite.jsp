<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/qnaWrite.css" rel="stylesheet">
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
        function createStatusbar(obj){
                 
            rowCount++;
            var row="odd";
            if(rowCount %2 ==0) row ="even";
            this.statusbar = $("<div class='statusbar "+row+"'></div>");
            this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
            this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
            this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
             
            obj.after(this.statusbar);
          
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
         
        function sendFileToServer(formData,status)
        {
            var uploadURL = "./boardUpload"; //Upload URL
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
          			alert(data);
                    //$("#status1").append("File upload Done<br>");           
                }
            }); 
          
            status.setAbort(jqXHR);
        }
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
						상담 센터
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li style="background-color: RGB(18, 165, 244);">
								<a style="color: white;" href="${pageContext.request.contextPath}/board/qna/qnaList">Q&A</a>
							</li>
							<li>
								<a href="#">상담하기</a>
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
						<form id="frm" name="frm" method="post" action="../" enctype="multipart/form-data">
						<input type="hidden" name="writer" value="${member.name }">
						<div>
							<input type="text" placeholder="제목을 입력해주세요" name="title" class="coumunity_input_title"> 
						</div>
							<textarea rows="10" cols="100" name="contents" id="contents" style="height:500px;"></textarea>
						<div class="community_file_warp">파일 업로드</div>
						<div id="fileUpload" class="dragAndDropDiv">파일을 올려주세요</div>
						
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
</html>