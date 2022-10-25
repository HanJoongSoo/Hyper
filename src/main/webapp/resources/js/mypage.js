var checkPWD = false;
$(document).ready(function() {
	$("#member_pwd").keyup(function() {
		$("#checkPasswd").text("");
	});
	
	$("#chk_member_pwd").keyup(function() {
		var checkText = $("#checkPasswd");
		if ($("#member_pwd").val() == "" || $("#chk_member_pwd").val() == "") {
			checkText.css("color", "red");
			checkText.text("필수정보입니다.");
			checkPWD = false;
		} else if ($("#member_pwd").val() != $("#chk_member_pwd").val()) {
			checkPWD = false;
			checkText.text("패스워드가 동일하지 않습니다.");
			checkText.css("color", "red");
		} else {
			checkPWD = true;
			checkText.text("패스워드가 동일합니다.");
			checkText.css("color", "green");
		}
	});

	$("#email_select").change(function() {
		if ($("#email_select").val() == "1") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", false);
		} else if ($("#email_select").val() == "") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", true);
		} else {
			$("#email_addr").val($("#email_select").val());
			$("#email_addr").prop("disabled", true);
		}
	});

})

function searchPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			var fullAddr = '';
			var extraAddr = '';

			if (data.userSelectedType == 'R') {
				fullAddr = data.roadAddress;
			} else {
				fullAddr = data.jibunAddress;
			}
			if (data.userSelectedType == 'R') {
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
			}
			document.getElementById('member_zipcode').value = data.zonecode;
			document.getElementById('member_faddr').value = fullAddr;
			document.getElementById('member_laddr').value = '';
		}
	}).open();
}

// 회원정보 수정
function myinfoUp() {
	var member_id = $("#member_id").val();
	var member_pwd = $("#member_pwd").val();
	var member_email = $("#email_id").val() + "@" + $("#email_addr").val();
	var member_phone = $("#member_phone").val();
	var member_zipcode = $("#member_zipcode").val();
	var member_faddr = $("#member_faddr").val();
	var member_laddr = $("#member_laddr").val();
	var myp = $("#myp").val();
	if (checkPWD == false) {
		console.log("비밀번호 다름");
	}
	if (checkPWD == false) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
		console.log("sexsex")
	} else {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정 완료!" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
					$.ajax({
						type : "POST",
						url : "mypage3",
						data : {
							"member_id" : member_id,
							"member_pwd" : member_pwd,
							"member_email" : member_email,
							"member_phone" : member_phone,
							"member_zipcode" : member_zipcode,
							"member_faddr" : member_faddr,
							"member_laddr" : member_laddr,
							"myp" : myp
						},
						success : function(data) {
							console.log(member_id);
							console.log(myp);
							window.location.href = "mypage?member_id=" + member_id + "&myp=" + myp;
						//	window.location.href="memberList";
						},
						error : function(data) {
							console.log(member_id);
							console.log(myp);
						}
					});
				});
			}
		})
	}
}

// 관리자 회원정보 수정@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function memberUp() {
	var member_id = $("#member_id").val();
	var member_pwd = $("#member_pwd").val();
	var member_email = $("#email_id").val() + "@" + $("#email_addr").val();
	var member_phone = $("#member_phone").val();
	var member_faddr = $("#member_faddr").val();
	var member_laddr = $("#member_laddr").val();
	var member_zipcode = $("#member_zipcode").val();
	if (checkPWD == false) {
		console.log("비밀번호 다름");
	}
	if (checkPWD == false) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
	} else {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정 완료!" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
					$.ajax({
						type : "POST",
						url : "updateMember2",
						data : {
							"member_id" : member_id,
							"member_pwd" : member_pwd,
							"member_email" : member_email,
							"member_phone" : member_phone,
							"member_faddr" : member_faddr,
							"member_laddr" : member_laddr,
							"member_zipcode" : member_zipcode,
						},
						success : function(data) {
							console.log(member_id);
						//	window.location.href = "updateMember?member_id=" + member_id + "&myp=" + myp;
								window.location.href="memberList";
						},
						error : function(data) {
							console.log(member_id);
						}
					});
				});
			}
		})
	}
}

function paymentUp() {
	var payment_id = $("#payment_id").val();
	var member_id = $("#member_id").val();
	var member_faddr = $("#member_faddr").val();
	var member_laddr = $("#member_laddr").val();
	var member_zipcode = $("#member_zipcode").val();
	var prd_opt = $("#prd_opt").val();
	var delivery = $("#delivery").val();
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정 완료!" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
					$.ajax({
						type : "POST",
						url : "updatePayinfo",
						data : {
							"payment_id" : payment_id,
							"member_id" : member_id,
							"member_faddr" : member_faddr,
							"member_laddr" : member_laddr,
							"member_zipcode" : member_zipcode,
							"prd_opt" : prd_opt,
							"delivery" : delivery
						},
						success : function(data) {
							console.log(member_id);
						//	window.location.href = "updateMember?member_id=" + member_id + "&myp=" + myp;
								window.location.href="paymentList";
						},
						error : function(data) {
							console.log(member_id);
						}
					});
				});
			}
		})
	
}

function delPayment(payment_id) {
	swal({
		icon : "warning",
		text : "주문내역삭제",
		closeOnclickOutsize : false,
		closeOnEsc : false,
		buttons : ["취소", "주문내역삭제"],
	}).then(function(isConfirm) {
		swal("삭제 완료", "주문내역을 삭제했습니다.").then(function(inConfirm) {
			$.ajax({
				type : "GET",
				url : "delPayment",
				data : {
					"payment_id" : payment_id
				},
				success : function(data) {
					window.location.href="paymentList";
				}
			});
		});
	});
}
function delMember(member_id) {
	swal({
		icon : "warning",
		text : "회원탈퇴",
		closeOnclickOutsize : false,
		closeOnEsc : false,
		buttons : ["취소", "탈퇴 완료"],
	}).then(function(isConfirm) {
		swal("탈퇴 완료", "회원정보를 삭제했습니다.").then(function(inConfirm) {
			$.ajax({
				type : "GET",
				url : "delMember",
				data : {
					"member_id" : member_id
				},
				success : function(data) {
					window.location.href="main";
				}
			});
		});
	});
}

function delMember2(member_id) {
	swal({
		icon : "warning",
		text : "회원탈퇴",
		closeOnclickOutsize : false,
		closeOnEsc : false,
		buttons : ["취소", "탈퇴 완료"],
	}).then(function(isConfirm) {
		swal("탈퇴 완료", "회원정보를 삭제했습니다.").then(function(inConfirm) {
			$.ajax({
				type : "GET",
				url : "delMember2",
				data : {
					"member_id" : member_id
				},
				success : function(data) {
					window.location.href="memberList";
				}
			});
		});
	});
}
