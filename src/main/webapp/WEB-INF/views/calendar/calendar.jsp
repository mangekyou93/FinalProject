<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- ============================모달============================= -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href='${pageContext.request.contextPath}/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/css/calModal.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath}/resources/js/moment.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/ko.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/fullcalendar.min.js'></script>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet">

<script>
$.get("../calendar/calendar_list",function(data){
	 $('#calendar').fullCalendar({
	      header: {
	        left: 'prev,next ',
	        center: 'title',
	        right: 'month'
	      },
	      eventLimit: true,
	      defaultDate: '2018-01-12',
	      locale:"ko",
	      navLinks: true, // can click day/week names to navigate views
	      businessHours: true, // display business hours
	      editable: false,
	      events: $.parseJSON(data),
	      eventClick: function(date, jsEvent, view, id) {	    	  
	    	 /* <c:if test="${date.id eq view.id}"> */
	    	  	/* window.open("calender_view?id=${view.id}"); */
	    	  	location.href = ("./calendar_view?id="+date.id);
	    	  /* </c:if>  */	    		   
	      }
	 });
});

	    	
  /* =====================모달관련========================== */
$(function(){
	    $("#write").click(function(){
	        $("#frm").submit();
	    })
	});
</script>

<!-- <script type="text/javascript">
$(document).ready(function(){
    $("#btn btn-info btn-lg").click(function(){
    	if(kind == admin){
        $(this).show();
    	}else{
    	$(this).hide();
    	}
    });
});
</script> -->
</head>
<body>
<!--  header start -->
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"></c:import>
<!-- header end -->	

	<section>
		<div class="allContents">
			<div class="leftContents">
				<div class="leftMenu">
					<div class="leftMenu_header">
						교육 과정
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/calendar/calendar/test" style="color: white;">커리큘럼</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/sign/sign_apply">수강신청</a>
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
					<div id='calendar'></div>

					  <c:if test="${member.kind eq 'admin'}">
					   <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal" style="position: relative; top: -583px; right: -667px;">추가</button>
					  </c:if>
					<div class="container">

					  <!-- Modal -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title" id="cal_title">Calendar Insert</h4>
					        </div>
					        <div class="modal-body">
					          <form action="${pageContext.request.contextPath}/calendar/calendar_write" id="frm" method="post">
							<table id="calender_s">
								<tr>
					       			<td>회차:</td>
					        		<td><input type="text" name="num" placeholder="회차를 입력해 주세요"></td>
					      		</tr>
							
					      		<tr>
					       			<td>id:</td>
					        		<td><input type="text" name="id" placeholder="id를 입력해 주세요"></td>
					      		</tr>
					      		<tr>
					        		<td>제목:</td>
					        		<td><input type="text" name="title" placeholder="제목을 입력해주세요."></td>
					      		</tr>
					      		<tr>
					        		<td>강의 내용:</td>
					        		<td><textarea rows="10" cols="30" name="contents" placeholder="내용을 입력해주세요"></textarea> </td>
					      		</tr>
					       		<tr>
					        		<td>개강일:</td>
					        		<td><input type="date" name="date_start" placeholder="시작일을 입력해주세요."></td>
					      		</tr>
					       		<tr>
					        		<td>종강일:</td>
					        		<td><input type="date" name="date_end" placeholder="종료일 입력해주세요."></td>
					      		</tr>
					       		<tr>
					        		<td>반 이름:</td>
					        		<td><input type="text" name="classname" placeholder="클래스 입력해주세요."></td>
					      		</tr>
							</table>
							<input type="button" id="write" class="btn btn-primary" value="write" style="border-color: transparent!important; margin-left: 443px;"">
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</form>
					        </div>	
					        <!-- 
					        <div class="modal-footer">
					        </div>
					         -->
					      </div>
					    </div>
					  </div>
					
					</div>
					
					
					<div class="cal_list">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/cal_list.PNG" style="width:100%; height: 100%;">
					</div>

				</div>
			</div>
		</div>
	</section>
<!-- footer start -->		
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
<!-- footer end -->	
</body>
</html>