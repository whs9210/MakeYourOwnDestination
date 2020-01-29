<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 전체 확인</title>
<!-- <link href="resources/css/noticeall.css" rel="stylesheet"> -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<style>
.col-md-6 col-12{
	display:flex;
}

body{
	 background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2nsCbm4lNSKVsTExXMoF_ikf_UMfhKvU80DsLIRTQtppmU4MT&s");
}

placeholder{
	padding-right:0.5%;
	padding-left:0.5%;
}

.parallax-window {
	float: left;
	background-color: hsla(50, 33%, 25%, .75);
	padding-right:0.7%
}

.n_div {
	float: left;
	padding-right: 0.7%;
	padding-left: 0.8%;
	padding-top: 1.8%;
	border-radius: 10px;
}

.date_div {
	font-size: 13px;
}

</style>
</head>
<body>
<div id = "btn_div">
<button type="button" onclick="location.href='index.jsp'" id = "m_btn">메인페이지로가기</button>
<button type="button" onclick="location.href='Pinsert'" id = "in_btn">작성 페이지로 </button>
</div>
<div class="all_div">
<c:forEach items="${Nlist}" var="dto1">
<div class="n_div">
<hr width="275">
<div class="top_div">
<div class="num_div"><a href="selectone?notice_id=${dto1.notice_id}">No : ${dto1.notice_id}</a></div>
<div class="date_div">Date : ${dto1.notice_date}</div>
</div>
<div class="img_div"><a href="selectone?notice_id=${dto1.notice_id}"><img src="${dto1.notice_img}" width="300" height="200"></a></div>  
<div class="ti_div">제목 : <a href="selectone?notice_id=${dto1.notice_id}">${dto1.notice_title}</a></div>
<div class="writer_div">글쓴이 : ${dto1.mid}</div>

<div class="place_div">목적지 : ${dto1.pname}</div>
</div>
</div>
</c:forEach>
</div>

</body>
</html>