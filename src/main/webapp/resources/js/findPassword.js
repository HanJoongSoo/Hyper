const msg =$(".form__message--error");

$(function(){

    $("#member_id").on('keyup', function () {

        let userIdCheck = /^[A-Za-z0-9_\-]{5,20}$/;

        if (!(userIdCheck.test($("#member_id").val()))) {
            msg.html("<div style='font-size:11px;'>영어와 숫자로 이루어진 5~20자의 아이디를 입력해주세요.</div>");
        }else{
            msg.html("<div></div>");
        }
    });

    $("#member_name").on('keyup',function(){

        let regName = /^[가-힣]{2,4}$/;

        if(regName.test($(this).val())){
            msg.html("<div></div>");
        }else{
            msg.html("<div style='font-size:11px;'>한글 이름 2~4자를 입력해주세요</div>");
        }
    });


    $("#member_phone").on('keydown', function (e) {
        // 숫자만 입력받기
        var k = e.keyCode;

        if ($(this).val().length >= 11 && k != 8 && ((k >= 48 && k <= 126) || (k >= 12592 && k <= 12687 || k == 32 || k == 229 || (k >= 45032 && k <= 55203)))) {
            e.preventDefault();

        }

        if ($(this).val() == '') return;

        phoneCheck(this);

    }).on('blur', function () { // 포커스를 잃었을때 실행합니다.
        phoneCheck(this);
    });
    //비밀번호 정규식 5~200자 특수문자,영어,숫자 사용 해야함 ###############
    $(".pwd").on('keyup',function () {

        let pat = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;

        if(pat.test($(this).val())){
            msg.html("<div></div>");
            $("#pwdbtn").attr("disabled",true);
        } else {
            msg.html("<div style='font-size:11px;'>8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요</div>");
        }
    });
    //#########################################################################
    $("#confirmpassword").keyup(function(){
        if(!passwordCheck()){
            $("#pwdbtn").attr("disabled",true);
            msg.html("<divstyle='font-size:11px;'>비밀번호가 일치하지 않습니다.</div>")
        }else{
            msg.html("<div></div");
            $("#pwdbtn").attr("disabled",false);
        }
    });


});

//핸드폰 번호 정규식 체크
function phoneCheck(member_phone) {
    let val = member_phone.value;
    // 입력값이 있을때만 실행합니다.
    if (val != null && val != '') {
        // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
        if (val.length == 11 || val.length == 10) {
            // 유효성 체크
            var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
            if (regExp_ctn.test(val)) {
                // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                //  trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");
                //  $(this).val(trans_num);
            }
            else {
                $(member_phone).val($(member_phone).val().replace(/[^0-9]/g, ""));
                $(member_phone).focus();
            }
        }
        else {
            $(member_phone).val($(member_phone).val().replace(/[^0-9]/g, ""));
            $(member_phone).focus();
        }
    }
}

//비밀번호를 입력한 값이 일치하는가 안하는가 확인하는 함수
function passwordCheck() {
    var p1 = $("#member_pwd").val();
    var p2 = $("#confirmpassword").val();
    if (p1 != p2) {
        return false;
    } else {
        return true;
    }
}