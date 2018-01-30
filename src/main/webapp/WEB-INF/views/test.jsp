<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${list}" var="dto">
   <div class="table_quiz">
      <div style="float: left; margin-bottom: 3px; margin-right: 3px;">
         <img
            src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/check.png">
      </div>

      <span class="updateIcon"><img
         onclick="javascript:updateIcon(${dto.num});" id="updateIcon"
         style="width: 20px; height: 20px; margin-right: 2px;"
         src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/updateIcon.png"></span>
      <span class="deleteIcon"><img
         onclick="javascript:deleteIcon(${dto.num});"
         style="width: 20px; height: 20px;"
         src="${pageScope.pageContext.request.ContextPath}/ctrl/resources/images/deleteIcon.png"></span>
      <div class="flex-space-between">

         <h5 class="quizTitle" onclick="javascript:quizTitle(${dto.num});">${dto.title}</h5>
      </div>

      <div class="card-algorithm-content">
         <p class="card-algorithm-info">
            <span>${dto.quizLevel}</span>
            <!--<span>성공율: 0%</span>-->
            
         </p>

      </div>
   </div>
</c:forEach>