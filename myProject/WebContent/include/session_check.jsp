<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.userid == null}">
	<script>
		alert("로그인 후 사용하세요.");
		location.href="${path}/ui_page/client/login.jsp";	
	</script>
</c:if>