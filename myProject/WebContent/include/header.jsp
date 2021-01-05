<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
1)JSTL(Jsp Standard Tag Library, JSP 표준 태그 라이브러리)
2)JSTL 사용 이유 : model1은 jsp페이지 중심, model2는 java코드(서블릿,모델)중심.
jsp 웹페이지에서는 java코드를 안쓸 수는 없지만 이를 최소화 하기 위해 JSTL과 EL기법을 사용.
즉, jsp 내부의 복잡한 자바 코드를 대체하기위한 태그
3)taglib prefix="태그 접두어" uri="태그 라이브러리의 식별자"
4)Core tag(핵심태그, 제일 자주 사용되는 태그들) => 태그 접두어로 접근 : ex) prefix="c"
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- c는 prefix="c"의 c를 의미, var="변수명" value="값"을 의미 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <% String path=request.getContextPath(); %> 
위 코드가 워낙 자주 쓰여져서 header에 넣고 include 시킴.
또한 위 코드보다 JSTL로 변환해서 쓰는게 더 유용함.--%>
