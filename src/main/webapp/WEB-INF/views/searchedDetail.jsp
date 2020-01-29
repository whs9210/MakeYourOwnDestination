<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="resources/css/noticeall.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link href="resources/css/shop-item.css" rel="stylesheet"> -->
<script>
$(function() {
	
	$(document).ready(function() {
		var pname = '<%=request.getParameter("pname")%>'
		$.ajax({
			url : "placelist",
			data : {
				pname : pname,
			},
			success:function(result){
				$("#cdiv").html(result);
			}
		})
	});
	
	$("#btn").click(function() {
		var content = $("#content").val();
		var pname = '<%=request.getParameter("pname")%>'
		var id = '<%=session.getAttribute("id")%>'
		$.ajax({
			url : "placeinsert",
			contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
			data : {
				content : content,
				pname : pname,
				id : id
			},
			success:function(result){
				location.reload();
			}
		});
	});
});
</script>
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
	width: 100%;
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

.test {
	background-color: red;
}

body {
	 background-image:url("https://images.unsplash.com/photo-1519666336592-e225a99dcd2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"); 
	margin: 0;
}

.col-md-4 {
	text-align: right;
	float: right;
	display: flex;
}

.info i {
	font-size: 1.5rem;
}

.main_left {
	margin: 1rem;
}

.comment {
	margin: 1rem 1rem 1rem 1rem;
	border-bottom: 2px solid #efefef;
	padding-bottom: 3rem;
}

.comment_form form {
	padding-bottom: 3rem;
	display: flex;
	flex-direction: row;
	border: 1px solid #efefer;
	border-bottom: 2px solid #efefef;
	
}

.comment_form form input {
	width: 550px;
	height: 30px;
	border: black;
	padding-left: 0px;
	border-bottom: 2px solid #efefef;
	padding-bottom: 1rem;
	
}

.comment_form form #submit {
	border: 1px solid #efefer;
	background-color: white;
}
</style>

<body>

	<!-- Navigation -->
	<!--   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> -->
	<div class="container">
		<div class="col-md-4">
			<%-- <%if (session.getAttribute(")) %> --%>
			<%
				String id = (String) session.getAttribute("id");
			%>
			<%
				if (id != null) {
			%>
			<%=id%>님 환영합니다!
			<button type="button" class="btn btn-success" id="mypage"
				onclick="location.href='index.jsp'">
				<input type="hidden" value=<%=id%> id="id" name="id"> Home
			</button>
			<button type="button" class="btn btn-success" id="in_btn"
				onclick="location.href='scomment.jsp'">write comment</button>
			<%
				} else {
			%>
			<button type="button" class="btn btn-success"
				onclick="location.href='index.jsp'">home</button>
			<button type="button" class="btn btn-success" id="signin"
				onclick="location.href='signup.jsp'">content</button>
			<button type="button" class="btn btn-success"
				onclick="location.href='login.jsp'">log-out</button>
			<%
				}
			%>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div>
	<!-- Page Content -->
	<div class="main_left">
		<section class="card_section">
			<div class="card">
				<header>
					<div class="user_name"></div>
				</header>
				<div class="card_image">
					<img src="${dto.images}">
				</div>
				<div class="info">
					<div class="card-body">
						<h3 class="card-title">장소 이름: ${dto.pname }</h3>
						<div>

							<h4>주소 :${dto.addr }</h4>
						</div>
						<div></div>
						<h4>설명:${dto.content}</h4> 
					</div>
				</div>
				<div class="info_right">
					<i class="far fa-bookmark"></i>
				</div>
			</div>
	<!-- 		<div class="comment">
			
			<div class="n_div">
			<div id="cdiv">
			<div id= "deletediv">
			
	
			</div>
			</div>
					
			</div>
			</div> -->
			
			
	
	
	<!-- <div class="comment_form">
			<input type="text" placeholder="댓글 입력.." id="content">
			<button type='button' id='btn'>게시</button>
	</div> -->
	</div>
	</section>
	</div>

	</div>




	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
