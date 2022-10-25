function buyProduct() {
	var member_id = $("#member_id").val();
	var prd_id = $("#prd_id").val();
	var buy_quantity = $("#buy_quantity").val();
	var prd_opt = $("#prd_opt").val();
	var hiddenbtn = $("#hiddenbtn").val();
	if (member_id == "Admin") {
		swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning");
	} else if (!member_id) {
		swal("", "비회원은 이용하실 수 없습니다.", "error");
	} else if (buy_quantity == 0) {
		swal("", "수량을 선택해주세요", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "payment",
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id,
				"buy_quantity" : buy_quantity,
				"prd_opt" : prd_opt,
				"hiddenbtn" : hiddenbtn
			},
			success : function(data) {
				console.log(data);
				window.location.href="payment";
			}, error : function(data) {
				console.log(data);
			}
		});
	}
}

function doInsertProduct() {
	if (!cate_id) {
		swal("", "카테고리를 선택해주세요.", "error");
	} else {
		debugger;
		var formData = new FormData($("#fileForm")[0]);
		//console.log("prd_explain" + CKEDITOR.instances.prd_explain.getData());
		//formData.append('prd_explain', CKEDITOR.instances.prd_explain.getData());
		$.ajax({
			type : "POST",
			url : "insertProduct",
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				debugger;
				console.log(data);
				swal("", "상품이 등록되었습니다.", "success")
				.then(function(isConfirm){
					location.href="prdinsert";
				});
			}, error : function(error) {
				swal("왜", "에러일까", "error");
			}
		});
	}
}

function doUpdateProduct() {

	var prd_id = $("#prd_id").val();
	var cate_id = $("#cate_id").val();
	var prd_name = $("#prd_name").val();
	var prd_price = $("#prd_price").val();
	var prd_img = $("#prd_img").val();
	var prd_delivery = $("#prd_delivery").val();
	var prd_stock = $("#prd_stock").val();
	var prd_option = $("#prd_option").val();
	var prd_discount = $("#prd_discount").val();
	var prd_explain = $("#prd_explain").val();
	if(prd_price == 0) {
		swal("","필수항목이 비어있습니다. 입력해주세요.", "warning")
	}else {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnclickOutsize : false,
			closeOnEsc : false,
			buttons : ["돌아가기", "수정 완료!"],
		}).then(function(isConfirm){
			swal("수정완료!!", "물품정보 수정을 완료했습니다.!!").then(function(inConfirm){
				$.ajax({
					type:"POST",
					url:"updateProduct",
					data: {
						"prd_id" : prd_id,
						"cate_id" : cate_id,
						"prd_name" : prd_name,
						"prd_price" : prd_price,
						"prd_img" : prd_img,
						"prd_delivery" : prd_delivery,
						"prd_stock" : prd_stock,
						"prd_option" : prd_option,
						"prd_discount" : prd_discount,
						"prd_explain" : prd_explain
					},
					success : function(data) {
						debugger;
						console.log(prd_id);
						window.location.href = "prdupdate?prd_id=" + prd_id;
						//window.location.href = "productpage?prd_id=" + prd_id;
					},
					error : function(data) {
						alert("error");
						console.log(prd_id);
					}
				});
			});
		});
	}
}
function prdidChk() {
	var prd_id=$("#prd_id").val();
	if (!prd_id) {
		swal("", "물품번호를 입력해주세요.", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "prdCheckID",
			data : { "prd_id" : prd_id },
			dataType : "JSON",
			success : function(data) {
				if (data == 0) {
					$("#prd_id").attr("disable", true);
					swal("", "사용가능 ! !", "success");
				} else if (data != 0) {
					swal("", "이미 존재하는 물품번호입니다.", "error");
				} else {
					swal("a", "a", "error");
				}
			}, error : function(error) {
				swal("", prd_id, "error");
			}
		});
	}
}

function delProduct(prd_id, cate_id) {
	$.ajax({
		type : "POST",
		url : "delProduct",
		data : { "prd_id" : prd_id, "cate_id" : cate_id},
		success : function(data) {
			alert("등록상품 삭제완료")
		window.location.reload();
		}
	});
}