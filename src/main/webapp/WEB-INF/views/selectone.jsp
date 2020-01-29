<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세 화면</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script>
$(function(){
	$(document).ready(function() {
		var notice_id = $("#notice_id").val();
		$.ajax({
			url : "Clist",
			data : {
				notice_id : notice_id
			},
			success:function(result){
				$("#div").html(result);
			}
		})
	})
	$("#btn").click(function() {
		var comment_content = $("#comment_content").val();
		var notice_id = $("#notice_id").val();
		var mid ='<%=session.getAttribute("id")%>'
		$.ajax({
			url : "commentinsert",
			contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
			data : {
				comment_content : comment_content,
				notice_id : notice_id,
				mid : mid
			},
			success:function(result){
				location.reload();
			}
		})
	})
	$("#delete").click(function() {
		if(confirm("삭제 하시겠습니까?") == true){
			var notice_id = $("#notice_id").val();
			$.ajax({
				url : "Ndelete",
				data : {
					notice_id : notice_id
				},
				success:function(result){
					location.href="noticeall";
				}
			})
		}
				
	})
	$("#update").click(function() {
		if(confirm("수정 하시겠습니까?") == true){
			var notice_id = $("#notice_id").val();
			location.href="Nupdate?notice_id="+notice_id;
		}
				
	})
})
</script>
<script type="text/javascript">
function cdel(comment_id) {
	$.ajax({
		url : "Cdelete",
		data : {
			comment_id : comment_id
		},
		success:function(result){
			location.reload();
		}
	})
} </script>
</head>
<style>
.info {
	display: flex;
	justify-content: space-between;
}

header img {
	height: 30px;
	width: 30px;
}

.card_image img {
	width: 1000px;
	height: 50%;
}

.main {
	background-color: #efefef;
	display: flex;
	flex-direction: row;
	justify-content: center;
	border-top: 1px solid #4a4a4a;
	height: 100vh;
	width: 100vw;
}

.card {
	border: 1px solid #4a4a4a;
	background-color: white;
}

.comment {
	border: 2px solid black;
}
</style>
<body>
<input type="hidden" id="notice_id" value="${dto.notice_id}">
<c:set var="mid" value="${dto.mid}" ></c:set>
<c:set var="id" value="${id}" ></c:set>
<c:if test="${mid eq id }">
<input type="button" id="delete" value="삭제버튼">
<input type="button" id="update" value="수정버튼">
</c:if>

 <div class="main_left">
		<section class="card_section">
			<div class="card">
				<header>
					<div class="user_name"></div>
				</header>
				<div class="card_image">
					<img src="${dto.notice_img}" >
				</div>
				<div class="info">
					<div class="card-body">
						<h3 class="card-title"> 카테고리: ${dto.pname }</h3>
						<div>

							<h4>날짜 :${dto.notice_date }</h4>
						</div>
						<div></div>
						<h4>작성내용:${dto.notice_id } ${dto.notice_title } ${dto.notice_content }</h4> 
					</div>
				</div>
				<div class="info_right">
					<i class="far fa-bookmark"></i>
				</div>
			</div>
			<div class="comment">
			
			<div class="n_div">
	<div id = "div"></div>
	<div id = "in">
	댓글 : <input type="text" id = "comment_content">
	<input type = "button" value = "작성" id = "btn">
	</div>
			
	
			</div>
			</div>
					
			</div>
			</div>
			
			
	
	
	</div>



</body>
</html>