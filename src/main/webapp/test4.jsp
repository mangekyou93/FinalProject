<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>

<html lang="en">

<head>
	<meta charset="UTF-8">
	<script src="/common/js/jquery-1.11.2.js"></script>
<style type="text/css">
	  .demo-droppable {
	    background: #08c;
	    color: #fff;
	    padding: 100px 0;
	    text-align: center;
	  }
	  .demo-droppable.dragover {
	    background: #00CC71;
	  }
</style>
</head>

<body>
	<div class="demo-droppable">
		<p>Drag files here or click to upload</p>
	</div>
		
	<div class="output"></div>

	
<script type="text/javascript">
	  (function(window) {
		  
	    function triggerCallback(e, callback) {
	      if(!callback || typeof callback !== 'function') {
	        return;
	      }
	      var files;
	      if(e.dataTransfer) {
	        files = e.dataTransfer.files;
	        console.log("dataTransfer : "+ files);
	      } else if(e.target) {
	        files = e.target.files;
	        console.log("target : "+ files);
	      }
	      callback.call(null, files);
	    }
	    
	    function makeDroppable(ele, callback) {
	      var input = document.createElement('input');
	      input.setAttribute('type', 'file');
	      input.setAttribute('multiple', false);
	      input.style.display = 'none';
	      
	      input.addEventListener('change', function(e) {
	        triggerCallback(e, callback);
	      });
	      
	      ele.appendChild(input);
	      
	      ele.addEventListener('dragover', function(e) {
	        e.preventDefault();
	        e.stopPropagation();
	        ele.classList.add('dragover');
	      });
	
	      ele.addEventListener('dragleave', function(e) {
	        e.preventDefault();
	        e.stopPropagation();
	        ele.classList.remove('dragover');
	      });
	
	      ele.addEventListener('drop', function(e) {
	        e.preventDefault();
	        e.stopPropagation();
	        ele.classList.remove('dragover');
	        triggerCallback(e, callback);
	      });
	      
	      ele.addEventListener('click', function() {
	        input.value = null;
	        input.click();
	      });
	    }
	    
	    window.makeDroppable = makeDroppable;
	  })(this);
	  
	  (function(window) {
		  
	    makeDroppable(window.document.querySelector('.demo-droppable'), function(files) {
	      console.log(files);
	      var output = document.querySelector('.output');
	      output.innerHTML = '';
	      for(var i=0; i<files.length; i++) {
	        if(files[i].type.indexOf('image/') === 0) {
	          output.innerHTML += '<img width="200" src="' + URL.createObjectURL(files[i]) + '" />';
	        }
	        output.innerHTML += '<p>'+files[i].name+'</p>';
	      }
	    });
	    
	  })(this);
	</script>
</body>

</html>