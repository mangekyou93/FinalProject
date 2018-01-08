<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/common/js/jquery-1.11.2.js"></script>
</head>
<body>
<form id="upload" action="/note/upload" method="POST" enctype="multipart/form-data">
  <fieldset>
    <div class="files">
      <input id="fileselect" type="file" name="fileselect" multiple="multiple" class="addFile"/>
    </div>
    <div id="filedrag">drag and drop</div>
    <div id="submitbutton">
      <button type="submit">Upload Files</button>
    </div>
    <div id="list"></div>
  </fieldset>
</form>

<table class="table">
  <thead>
    <th>이름</th>
    <th>타입</th>
    <th>용량</th>
  </thead>
  <tbody id="list"></tbody>
</table>
<script type="text/javascript">
function $id(id) {
	return document.getElementById(id);
}

// output information
function Output(msg) {
	var m = $id("list");
	m.innerHTML = msg + m.innerHTML;
}

// call initialization file
if (window.File && window.FileList && window.FileReader) {
	Init();
}

// initialize
function Init() {

	var fileselect = $id("fileselect"),
		filedrag = $id("filedrag"),
		submitbutton = $id("submitbutton");

	// file select
	fileselect.addEventListener("change", FileSelectHandler, false);

	// is XHR2 available?
	var xhr = new XMLHttpRequest();
	if (xhr.upload) {

		// file drop
		filedrag.addEventListener("dragover", FileDragHover, false);
		// filedrag.addEventListener("dragleave", FileDragHover, false);
		filedrag.addEventListener("drop", FileSelectHandler, false);
		filedrag.style.display = "block";

		// remove submit button
		submitbutton.style.display = "none";
	}
}

// file drag hover
function FileDragHover(e) {
	e.stopPropagation();
	e.preventDefault();
	e.target.className = (e.type == "dragover" ? "hover" : "");
}

// file selection
function FileSelectHandler(e) {

	// cancel event and hover styling
    FileDragHover(e);

	// fetch FileList object
	var files = e.target.files || e.dataTransfer.files;

    console.log('te');
    addFileFromLastInput(files);

    // process all File objects
	for (var i = 0, f; f = files[i]; i++) {
		ParseFile(f);
	}
}

function ParseFile(file) {
	
    var fileName = file.name,
        fileType = file.type,
        fileSize = file.size + 'bytes';

	alert(fileName);
	Output(
		"<tr><td>" + fileName +
		"</td><td>" + fileType +
		"</td><td>" + fileSize +
		"</td> </tr>"
	);
}

function addFileFromLastInput(file){

    var a = $('input#fileselect');
    a[a.length-1].files = file;

    try{
        let new_input = '<input id="fileselect" type="file" name="fileselect" multiple="multiple" class="addFile" />';
        $('.files').append(new_input);
    }catch(err){

    }

    return 0;
}
</script>
</body>
</html>