<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		
		$("#myBtn").click(function(){
			$("#logModal").modal();
		});
		$(".header_nav_menu ul li").mouseenter(function(){
	         $(this).find("ul").stop().fadeIn(300);
	    });
		$(".header_nav_menu ul li").mouseleave(function(){
			$(this).find("ul").hide();
		});
		$("#memberInfo").click(function(){
			$(".member_info").toggle();
		});
		$("section,footer,.header_nav_menu_ul").click(function(){
		    $(".member_info").hide();
		});
	});
</script>
<header class="main_wrap">
	<div class="header_wrap">
		<div class="header_menu_wrap">
			<div class="logo_wrap">
				<a href="${pageContext.request.contextPath }"><img style="width:220px;height:90px;margin-bottom:20px;margin-left:70px;" alt="logo" src="${pageContext.request.contextPath }/resources/images/logo.png"></a>
			</div>
				<div class="header_nav_wrap">
	               <div class="header_nav_info">
	                  <ul class="header_nav_info_ul">
	                     <li><a href="/ctrl/">HOME</a></li>
	                     <c:if test="${empty member}">
		                     <li><a href="javascript:void(0)" id="myBtn">로그인</a></li>
		                     <li><a href="${pageContext.request.contextPath}/member/memberAgree">회원가입</a></li>
	                     </c:if>
	                     <c:if test="${!empty member}">
	                     	<li><a href="javascript:void(0)" id="memberInfo">${member.name}</a></li>
	                     </c:if>
	                  </ul>
	               </div>
					<div class="member_info">
						<div class="member_info_wrapper">
							<div class="info_wrapper_img">
								<div>
									<c:choose>
										<c:when test="${!empty member.file_name}">
											<img src="${pageContext.request.contextPath}/resources/upload/${member.file_name}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/defaultProfile.PNG">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="info_wrapper_contents">
								<h4>${member.name}</h4><span>님</span>  &nbsp;
								<c:choose>
									<c:when test="${member.kind eq 'teacher'}">
										강사
									</c:when>
									<c:when test="${member.kind eq 'student'}">
										학생
									</c:when>
									<c:when test="${member.kind eq 'normal'}">
										일반회원
									</c:when>
									<c:otherwise>
										관리자
									</c:otherwise>
								</c:choose>
								<p>${member.email}</p>
								<p>${member.phone}</p>
							</div>
						</div>
						<div class="member_info_button">
							<c:choose>
								<c:when test="${member.kind eq 'admin'}">
									<a href="${pageContext.request.contextPath}/member/memberManagement" class="mypage">관리자 페이지</a>
									<a href="${pageContext.request.contextPath}/member/memberLogout" class="logout">로그아웃</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/member/memberMypage" class="mypage">마이페이지</a>
									<a href="${pageContext.request.contextPath}/member/memberLogout" class="logout">로그아웃</a>	
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="header_nav_menu">
	                  <ul class="header_nav_menu_ul">
	                     <li>
	                        <a href="#">학원 소개</a>
	                        <ul class="header_nav_menu_ul_dropdown ul">
	                           <li><a href="#">교육 이념</a></li>
	                           <li><a href="${pageContext.request.contextPath}/intro/teacherIntro">강사 소개</a></li>
	                           <li><a href="${pageContext.request.contextPath}/intro/roadIntro">찾아오시는 길</a></li>
	                        </ul>
	                     </li>
	                     <li>
	                        <a href="#">교육 과정</a>
	                        <ul class="header_nav_menu_ul_dropdown ul">
	                           <li><a href="${pageContext.request.contextPath}/calendar/test">커리큘럼</a></li>
	                           <li><a href="${pageContext.request.contextPath}/sign/sign_apply">수강신청</a></li>
	                        </ul>
	                     </li>
	                     <li>
	                        <a href="#">커뮤니티</a>
	                        <ul class="header_nav_menu_ul_dropdown ul">
	                           <li><a href="${pageContext.request.contextPath}/notice/freeboard?curPage=1">자유 게시판</a></li>
	                           <li><a href="#">수강 후기</a></li>
	                        </ul>   
	                     </li>
	                     <li>
	                        <a href="#">나의 메뉴</a>
	                        <ul class="header_nav_menu_ul_dropdown ul">
	                           <li><a href="#">반 게시판</a></li>
	                           <li>
	                           		<c:if test="${member.kind eq 'student' or member.kind eq 'teacher'}">
		                           		<a href="#" id="messanger" onclick="window.open('${pageContext.request.contextPath}/chat${member.classname}','toolbar=no,menubar=no,location=no,status=no');">반 메신저</a>                           	
	                           		</c:if>
	                           </li>
	                           <li><a href="${pageContext.request.contextPath}/quiz/quizList">과제 게시판</a></li>
	                        </ul>   
	                     </li>
	                     <li>
	                        <a href="#">상담 센터</a>
	                        <ul class="header_nav_menu_ul_dropdown ul">
	                           <li><a href="${pageContext.request.contextPath}/board/qna/qnaWrite">Q&A</a></li>
	                           <li><a href="#">상담하기</a></li>
	                        </ul>
	                     </li>
	               </ul>
				</div>
			</div>
		</div>
	</div>
   
