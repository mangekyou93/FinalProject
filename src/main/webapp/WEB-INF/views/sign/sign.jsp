<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/resources/css/sign.css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
<!-- <script type="text/javascript">
var IMP = window.IMP; // 생략가능
IMP.init('imp53563235'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

IMP.request_pay({
    pg : 'kakao', // 결제방식
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 1000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    m_redirect_url : 'https://www.google.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        
        return "redirect:../calender/calender_test";
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
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
						교육과정
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/calendar/test">커리큘럼</a>
							</li>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="${pageContext.request.contextPath}/sign/sign_apply" style="color: white;">수강신청</a>
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
					<form action="${pageContext.request.contextPath}/sign/sign_apply" method="post" id="frm">
						<div id="content_body">
							<div class="subject">
								<span class="reg">온라인 수강신청</span>
							</div>
							
							<div class="register_body">
								<div class="hope_major">
									<div class="hope_left">
										<div class="hope_banner">희망전공선택</div>
									</div>
									
									<div class="major_choose">
										<p class="m_p1">
											<b class="choose">희망전공</b>
											<select id="hope_major" name="major">
												<option value="자바프로그래머">자바프로그래머</option>
												<option value="정보보안">정보보안</option>
											</select>
											<b class="choose">과정형태</b>
											<select id="hope_type" name="type">
												<option value="국가기간">국가기간</option>
												<option value="지역,산업">지역,산업</option>
												<option value="내일배움">내일배움</option>
												<option value="현찰" >현찰</option>
											</select>
										</p>
									</div>
									
								</div>
								<!-- ====================================희망전공=========================================== -->
									
									<div id="cs_info">
										<div class="cs_left">
											<div class="cs_banner">신청자 정보</div>
										</div>
										<div class="visit_register">
										<div class="visit_register_form">
											<p class="cs_p">
												<b class="choose">이름</b>
												<div class="cs_a1">
												<input type="text" id="name" name="name">
												</div>
											</p>
											
											<p class="cs_p">
												<b class="choose">생년월일</b>
												<div class="cs_a2">
												<input type="date" name="birth" id="birth">
												</div>
												<!-- <select id="year" name="birth">
													<option value="2000">2000</option>
													<option value="1999">1999</option>
													<option value="1998">1998</option>
													<option value="1997">1997</option>
													<option value="1996">1996</option>
													<option value="1995">1995</option>
													<option value="1994">1994</option>
													<option value="1993">1993</option>
													<option value="1992">1992</option>
													<option value="1991">1991</option>
													<option value="1990">1990</option>
													<option value="1989">1989</option>
													<option value="1988">1988</option>
													<option value="1987">1987</option>
												</select>
												<span>년</span>
												<select id="month" name="birth">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
												<span>월</span>
												<select id="day" name="birth">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>
												</select> -->
											</p>
											
											<p class="cs_p">
												<b class="choose">연락처</b>
												<div class="cs_a3">
												<input type="text" name="phone" id="phone" placeholder="-추가해서 써라">
												</div>
												<!-- <select id="ph_num1" name="phone">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="017">017</option>
												</select>
												<span>-</span>
												<input type="text" name="phone" id="ph_num2">
												<span>-</span>
												<input type="text" name="phone" id="ph_num3"> -->
											</p>
											<p class="cs_p">
												<b class="choose">최종학력</b>
													<div class="cs_a4">
													<input type="radio" name="f_edu" value="대졸이상">대졸이상
													<input type="radio" name="f_edu" value="초대졸">초대졸
													<input type="radio" name="f_edu" value="고졸">고졸
													<input type="radio" name="f_edu" value="기타">기타
													</div>
											</p>
											
											<p class="cs_p">
												<b class="choose">수강목적</b>
													<div class="cs_a5">
													<input type="radio" name="purpose" value="취업">취업
													<input type="radio" name="purpose" value="이직">이직
													<input type="radio" name="purpose" value="창업">창업
													<input type="radio" name="purpose" value="기타">기타
													</div>
											</p>
												<p class="cs_p1">
												<b class="choose">각오</b>
												</p>
												<p class="cs_p">
												<div class="cs_a6">
													<textarea rows="4" cols="45" placeholder="각오한마디" name="resolution" style="resize: none;"></textarea>
												</div>
												</p>
										</div>
										</div>
									</div>
									<!-- ====================================신청자 정보=========================================== -->
									<div id="loca_info">
										<div class="loca_left">
											<div class="loca_banner">지점선택</div>
										</div>
										
										<div class="loca_register">
											<p>
													<div class="lo_a">
														<input type="radio" name="location" value="강남">강남
														<input type="radio" name="location" value="종로">종로
														<input type="radio" name="location" value="당산">당산
														<input type="radio" name="location" value="이태원">이태원
													</div>
											</p>
										</div>
									</div>
									아이디: <input type="text" name="sid">
							</div>
						</div>
						<input type="button" id="button" value="수강신청">
						</form>
						<script type="text/javascript">
						$("#button").click(function(){
						    /* $("#frm").submit(); */
							var IMP = window.IMP; // 생략가능
							IMP.init('imp53563235'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
						
							IMP.request_pay({
							    pg : 'kakao', // 결제방식
							    pay_method : 'card',
							    merchant_uid : 'merchant_' + new Date().getTime(),
							    name : '주문명:결제테스트',
							    amount : 1000,
							    buyer_email : 'iamport@siot.do',
							    buyer_name : '구매자이름',
							    buyer_tel : '010-1234-5678',
							    buyer_addr : '서울특별시 강남구 삼성동',
							    buyer_postcode : '123-456',
							    m_redirect_url : 'https://www.google.com/payments/complete'
							}, function(rsp) {
							    if ( rsp.success ) {
							        var msg = '결제가 완료되었습니다.';
							        msg += '고유ID : ' + rsp.imp_uid;
							        msg += '상점 거래ID : ' + rsp.merchant_uid;
							        msg += '결제 금액 : ' + rsp.paid_amount;
							        msg += '카드 승인번호 : ' + rsp.apply_num;
							        $("#frm").submit();
							        return "redirect:../calender/calender_test";
							    } else {
							        var msg = '결제에 실패하였습니다.';
							        msg += '에러내용 : ' + rsp.error_msg;
							    }
							    alert(msg);
							    return "redirect:../calender/calender_test";
							});
						});
						</script>
				</div>
			</div>
		</div>
	</section>
<!-- footer start -->		
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
<!-- footer end -->	
</body>
</html>