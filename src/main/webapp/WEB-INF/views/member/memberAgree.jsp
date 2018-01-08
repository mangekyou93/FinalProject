<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/memberAgree.css" rel="stylesheet">
<script type="text/javascript">
	window.onload = function()
	{
		var cAll = document.getElementById("cAll");
		var c1 = document.getElementById("c1");
		var c2 = document.getElementById("c2");
		var agreeBtn = document.getElementById("agreeBtn");
	
		cAll.addEventListener("click", all);
		c1.addEventListener("click", go1);
		c2.addEventListener("click", go2);
		agreeBtn.addEventListener("click", next);
		
		function next()
		{
			if(cAll.checked == true)
			{
				$("#agreeBtn").prop("href", "memberJoin");
			}
			else
			{
				alert("약관에 모두 동의해 주세요.");
				$("#agreeBtn").prop("href", "javascript:void(0)");
			}
		}
		function all()
		{
			if(cAll.checked)
			{
				c1.checked = true;
				c2.checked = true;
				agreeBtn.style.backgroundColor = "RGB(18, 165, 244)";
			}
			else
			{
				c1.checked = false;
				c2.checked = false;
				agreeBtn.style.backgroundColor = "darkgrey";
			}
		}
		function go1()
		{
			if(c1.checked == false)
			{
				cAll.checked = false;
				agreeBtn.style.backgroundColor = "darkgrey";
			}
			else if(c1.checked == true && c2.checked == true)
			{
				cAll.checked = true;
				agreeBtn.style.backgroundColor = "RGB(18, 165, 244)";
			}
		}
		function go2()
		{
			if(c2.checked == false)
			{
				cAll.checked = false;
				agreeBtn.style.backgroundColor = "darkgrey";
			}
			else if(c1.checked == true && c2.checked == true)
			{
				cAll.checked = true;
				agreeBtn.style.backgroundColor = "RGB(18, 165, 244)";
			}
		}
	}
</script>
</head>
<body>
<!-- Header의 시작 부분 -->
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp"></c:import>
<!-- Header의 끝 부분 -->
	
