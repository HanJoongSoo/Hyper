<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="resources/css/board.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	function answerB() {
		var bno = $("#bno").val();
		var answer = CKEDITOR.instances.answer.getData();
		swal({
			icon : "warning",
			text : "지금 답글 등록을 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "작성 완료!" ],
		}).then(
				function(isConfirm) {
					if (isConfirm) {
						swal('등록 완료!', '답글 등록을 완료했습니다.^^', 'success').then(
								function(isConfirm) {
									$.ajax({
										type : "POST",
										url : "answerQnABoard",
										data : {
											"bno" : bno,
											"answer" : answer
										},
										success : function(data) {
											location.href = 'boardqna';
										}
									});
								});
					}
				})
	}
</script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/header.jsp"%>
<title>${boardqna.title}-답글다는중</title>
</head>
<body>
	<center>
		<div style="width: 800px;">

			<br /> <br />
			<form>
				<input type="hidden" name="bno" id="bno" value="${boardqna.bno}" />
				<table class="textb" width="100%">
					<tr>
						<td colspan="2" align="left" height="500px"><textarea
								name="answer" id="answer" cols="88" rows="80"></textarea> <script>
									CKEDITOR.replace('answer', {});
								</script></td>
					</tr>
				</table>
				<br />
				<br />
				<br />
				<br />
				<br />
			</form>
			<button style="cursor: pointer;" type="button" class="listp2" onClick="answerB()">작성하기</button>
			<button style="float: right;" class="listp"
				onClick="location.href='boardqna'">목록</button>
		</div>
	</center>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>