$(function (){
    let regName = /^[가-힣]{2,4}$/;
    let nameMsg =$(".form__message--error");
    //이름은 한글 두글자에서 네글자 사이로 입력하기.
    $("#member_name").on('keyup',function(){ //keyup은 실시간으로  입력하는걸 확인함
        if(regName.test($(this).val())){
            nameMsg.html("<div></div>");
        }else{
            nameMsg.html("<div>한글 이름 2~4자를 입력해주세요</div>");
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
