<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/quizList.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		var m = "${message}";
		if(!(m=="")){
			alert(m);
		}
		
		$("#write").click(function(){
			location.href='quizWrite';
		});
		
	});
	
	/* 삭제 이벤트 */
	var deleteIcon=function(num){
		
		 if(confirm("삭제하시겠습니까?"))
		 {
		   location.href="./quizDelete?num="+num;
		  }
		 else
		 {
			
		 }
	};

	/* 삭제 이벤트 */
	var updateIcon=function(num){
		
		 if(confirm("수정하시겠습니까?"))
		 {
		   location.href="./quizUpdate?num="+num;
		  }
		 else
		 {
			
		 }
	};
	//selectOne
	var quizTitle=function(num){
		location.href="./quizView?num="+num;
	}	
</script>

</head>
<body>
<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp" />
	<section>
		<div class="allContents">
			<div class="leftContents">
				<div class="leftMenu">
					<div class="leftMenu_header">
						나의 메뉴
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li>
								<a href="#">반 게시판</a>
							</li>
							<li>
								<c:if test="${member.kind eq 'student' or member.kind eq 'teacher'}">
								<a href="#" id="messanger" onclick="window.open('${pageContext.request.contextPath}/chat${member.classname}','toolbar=no,menubar=no,location=no,status=no');">반 메신져</a>
								</c:if>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/quiz/quizList" style="color: white;">과제 게시판</a>
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
					<div class="containerMain">
						<div class="row">
							<div class="headerMain">
								<p>${list[0].classKind}문제</p>
							</div>
							<div class="level">
								<div class="algorithm-levels col-lg-9 col-md-12 col-sm-12 col-xs-12">
				
									<a href="#" id="test" class="button-3d" style="text-decoration: none;">Level 1</a> 
									<a href="#"id="test" class="button-3d" style="text-decoration: none;">Level 2</a>
									<a href="#" id="test" class="button-3d" style="text-decoration: none;">Level 3</a>
									<a href="#" id="test" class="button-3d" style="text-decoration: none;">Level 4</a>
				
								</div>
				
							</div>
							<div class="table_container">
							<c:forEach items="${list}" var="dto">
								<div class="table_quiz">
					<div style="float: left;margin-bottom: 3px; margin-right: 3px;"> <img src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/check.png"></div>
										
										<span class="updateIcon"><img onclick="javascript:updateIcon(${dto.num});" id="updateIcon" style="width: 20px; height:20px; margin-right: 2px;" src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/updateIcon.png"></span>
										<span class="deleteIcon"><img onclick="javascript:deleteIcon(${dto.num});"  style="width: 20px; height:20px;" src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/deleteIcon.png"></span>
									<div class="flex-space-between">
									
										<h5 class="quizTitle" onclick="javascript:quizTitle(${dto.num});">${dto.title}</h5>
									</div>
				
									<div class="card-algorithm-content">
										<p class="card-algorithm-info">
											<span>${dto.quizLevel}</span>
											<!--<span>성공율: 0%</span>-->
											<span>완료: 1075명</span>
										</p>
										
									</div>
								</div>
								</c:forEach>
								<!-- 테이블 컨테이너 -->
				
							</div>
							<div class="page_contain">
								<!-- 페이징처리 -->
								<ul class="pagination">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
								</ul>
								
							<button id="write" style="float: right;  margin-top: 25px; margin-right: 25px;"> 글쓰기</button>
							</div>
							
							<!-- 페이징 처리  -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp" />
</body>
</html>