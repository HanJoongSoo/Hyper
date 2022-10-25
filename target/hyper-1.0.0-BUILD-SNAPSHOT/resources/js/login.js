/**
 * 로그인
 */
// console.log("gdgdgdgdg");
function memberCheck() {
	let member_id = $("#member_id").val();
	let member_pwd = $("#member_pwd").val();
	if (!member_id || !member_pwd) {
		// $(".input-message-error").html("아이디와 비밀번호를 입력해주세요.");
	} else {
		$.ajax({
			type : "POST",
			url : "checkMember",
			data : {
				"member_id" : member_id,
				"member_pwd" : member_pwd
			},
			success : function(data) {
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "login",
						data : {
							"member_id" : member_id,
							"member_pwd" : member_pwd
						},
						success : function() {
							window.location.href = "main";
						}
					});
				} else {
					$(".input-message-error").html("아이디와 비밀번호를 확인 부탁드립니다")
				}
			},
			error : function(data) {
				console.log(data);
			}
		});
	}
}

function productCart() {
	var member_id = $("#member_id").val();
	document.frm.method = "POST";
	document.frm.action = "productCart";
	document.frm.submit();
}

function logout() {
	$.ajax({
		type : "GET",
		url : "logout",
		data : {},
		success : function(data) {
			swal("로그아웃", "완료", "success");
			location.href = "main";
		}
	});
}
