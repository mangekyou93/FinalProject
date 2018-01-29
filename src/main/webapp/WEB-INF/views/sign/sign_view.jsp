<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sign_view.css" rel="stylesheet">
</head>
<body>

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
				<div class="contents_header">
					${menuTitle}			
				</div>
			<div class="rightContents">
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
			 						<table>
			 						<tr>
										<td>${sview.major}</td>
										<td>${sview.type}</td>
										<td>${sview.name}</td>
										<td></td>
										<td>${cview.contents}</td>
										<td>${cview.date_start}</td>
									</tr>
									</table>
	
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
									
							</div>
						</div>
						<input type="button" id="button" value="수강신청">
						</form>
						<script type="text/javascript">
						$("#button").click(function(){
						    $("#frm").submit();
							    return "redirect:../calender/calender_test";
						});
						</script>
				</div>
			</div>
		</div>
	</section>
</body>
</html>