/**
 * 장바구니
 */
function insertCart() {
	var member_id = $("#member_id").val();
	var prd_id = $("#prd_id").val();
	var buy_quantity = $("#buy_quantity").val();
	var prd_opt = $("#prd_opt").val();
	if (member_id == "Admin") {
		swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning");
	} else if (!member_id) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error");
	} else if (buy_quantity == 0) {
		swal("", "수량을 선택해주세요", "error");
	} else {
		$.ajax({
			type : "GET",
			url : "insertCart",
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id,
				"buy_quantity" : buy_quantity,
				"prd_opt" : prd_opt
			},
			success : function(data) {
				swal("", "장바구니에 저장되었습니다.", "success");
			}
		});
	}
}

function buyCart(prd_id, member_id) {
	if (!member_id) {
		console.log('a');
	} else {
		console.log(prd_id + " + " + member_id);
		window.location.href="payment";
		$.ajax({
			type : "POST",
			url : "payment",
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id
			},
			success : function() {
				window.location.href = "payment";
			}
		});
	}
}

function delCart(prd_id, member_id) {
	if (!member_id) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error")
	} else {
		$.ajax({
			type : "POST",
			url : "delCart",
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id
			},
			success : function(data) {
				window.location.reload();
			}
		});
	}
}

function cartClear() {
	var member_id = $("#member_id").val();
	if (!member_id) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error")
	} else {
		$.ajax({
			type : "POST",
			url : "clearCart",
			data : {
				"member_id" : member_id
			},
			success : function() {
				window.location.reload();
			}
		});
	}
}

function calCart() {
	var prd_delivery = 0;
	var prd_sum = 0;
	for (i = 0; i < $("input[name=chk]").length; i++) {
		if ($("input[name=chk]")[i].checked == true) {
			prd_delivery += parseInt($("input[name=prd_delivery]")[i].value);
			prd_sum += parseInt($("input[name=prd_sum]")[i].value);
		}
	}
	document.getElementById("prd_delivery").innerHTML = numberWithCommas(prd_delivery);
	document.getElementById("prd_sum").innerHTML = numberWithCommas(prd_sum);
	document.getElementById("total").innerHTML = numberWithCommas(prd_delivery + prd_sum);
}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}