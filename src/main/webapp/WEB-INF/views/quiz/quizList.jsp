<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/header.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
   rel="stylesheet">
<script type="text/javascript">
   $(function() {

      var level =null;
      /* Level 나누기  */
      $(".button-3d").click(function(){
      
         var cur = $("#cur123").val();
         level = $(this).text();
         
            document.frm.curPage.value=cur;
            document.frm.list.value=level;
            document.frm.submit();
            
      }) ;
         
      
      /*Level 나누기  */
      /*페이징  */
         $(".list").click(function(){
            var cur = $(this).attr("title");
            var level = $("#level123").val();
            document.frm.curPage.value=cur;
            document.frm.list.value=level;
            document.frm.submit();
         });
      /*페이징 끝  */
      $(".header_nav_menu ul li").hover(function() {
         $(this).find("ul").stop().fadeToggle(300);
      });


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

<style type="text/css">
.list {
   cursor: pointer;
   padding: 10px;
   background-color: whitesmoke;
   margin-top: 10px;
}

.deleteIcon {
   cursor: pointer;
}

.updateIcon {
   cursor: pointer;
}

section {
   width: 100%;
   height: auto;
}

.allContents {
   width: 65%;
   height: auto;
   margin: 0 auto;
}

.leftContents {
   width: 25%;
   height: auto;
   float: left;
}

.leftMenu {
   width: 100%;
   height: auto;
}

.leftMenu_header {
   width: 100%;
   height: 40px;
   background-color: #3f4b5e;
   color: white;
   font-size: 20px;
   font-weight: bolder;
   line-height: 40px;
   padding-left: 10px;
}

.leftMenu_wrapper {
   width: 100%;
   height: auto;
   margin-top: 20px;
}

.leftMenu_wrapper ul {
   list-style: none;
}

.leftMenu_wrapper ul li {
   width: 100%;
   height: 40px;
   line-height: 40px;
   border-bottom: 1px solid #E0E0E0;
   padding-left: 10px;
}

.leftMenu_wrapper ul li a {
   width: 100%;
   height: 100%;
   color: black;
   font-size: 15px;
   font-weight: bold;
   display: block;
}

.leftMenu_wrapper ul li a:hover {
   color: RGB(18, 165, 244);
   text-decoration: none;
}

.containerMain {
   width: 70%;
   height: auto;
   overflow: hidden;
   padding-left: 16px;
   padding-right: 16px;
   padding-bottom: 30px;
   max-width: 100%;
   box-sizing: border-box;
   margin: 0 auto;
   background-color: #eee;
}

.row {
   width: 100%;
   height: 100%;
   max-width: 100%;
   margin: 0 auto;
}

.headerMain {
   width: 100%;
   height: 30px;
   margin: 0 auto;
   margin-top: 20px;
   padding-left: 10px;
   border-bottom-color: whitesmoke;
   border: 3px;
}

.level {
   width: 100%;
   height: auto;
   overflow: hidden;
   margin: 0 auto;
   margin-top: 20px;
   margin: 0 auto;
   margin-bottom: 30px;
}

.quizTitle {
   margin-top: 3px;
   cursor: pointer;
}

.table_quiz {
   width: calc(50% - 16px);
   margin: 2.5rem 0.5rem 0 0.5rem;
   transition-duration: 0.06s;
   box-shadow: inset -1px 0 #DEE6EA, inset 0 1px #DEE6EA, inset 0 -1px
      #DEE6EA;
   border-radius: 3px;
   border-left: 6px solid lightblue;
   padding: 0.9375rem;
   float: left;
   position: relative;
   min-height: 1px;
   box-sizing: border-box;
   
}

.table_container {
   margin-left: 0px;
   margin-right: 0px;
   height: auto;
   overflow: hidden;
   width: 100%;
   background-color: whitesmoke;
   margin-bottom: 20px;
   padding-bottom: 10px;
   padding-left: 10px;
   margin-top:30px;
}

body {
   font-family: "roboto", "맑은 고딕", malgun gothic, "돋움", Dotum, sans-serif;
   font-size: 16px;
   line-height: 24px;
   color: black;
}

.pageination {
   margin: 0 auto;
}

.page_contain {
   text-align: center;
}

.levelbtn {
   display: inline-block;
   background-color: #F44336;
   /* 마진 & 패딩 */
   margin-bottom: 3px;
   margin-right: 0.0625rem;
   /* 테두리  */
   border-radius: 0;
   border-width: 1px;
   font-size: 5px;
   line-height: 20px;
   text-align: center;
   vertical-align: middle;
   touch-action: manipulation;
   border: 1px solid transparent !important;
   white-space: nowrap;
   font-weight: 500;
   cursor: pointer;
   box-sizing: border-box;
   font-family: "roboto", "맑은 고딕", malgun gothic, "돋움", Dotum, sans-serif;
   word-break: keep-all;
   -webkit-tap-highlight-color: transparent;
   width: 14%;
   color: white;
}

.algorithm-levels col-lg-9 col-md-12 col-sm-12 col-xs-12 {
   display: flex;
   width: 100%;
   float: left;
   position: relative;
   min-height: 1px;
   padding: 0 8px;
   box-sizing: border-box;
}

.button-3d:HOVER {
   text-decoration: none;
}

.flex-space-between {
   
}

.updateIcon {
   float: right;
}

.deleteIcon {
   float: right;
}

.levelbtn {
   display: inline-block;
   border-top-left-radius: 0.1875rem;
   border-bottom-left-radius: 0.1875rem;
   margin-top: 10px;
   margin-right: 0.0625rem;
   padding: 0.625rem 0.375rem 0.5rem 0.375rem;
   border-radius: 0;
   color: black;
   text-decoration: none;
   border-width: 2px;
   transition: .06s;
   font-size: 16px;
   line-height: 24px;
   text-align: center;
   vertical-align: middle;
   touch-action: manipulation;
   border: 1px solid transparent !important;
   white-space: nowrap;
   font-weight: 500;
   cursor: pointer;
   user-select: none;
   box-sizing: border-box;
   font-family: "roboto", "맑은 고딕", malgun gothic, "돋움", Dotum, sans-serif;
}
</style>
</head>
<body>
   <c:import
      url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp" />
   <section>
      <div class="allContents">
         <div class="leftContents">
            <div class="leftMenu">
               <div class="leftMenu_header">나의 메뉴</div>
               <div class="leftMenu_wrapper">
                  <ul>
                     <li><a href="#">반 게시판</a></li>
                     <li>
                     	<a href="#" id="messanger" onclick="window.open('${pageContext.request.contextPath}/chat${member.classname}','toolbar=no,menubar=no,location=no,status=no');">반 메신저</a>
                     </li>
                     <li style="background-color: RGB(18, 165, 244);"><a
                        href="${pageContext.request.contextPath}/quiz/quizList"
                        style="color: white;">과제 게시판</a></li>
                  </ul>
               </div>
            </div>
         </div>

         <div class="containerMain ">
            <div class="row">
               <div class="headerMain">
                  <form name="frm" action="./quizList" method="get">
                     <input type="hidden" id="cur123" name="curPage" value="1">
                     <input type="hidden" id="level123" name="list" value="${level}">

                  </form>
                  <p style="margin-top: 40px;">
                  <h3 style="font-weight: 600">문제</h3>
                  </p>
               </div>
               <div class="level">
                  <div
                     class="algorithm-levels col-lg-9 col-md-12 col-sm-12 col-xs-12">
                     <div class="levelbtn"
                        style="background-color: color:white;">
                        <a href="#" id="test" class="button-3d"
                           style="text-decoration: none; color: white;">Level 1</a>
                     </div>
                     <div class="levelbtn" style="background-color: #1976D2;">
                        <a href="#" id="test" class="button-3d"
                           style="text-decoration: none; color: white;">Level 2</a>
                     </div>
                     <div class="levelbtn" style="background-color: #9C27B0;">
                        <a href="#" id="test" class="button-3d"
                           style="text-decoration: none; color: white;">Level 3</a>
                     </div>
                     <div class="levelbtn" style="background-color: #4A148C;">
                        <a href="#" id="test" class="button-3d"
                           style="text-decoration: none; color: white;">Level 4</a>

                     </div>

                  </div>
                  <div class="table_container">
                     <c:forEach items="${list}" var="dto">
                     
                        <div class="table_quiz">
                           <div
                              style="float: left; margin-bottom: 3px; margin-right: 3px;">
                              
                              
                                 
                           <!-- 처리부분 -->
                           
                           </div>
                           <c:if test="${member.kind eq 'teacher'}">
                              
                              <span class="deleteIcon"><img
                                 onclick="javascript:deleteIcon(${dto.num});"
                                 style="width: 20px; height: 20px;"
                                 src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/deleteIcon.png"></span>
                              <span class="updateIcon"><img
                                 onclick="javascript:updateIcon(${dto.num});" id="updateIcon"
                                 style="width: 20px; height: 20px; margin-right: 2px;"
                                 src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/updateIcon.png"></span>
                           </c:if>
                           <div class="flex-space-between">

                              <h5 style="display: inline-block;" class="quizTitle"
                                 onclick="javascript:quizTitle(${dto.num});">${dto.title}</h5>
                           
                           
                              <c:forEach items="${listNum}" var ="NNN">
                                 <c:if test="${dto.num eq NNN}">
                              
                              <%-- <img src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/check.png"> --%>
                                 <span style=" color:deepskyblue; font-size: 20px;" class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                 </c:if>
                              </c:forEach>
                           
                           </div>

                           <div class="card-algorithm-content">
                              <p class="card-algorithm-info">
                                 <span style="color:tomato; font-weight: 300">${dto.quizLevel}</span>
                                 <!--<span>성공율: 0%</span>-->
                                 
                              </p>

                           </div>
                        </div>
                     </c:forEach>
                     <!-- 테이블 컨테이너 -->
                  </div>
                  <!-- 페이징처리 -->

                  <div class="page_contain">
                     <c:if test="${page.curBlock gt 1}">
                        <span class="list" title="${page.startNum-1}">[이전]</span>
                     </c:if>

                     <c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
                        <span class="list" title="${i}">${i}</span>
                     </c:forEach>

                     <c:if test="${page.curBlock lt page.totalBlock}">
                        <span class="list " title="${page.lastNum+1}">[다음]</span>
                     </c:if>
                     <c:if test="${member.kind eq 'teacher'}">
                     <button id="write" class="btn btn-info"
                        style="float: right; width:100px;  margin-top: 25px; margin-right: 25px;">
                        글쓰기</button>
                     </c:if>
                  </div>
                  

                  <!-- 페이징 처리  -->
               </div>
            </div>
         </div>
   </section>
   
   <c:import
      url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp" />