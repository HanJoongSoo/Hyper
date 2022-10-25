<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<script>
			// 마이페이지2 비밀번호 확인
			function mypg2() {
				var member_id = $("#member_id").val();
				var member_pwd = $("#member_pwd").val();
				
				var mypPwd = $("#member_pwd").val();
				
				if (!member_id || !mypPwd) {
					swal("", "패스워드를 입력해주세요.", "error");
				} else {
					$.ajax({
						type : "POST",
						url : "checkMember",
						data : {
							"member_id" : member_id,
							"member_pwd" : member_pwd
						}, success : function(data) {
							if (data != 0) {
								$.ajax({
									type : "POST",
									url : "mypage2",
									data : {
										"member_id" : member_id,
										"member_pwd" : member_pwd
									}, success : function() { window.location.href = "mypage3"; }
								});
							} else {
								swal("", "패스워드를 확인해주세요.", "warning")
							}
						}, error : function(data) {
							console.log(data);
						}
					});
				}
			}
		</script>
		<title>Hyper</title>
	</head>
	<body>
		<%@ include file="../include/header.jsp"%>
		<table class="pwcheck" align="center" cellpadding="5" cellspacing="5">
			<tr>
				<th colspan="2">비밀번호 확인</th>
			</tr>
			<tr>
				<td class="block" width="100" align="center">회원 아이디</td>
				<td width="250" style="border-bottom:2px solid #E1DCDC; border-top:2px solid #E1DCDC">${member.member_id}</td>
			</tr>
			<tr>
				<td class="block"align="center">비밀번호</td>
				<td style="border-bottom:2px solid #E1DCDC;"><input type="password" size="35" id="member_pwd" placeholder="비밀번호 확인" /></td>
			</tr>
		</table>
		<div class="checkbtn" align="center">
		<br>
			<form id="myInfo">
				<!-- 회원 비밀번호 체크 -->
				<input type="button" class="confirm" value="확인" onClick="mypg2()" />&nbsp;&nbsp;&nbsp;
				<input type="button" class="cancel" value="취소" onClick="location.href='main'" />
			</form>
		</div>
		<%@ include file="../include/footer.jsp"%>
	</body>
</html>