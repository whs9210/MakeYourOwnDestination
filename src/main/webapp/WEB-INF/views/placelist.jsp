<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/noticeall.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<c:forEach items="${p_list}" var="pdto">
 

 <div>작성자 : ${pdto.id} 내용 : ${pdto.content} 작성일자 :
		${pdto.place_date}
		
		<c:set var="mid" value="${pdto.id }"></c:set>
		<c:set var="id" value="${id}"></c:set>
		
		<c:if test="${mid == id}"> --%>
		<button onclick="cdel('${pdto.id}')" id = "del">삭제</button> 
	</c:if>
		</div>
</c:forEach> 
 


</body>

</html>