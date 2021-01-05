<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션 객체를 사용하기 위함 -->
<%@ page session="true" %>
<%@ include file="../../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<style type="text/css">
/* 버튼 양식 */
button {
	width: auto;
	height: 25px;
	margin-left: 3px;
	padding-bottom: 5px;
	border: 1px solid black;
	border-radius: 3px;
	background-color: white;
	cursor: pointer;
}
button:hover {
	background-color: #ac7339;
	color: white;
}
</style>
<table>
<c:forEach var="row" items="${list}">
	<script type="text/javascript">
	//댓글 삭제
	function del_${row.comment_num}() {
		var writer=$(".${row.writer}").val();
		var c_num=$("#${row.comment_num}").val();
		var n_num=$(".${row.notice_num}").val();
		var param="writer="+writer+"&c_num="+c_num+"&n_num="+n_num;
		$.ajax({
			type : "post",
			url : "${path}/notice_servlet/commentDlt.do",
			data : param,
			success : function(){
				alert('댓글이 삭제되었습니다');
				comment_list();
			}
		});
	}
	</script>
	<tr>
		<td width="92.5%">
			<%-- <!-- 답글 들여쓰기 -->
			<c:forEach var="i" begin="1" end="${row.comment_re_level}">
				&nbsp;&nbsp;
			</c:forEach> --%>
			${row.writer}
			(<fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd hh:mm:ss"/>)<br>
			${row.content}
		</td>
		<td width="8%">
			<input type="hidden" class="${row.writer}" value="${row.writer}">
			<input type="hidden" id="${row.comment_num}" value="${row.comment_num}">
			<input type="hidden" class="${row.notice_num}" value="${row.notice_num}">
		<c:if test="${sessionScope.userid == row.writer || sessionScope.userid == 'dydals3452'}">
			<button type="button" onclick="del_${row.comment_num}()">삭제</button>
		</c:if>
		</td>
	</tr>
</c:forEach>
</table>