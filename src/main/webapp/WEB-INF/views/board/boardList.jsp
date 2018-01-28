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
<link href="${pageContext.request.contextPath }/resources/css/community/boardList.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		if(${message eq '작성성공'}){
			alert("${message}");
		}
		
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
	});
</script>
<title>자유 게시판</title>
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
					<table style="font-size:12px;" class="table table-bordered">
						<tr>
							<td class="con">번호</td>
							<td class="con" style="width: 400px;">제목</td>
							<td class="con" style="width: 96px;">작성자</td>
							<td class="con">작성일</td>
							<td class="con">조회수</td>
						</tr>
						<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.board_seq}</td>
							<td><a id="community_boardOne" href="./boardOne?board_seq=${dto.board_seq}">${dto.title }</a></td>
							<td>${dto.writer }</td>
							<td>${dto.reg_date }</td>
							<td>${dto.hit}</td>
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
							<form name="frm" action="freeboard">
							<input type="hidden" name="curPage" value="1">
							<ul style="list-style: none; margin-bottom: 0;">
								<li><select class="kind" id="kind" name="kind">
									<option>제목</option>
									<option>작성자</option>
									<option>내용</option>
								</select></li>
								<li><input type="text" id="search" class="form-control" value="${pager.search }" name="search" style="width: 200px;"></li>
								<li><input type="button" id="search_btn" class="btn btn-default" value="검색"></li>
							</ul>
							</form>
						</div>
							<a href="#" class="coummunity list">목록</a>
							<c:if test="${member ne null}">
								<a href="${pageContext.request.contextPath}/notice/freeboardInsert" class="coummunity write">글쓰기</a>
							</c:if>
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