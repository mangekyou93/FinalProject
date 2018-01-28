<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${replyList}" var="list">
	<div class="reply_wraps">
	 	<div class="reply_writer">${list.writer }</div>
	 	<div class="reply_contents">${list.contents }</div>
	</div>
</c:forEach>