<!-- Modal -->
<div class="container">
  <div class="modal fade" id="logModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="font-size: 25px; font-weight: bold;">회원 로그인</h4>
        </div>
        <div class="modal-body" style="height: 260px;">
          <form class="modal_frm" action="${pageContext.request.contextPath}/member/memberLogin">
            <div class="form-group">
              <label for="logId" style="display: block;"><span class="glyphicon glyphicon-user" style="top: 3px;"></span> ID</label>
              <input type="text" class="form-control" id="logId" placeholder="Enter ID" name="logId">
            </div>
            <div class="form-group">
              <label for="logPw" style="display: block;"><span class="glyphicon glyphicon-lock" style="top: 3px;"></span> PASSWORD</label>
              <input type="password" class="form-control" id="logPw" placeholder="Enter PASSWORD" name="logPw">
            </div>
            <div class="btn_group">
            	<p>
					<a href="${pageContext.request.contextPath}/member/memberAgree">새 계정 만들기</a>
					<span>&nbsp; | &nbsp;</span>
					<a href="${pageContext.request.contextPath}/member/memberFind">ID/PW 찾기</a>
				</p>
	            <button type="submit" class="btn btn-default btn-success btn-block">
	            	<span class="glyphicon glyphicon-off" style="top: 3px;"></span> 로그인
	           	</button>
		        <button type="submit" class="btn btn-default btn-default" data-dismiss="modal" style="width: 90px; height: 40px;">
		        	<span class="glyphicon glyphicon-remove" style="top: 3px;"></span> 취소
		        </button>
            </div>
          </form>
        </div>
        <div class="modal-footer">
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			  <div id="naver_id_login"></div>
        </div>
      </div>
    </div>
  </div>
  </div>
</header>
<div id="spacebar"></div>
<!-- 네이버 아이디로 로그인 자바스크립트 -->
	<script type="text/javascript">
		var local = "";
	  	var naver_id_login = new naver_id_login("uRjYXEHnU9xxXFdZ8rmp", "http://localhost/ctrl/");
	  	var state = naver_id_login.getUniqState();
	  	
		naver_id_login.setButton("green", 12,50);
		naver_id_login.setDomain("");
		naver_id_login.setState(state);
	  
		naver_id_login.init_naver_id_login();
		
	  // 네이버 사용자 프로필 조회
	  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
		  var name = naver_id_login.getProfileData('name');
		  var email = naver_id_login.getProfileData('email');
		  var age = naver_id_login.getProfileData('birthday');
	  	 
		$.ajax({
	    	type:'POST',
	    	url:'../../ctrl/member/naverMemberCheck',
	    	data:
	    	{
	    		name:name,
	    		email:email,
	    		age:age
	    	},
	    	success:function(e){
	    		
	    		location.href=e;
	    	}
	    });
	  
	  }
	  
	</script>