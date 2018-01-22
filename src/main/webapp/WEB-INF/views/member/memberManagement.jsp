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
<link href="${pageContext.request.contextPath }/resources/css/memberManagement.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$(".page").click(function(){
			 var cur = $(this).prop("title");
			 var kind = $(".kind").val();
			 var search = $("#search").val();
			 document.frm.curPage.value = cur;
			 document.frm.kind.value = kind;
			 document.frm.search.value = search;
			 document.frm.submit();
		});
		
	 	$("#search_btn").click(function(){
	 		
			var cur = parseInt($(".page").prop("title"));
			var kind = $(".kind").val();
			var search = $("#search").val();
			
			if(isNaN(cur)){
				cur=1;
				
			}
			
			document.frm.curPage.value = cur;
			document.frm.kind.value = kind;
			document.frm.search.value = search;
			document.frm.submit();
		});
	 	
	 	$(".glyphicon-user").click(function(){
	 		var check = confirm("회원을 강사로 만드시겠습니까?");
	 		
	 		if(check)
	 		{
	 			$.ajax({
	 				url:"../member/memberTeacherUpdate",
	 				type:"post",
	 				data:{
	 					"member_seq":$(this).prop("title")
	 				},
	 				success:function(data){
	 					alert(data.trim());
	 					location.reload();
	 				}
	 			});
	 		}
	 	});
	 	
	 	$(".glyphicon-remove").click(function(){
	 		var check = confirm("정말로 삭제 하시겠습니까?");
	 		
	 		if(check)
	 		{
	 			$.ajax({
	 				url:"../member/memberDelete",
	 				type:"post",
	 				data:{
	 					"member_seq":$(this).prop("title")
	 				},
	 				success:function(data){
	 					alert(data.trim());
	 					location.reload();
	 				}
	 			});
	 		}
	 	});
	});
</script>
<title>회원 관리</title>
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
						관리자
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/member/memberManagement" style="color: white;">회원관리</a>
							</li>
							<%-- 
							<li>
								<a href="${pageContext.request.contextPath}/member/memberAgree">수강 후기</a>
							</li>
							 --%>
						</ul>
					</div>
				</div>
			</div>
			<div class="rightContents">
				<div class="contents_header">
					${menuTitle}			
				</div>
				<div class="contents_wrapper">
					<!-- <h2>자유 게시판</h2> -->
					<table style="font-size:12px;" class="table table-bordered">
						<tr>
							<td class="con">아이디</td>
							<td class="con">이름</td>
							<td class="con">핸드폰번호</td>
							<td class="con" style="width: 310px;">주소</td>
							<td class="con">종류</td>
							<td class="con" style="width: 50px;"> </td>
						</tr>
						<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.id}</td>
							<td>${dto.name }</td>
							<td>${dto.phone }</td>
							<td>
								<c:forTokens items="${dto.address}" delims="/" var="addr">
									${addr}
								</c:forTokens>
							</td>
							<c:choose>
								<c:when test="${dto.kind eq 'teacher'}">
									<td>강사</td>
								</c:when>
								<c:when test="${dto.kind eq 'student'}">
									<td>학생</td>
								</c:when>
								<c:when test="${dto.kind eq 'normal'}">
									<td>일반</td>
								</c:when>
							</c:choose>
							<td>
								<c:choose>
									<c:when test="${dto.kind eq 'teacher'}">
										<span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true" style="color: red;" title="${dto.member_seq}"></span>
									</c:when>
									<c:when test="${dto.kind eq 'student'}">
										<span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true" style="color: red;" title="${dto.member_seq}"></span>
									</c:when>
									<c:when test="${dto.kind eq 'normal'}">
										<span class="glyphicon glyphicon glyphicon-user" aria-hidden="true" style="color: RGB(18, 165, 244);" title="${dto.member_seq}"></span>
										<span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true" style="color: red;" title="${dto.member_seq}"></span>
									</c:when>
								</c:choose>
							</td>
						</tr>					
						</c:forEach>
					</table>
					<c:if test="${total>0 }">
						<div class="pagenation">
							<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" var="i">
								<span title="${i}" class="page">${i}</span>
							</c:forEach>
						</div>
					</c:if>
					<div class="community_bottom_bar">
						<div class="community_search">
							<form name="frm" action="${pageContext.request.contextPath}/member/memberManagement">
							<input type="hidden" name="curPage" value="1">
							<ul style="list-style: none; margin-bottom: 0;">
								<li>
									<select class="kind" id="kind" name="kind">
										<option>회원명</option>
										<option>아이디</option>
										<option>종류</option>
									</select>
								</li>
								<li><input type="text" id="search" class="form-control2" value="" name="search" style="width: 200px;"></li>
								<li><input type="button" id="search_btn" class="btn2 btn-default" value="검색"></li>
							</ul>
							</form>
						</div>
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