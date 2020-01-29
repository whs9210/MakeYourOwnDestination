<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작성화면</title>
<link href="resources/css/noticeinsert.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script>
	function ok() {

		alert("작성완료 되었습니다.")
	}
	function back() {
		location.href = "noticeall";
	}
	function comimage() {
		var pname = $("#pname").val();
		$.ajax({
			url : "Pimage",
			data : {
				pname : pname
			},
			success : function(result) {
				$("#div_img").empty();
				$("#div_img").html(result);
			}
		})
	}
</script>
</head>

<style>
form {
    /* Just to center the form on the page */
    margin: 0 auto;
    width: 400px;
    /* To see the outline of the form */
    padding: 1em;
    border: 1px solid #CCC;
    border-radius: 1em;
}

form div + div {
    margin-top: 1em;
}
label {
    /* To make sure that all label have the same size and are properly align */
    display: inline-block;
    width: 90px;
    text-align: right;
}
input, textarea {
    /* To make sure that all text fields have the same font settings
       By default, textareas have a monospace font */
    font: 1em sans-serif;

    /* To give the same size to all text field */
    width: 300px;
    -moz-box-sizing: border-box;
    box-sizing: border-box;

    /* To harmonize the look & feel of text field border */
    border: 1px solid #999;
}
input:focus, textarea:focus {
    /* To give a little highlight on active elements */
    border-color: #000;
}
textarea {
    /* To properly align multiline text fields with their labels */
    vertical-align: top;

    /* To give enough room to type some text */
    height: 5em;

    /* To allow users to resize any textarea vertically
       It does not work on every browsers */
    resize: vertical;
}
.button {
    /* To position the buttons to the same position of the text fields */
    padding-left: 90px; /* same size as the label elements */
}

button {
    /* This extra margin represent roughly the same space as the space
       between the labels and their text fields */
    margin-left: .5em;
}
</style>

<body>

	<div id="wrap">
		<div id="header" class="join" align="center">
			<h1>
				<a href="index.jsp" class="logo"> <span class="blind">CHAMPION</span>
				</a>
			</h1>
		</div>
		<form action="Ninsert">
			<div id="content" align="center">

				<div>
					<label for="name">제목:</label> <input type="text" id="notice_title" name="notice_title" 
						placeholder="제목을 작성하세요">
				</div>
				<div>
					<label for="mail">내용:</label> <input type="text"
						name="notice_content" placeholder="내용을 작성하세요">
				</div>
				<select name="pname" onchange="comimage()" id="pname">
					<c:forEach items="${Plist}" var="PlaceDTO">
						<option value="${PlaceDTO.pname}">${PlaceDTO.pname}
					</c:forEach>
					</select><br>
					<div id="div_img"></div>
					<div>
						<label for="msg">작성자:</label>
						<input type="text" name="mid" value="<%=session.getAttribute("id")%>" readonly="readonly">
					</div>

					<div class="button">
						<input type="submit" value="작성" id ="btni" onclick="ok()">
						<button type="button" onclick="back()">뒤로가기</button>
					</div>
			</div>
		</form>
	</div>


</body>
</html>