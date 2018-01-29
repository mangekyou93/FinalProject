<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${replyList}" var="dto2">
	<div class="community_reply_wrap">
		<p class="reply_writer">${dto2.writer }</p>
		<div class="reply_contents_wrap_M">
		<p class="reply_contents">${dto2.contents }</p>
		<p style="font-size: 12px;color: #aaa;" class="reply_date_wrap">${dto2.reply_date }<span class="reply_comm" style="padding-left: 10px;font-size: 12px;color: RGB(18, 165, 244);">댓글 등록</span>
		</p>
		</div>
		<div class="check_reply${status.index}"></div>
		</br>
		</div>
</c:forEach>