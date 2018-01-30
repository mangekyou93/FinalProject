<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Latest compiled and minified CSS -->

<html>
<head>
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



<style type="text/css">
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
   max-width: 100%;
   box-sizing: border-box;
   margin: 0 auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


   <c:import
      url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/header.jsp" />
   <div class="allContents">
      <div class="leftContents">
         <div class="leftMenu">
            <div class="leftMenu_header">나의 메뉴</div>
            <div class="leftMenu_wrapper">
               <ul>
                  <li><a href="#">반 게시판</a></li>
                  <li><a href="#">반 메신져</a></li>
                  <li style="background-color: RGB(18, 165, 244);"><a
                     href="${pageContext.request.contextPath}/quiz/quizList"
                     style="color: white;">과제 게시판</a></li>
               </ul>
            </div>
         </div>
      </div>
      <div class="containerMain">
         <div class="container">
            <div class="jumbotron">
               <h2>문제 수정하기</h2>
               <hr>
               <form action="quizUpdate" method="POST" id="frm">

                  <input type="hidden" name="num" value="${view.num}">
                  <div class="form-group row">
                     <div class="col-xs-4">
                        <label for="title"><h4>title</h4></label> <input type="text"
                           class="form-control" name="title" value="${view.title}">
                     </div>

                  </div>

                  <div class="form-group row">
                     <div class="col-xs-4">
                        <label for="quizLevel"><h4>quizLevel</h4></label> <select
                           class="form-control" name="quizLevel"
                           selected="${view.quizLevel}">
                           <option>Level 1 (Easy)</option>
                           <option>Level 1 (Hard)</option>
                           <option>Level 2 (Easy)</option>
                           <option>Level 2 (Hard)</option>
                           <option>Level 3 (Easy)</option>
                           <option>Level 3 (Hard)</option>
                           <option>Level 4 (Easy)</option>
                           <option>Level 4 (Hard)</option>

                        </select>
                     </div>
                  </div>


                  <div class="form-group row">

                     <div class="col-xs-4">
                        <label for="contents"><h4>contents</h4></label>
                        <textarea class="form-control" rows="10" name="contents">${view.contents}</textarea>
                     </div>


                     <div class="col-xs-4">
                        <label for="basiccode"><h4>basiccode</h4></label>
                        <textarea class="form-control" rows="10" name="basiccode">${view.basiccode}</textarea>
                     </div>

                  </div>

                  <div class="form-group row">

                     <div class="col-xs-2">
                        <label for="result"><h4>result</h4></label> <input type="text"
                           class="form-control" name="result" value="${view.result}">
                     </div>
                     <div class="col-xs-2">
                        <label for="classKind"><h4>classKind</h4></label> <input type="text"
                           class="form-control" name="classKind" value="${view.classKind}">
                     </div>

                     <div class="col-xs-2">
                        <label for="basicClass"><h4>basicClass</h4></label> <input type="text"
                           class="form-control" name="basicClass"
                           value="${view.basicClass}">
                     </div>
                  </div>
                  <input type="submit" id="saveButton"
                     style="vertical-align: middle;" value="수정"
                     class="btn btn-default">
               </form>
            </div>
         </div>
      </div>
   </div>




   <c:import
      url="${pageScope.pageContext.request.ContextPath}/WEB-INF/views/temp/footer.jsp" />
</body>
</html>