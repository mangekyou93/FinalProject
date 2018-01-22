<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티</title>
<!-- ck -->
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
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

::-webkit-input-placeholder { /* Chrome */
  color: lightgray;
}
:-ms-input-placeholder { /* IE 10+ */
  color: lightgray;
}

.coumunity_input_title {
	width:730px;
	height:30px;
	margin:15px 0;
	border:0;
	border-bottom: 1px solid #dddddd;
	font-size: 20px;
}
#community_insert {
	float: left;
    width: 50px;
    height: 30px;
    background-color: white;
    border-radius: 4px;
    margin-left: 3px;
}
#community_insert:hover {
	background-color: RGB(18, 165, 244);
	color:white;
}
#community_cancle {
	float: left;
    width: 50px;
    height: 30px;
    background-color: #d43f3a;
    border-radius: 4px;
    color: white;
    border-color: #d43f3a;
}
#cke_contents {
	height:500px;
}
.community_file_warp{
    padding-top: 10px;
    margin-top: 30px;
    width: 100%;
    height: 40px;
    color: white;
    font-size: 15px;
    font-weight: bold;
    text-align: center;
    background-color: #3f4b5e;
}
/* 드래그 & 드롭  */
.dragAndDropDiv {
                border: 1px dashed #3f4b5e;
                border-top:0;
                width: 720px;
                height: 100px;
                color: #3f4b5e;
                text-align: center;
                vertical-align: middle;
                padding: 10px 0px 10px 10px;
                font-size:200%;
                display: table-cell;
            }
            .progressBar {
                width: 200px;
                height: 22px;
                border: 1px solid #ddd;
                border-radius: 5px; 
                overflow: hidden;
                display:inline-block;
                margin:0px 10px 5px 5px;
                vertical-align:top;
            }
              
            .progressBar div {
                height: 100%;
                color: #fff;
                text-align: center;
                line-height: 22px; /* same as #progressBar height if we want text middle aligned */
                width: 0;
                background-color: RGB(18, 165, 244); 
                border-radius: 3px; 
            }
            .statusbar{
                min-height:25px;
                width:99%;
                padding:10px 10px 0px 10px;
                vertical-align:top;
            }
            .statusbar:nth-child(odd){
                background:#EBEFF0;
            }
            .filename{
                display:inline-block;
                vertical-align:top;
                width:250px;
            }
            .filesize{
                display:inline-block;
                vertical-align:top;
                color:#30693D;
                width:100px;
                margin-left:10px;
                margin-right:5px;
            }
            .abort{
                background-color:#A8352F;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;display:inline-block;
                color:#fff;
                font-family:arial;font-size:13px;font-weight:normal;
                padding:4px 15px;
                cursor:pointer;
                vertical-align:top
            }
</style>
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace( 'contents' );
		
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
		<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/temp/header.jsp"/>
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
								<a style="color: white;" href="${pageContext.request.contextPath}/community/freeboard">자유게시판</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/community/">수강 후기</a>
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
	<c:import url="${pageScope.apgeContext.request.ContextPath }/WEB-INF/temp/footer.jsp"/>
</body>
</html>