<!-- Contents 시작 부분 -->	
	<section>
		<div class="allContents">
			<div class="leftContents">
				<div class="leftMenu">
					<div class="leftMenu_header">
						회원가입
					</div>
					<div class="leftMenu_wrapper">
						<ul>
							<li style="background-color: RGB(18, 165, 244);">
								<a href="memberAgree" style="color: white;">이용약관 및 개인정보취급방침</a>
							</li>
							<li>
								<a href="memberAgree">회원가입</a>
							</li>
							<li>
								<a href="#">ID/PW 찾기</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="rightContents">
				<div class="contents_header">
					${menuTitle}			
				</div>
				<div class="wrapper_title">
					<h3>개인 가입 약관 동의</h3>
					<div class="title_text">서비스 약관 및 개인정보 수집, 이용에 <strong>동의</strong>해 주세요.</div>
					<div class="allAgreement">
						<label for="cAll">
							전체 동의<input type="checkbox" id="cAll">					
						</label>
					</div>
				</div>
					<div class="wrapper_box1">
						<div class="agreements">보근두근 서비스 약관 동의<input type="checkbox" id="c1"></div>
						<div class="containers">
							<strong>제 1 장 총 칙</strong>
							<span>제 1 조 목적 </span>
							<p>본 약관은 서비스 이용자가 주식회사 카카오(이하 “회사”라 합니다)가 제공하는 온라인상의 
							인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한 유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하 같습니다)에
							회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스 이용자를 말합니다. 이하 “회원”이라고 합니다)의
							권리•의무 및 책임사항을 규정함을 목적으로 합니다.</p>
							<span>제 2 조 (약관의 명시, 효력 및 개정)</span>
							<ol>
								<li><div class="num">①</div><p>회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.</p></li>
								<li><div class="num">②</div><p>회사는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률,
									소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p></li>
								<li><div class="num">③</div><p>회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께
									그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간 동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터 
									적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로 개정약관을 발송하여 고지합니다.</p></li>
								<li><div class="num">④</div><p>회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일 후까지
									거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다.
									회원이 개정약관에 동의하지 않을 경우 회원은 제17조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.</p></li>
							</ol>
							<strong>제 2 장 회원의 가입 및 관리</strong>
							<span>제 3 조 (회원가입절차)</span>
							<ol>
								<li><div class="num">①</div><p>서비스 이용자가 본 약관을 읽고 “동의” 버튼을 누르거나 “확인” 등에 체크하는 방법을 취한 경우 본 약관에 동의한 것으로 간주합니다.</p></li>
								<li><div class="num">②</div><p>회사의 서비스 이용을 위한 회원가입은 서비스 이용자가 제1항과 같이 동의한 후, 
									회사가 정한 온라인 회원가입 신청서에 회원 ID를 포함한 필수사항을 입력하고, “등록하기” 내지 “확인” 단추를 누르는 방법으로 합니다. 
									다만, 회사가 필요하다고 인정하는 경우 회원에게 별도의 서류를 제출하도록 할 수 있습니다.</p></li>
								<li><div class="num">③</div><p>법인고객 회원가입의 경우 회원가입 신청서의 제출, 
									서비스 이용대금의 납부 이외에 회사가 정하는 추가 서류의 제출이 추가적으로 필요합니다.</p></li>
								<li><div class="num">④</div><p>법인고객 회원가입의 경우 서비스 이용자와 이용요금 납입자가
									다를 경우 회사는 이를 확인하기 위하여 제 증명을 요구할 수 있습니다.</p></li>
							</ol>
							<span>제 4 조 (회원등록의 성립과 유보 및 거절)</span>
							<ol>
								<li><div class="num">①</div><p>회원등록은 제3조에 정한 절차에 의한 서비스 이용자의 회원가입 신청과 회사의 회원등록 승낙에 의하여 성립합니다. 
									회사는 회원가입 신청자가 필수사항 등을 성실히 입력하여 가입신청을 완료하였을 때에는 필요한 사항을 확인한 후 지체 없이 이를 승낙을 하여야 합니다. 
									단 회원가입 신청서 제출 이외에 별도의 자료 제출이 요구되는 경우에는 예외로 합니다.</p></li>
								<li><div class="num">②</div><p>회사는 아래 각 호의 1에 해당하는 경우에는 회원등록의 승낙을 유보할 수 있습니다.</p></li>
								<ol class="number">
									<li>1. 제공서비스 설비용량에 현실적인 여유가 없는 경우</li>
									<li>2. 서비스를 제공하기에는 기술적으로 문제가 있다고 판단되는 경우</li>
									<li>3. 법인 고객으로 가입신청을 하고 제3조 제3항 내지 제4항의 의무를 이행하지 않은 경우</li>
									<li>4. 기타 회사가 재정적, 기술적으로 필요하다고 인정하는 경우</li>
								</ol>
								<li><div class="num">③</div><p>회사는 아래 각 호의 1에 해당하는 경우에는 회원등록을 거절할 수 있습니다.</p></li>
								<ol class="number">
									<li>1. 가입신청서의 내용을 허위로 기재하였거나 허위서류를 첨부하여 가입신청을 하는 경우</li>
									<li>2. 법인 고객으로 가입신청을 하고 회사가 별도로 규정하는 일정한 기간 이내에 제3조 제3항 내지 제4항의 의무를 이행하지 않은 경우</li>
									<li>3. 14세 미만의 아동이 개인정보제공에 대한 동의를 부모 등 법정대리인으로부터 받지 않은 경우</li>
									<li>4. 기타 회사가 관련법령 등을 기준으로 하여 명백하게 사회질서 및 미풍양속에 반할 우려가 있음을 인정하는 경우</li>
									<li>5. 제17조 제2항에 의하여 회사가 계약을 해지했던 회원이 다시 회원 신청을 하는 경우</li>
								</ol>
							</ol>
						</div>
					</div>
					
					<div class="wrapper_box2">
						<div class="agreements">보근두근 개인정보 수집 및 이용 동의<input type="checkbox" id="c2"></div>
						<div class="containers">
						<p class="space">(주)보근두근은 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다합니다.</p>
						<span>1. 수집목적</span>
						<p>• 이용자 식별, 원활한 의사소통, 부정이용 시 제재 및 기록 </p>
						<p>• 회원제 서비스 제공, 문의사항 또는 불만 처리, 공지사항 전달 </p>
						<p>• 유료 서비스 이용 시 요금 정산 </p>
						<p>• 신규 서비스 개발, 이벤트 행사 시 정보 전달, 마케팅 및 광고 등에 활용 </p>
						<p>• 서비스 이용 기록 및 통계 분석을 통한 서비스 개선 및 맞춤형 서비스 제공 </p>
						<p>• 프라이버시 보호 측면의 서비스 환경 구축 </p>
						<span>2. 수집항목</span>
						<p>(필수) 아이디, 비밀번호, 이름, 연락처(휴대폰번호 또는 이메일 주소 중 1개 선택) </p>
						<span>3. 보유기간</span>
						<p>수집된 정보는 회원탈퇴 후 지체없이 파기됩니다.</p><br>
						<p>서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다. 
							더 자세한 내용에 대해서는 <a href="http://policy.daum.net/info_protection/info_protection">개인정보처리방침</a>을 참고하시기 바랍니다.</p>
						</div>
					</div>
				<div class="wrapper_foot">
					<div class="foot_btn">
						<a href="memberJoin" id="agreeBtn" style="background-color: darkgrey">
							동의
						</a>
						<a href="/ctrl/">
							이전
						</a>
					</div>
				<!-- 
					<div class="foot_other">
						<a href="#">
							네이버 아이디로 가입하기
						</a>
					</div>
					<div class="foot_other">
						<a href="#">
							구글 아이디로 가입하기
						</a>
					</div>
				 -->
				</div>
			</div>
		</div>
	</section>
<!-- Contents 끝 부분 -->
<!-- Footer 시작 부분 -->
	<c:import url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp"></c:import>
<!-- Footer 끝 부분 -->
</body>
</html>