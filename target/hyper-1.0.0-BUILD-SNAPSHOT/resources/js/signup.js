
$(function () {

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

    $("#member_id").on('keyup', function () {
        let userIdCheck = /^[A-Za-z0-9_\-]{5,20}$/;
        let member_id = $("#member_id").val(); //ajax 중복체크 하기위해서 만듬
        let msg = $("#idMsg");

        if (!(userIdCheck.test($("#member_id").val()))) {
            $("#idForm").css("border-bottom", "2px solid red");
            msg.html("<span class='input-Error'>영어와 숫자로 이루어진 5~20자의 아이디를 만들어 주세요.</span>");
        }
        //ajax 아이디 중복 체크 구간#############################
        else{
            $("#idForm").css("border-bottom", "1px solid skyblue");
            msg.html("<span class='input-Success'></span>");
            $.ajax({
                type: "POST",
                url: "checkID",
                data: {
                    member_id: member_id,
                },
                success: function (data) {
                    if (data == 0) {
                        $("#idForm").css("border-bottom", "1px solid skyblue");
                        msg.html("<span class='input-Success'>사용 가능한 아이디 입니다.</span>");
                    } else if (data != 0) {
                        $("#idForm").css("border-bottom", "1px solid red");
                        msg.html("<span class='input-Error'>이미 사용중인 아이디 입니다.</span>");
                    } else {
                        alert("ssssssssss");
                    }
                },
                error: function (error) {
                    alert("sss")
                },
            });
        }

        // #########################################################
    });
//비밀번호 정규식 5~200자 특수문자,영어,숫자 사용 해야함 ###############
    $("#member_pwd").on('keyup',function () {

        let pat = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
        let pwdMsg = $("#pwdMsg");

        if(pat.test($(this).val())){
            $("#pwdForm").css("border-bottom", "2px solid skyblue");
            pwdMsg.html("<span class='input-Error'></span>");
        } else {
            $("#pwdForm").css("border-bottom", "2px solid #adadad");
            pwdMsg.html("<span class='input-Error'>8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>");
        }
    });
    //#########################################################################


    //비밀번호 일치하는가 안하는가 체크#########################################
    $("#member_pwd_check").keyup(function () {
        if (passwordCheck()) {
            $("#pwdCheckForm").css("border-bottom", "2px solid skyblue");
            $("#pwdCheckMsg").html("<span class='input-Success'></span>");
        } else {
            $("#pwdCheckForm").css("border-bottom", "2px solid #adadad");
            $("#pwdCheckMsg").html("<span class='input-Error'>비밀번호가 일치하지 않습니다....</span>");
        }
    });
    //##################################################################################################


    //이름 입력 정규식 한글 2~4자 #######################################################
    $("#member_name").keyup(function(){
        let regName = /^[가-힣]{2,4}$/;
        let nameMsg=$("#nameMsg");

        if(regName.test($(this).val())){
            $("#nameForm").css("border-bottom", "2px solid skyblue");
            nameMsg.html("<span class='input-Error'></span>");
        }else{
            $("#nameForm").css("border-bottom", "2px solid #adadad");
            nameMsg.html("<span class='input-Error'>한글 이름 2~4자 이내로 입력해주세요.</span>");
        }
    });
    //#########################################################################


    //이메일 정규식 체크 골뱅이닷컴이 들어가야함.##########################################
    $("#member_email").keyup(function () {
        let regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        let emailMsg = $("#emailMsg");

        if(regEmail.test($(this).val())){
            $("#emailForm").css("border-bottom", "2px solid skyblue");
            emailMsg.html("<span class='input-Success'></span>");
        } else {
            $("#emailForm").css("border-bottom", "2px solid #adadad");
            emailMsg.html("<span class='input-Error'>이메일 양식이 올바르지 않습니다.</span>");
        }
    });
    //#########################################################################


    //생년월일 8자 입력#########################################################
    $("#member_year").keyup(function (){
        if(validateYear()){
            $("#yearFrom").css("border-bottom", "2px solid skyblue");
            $("#member_yearMsg").html("<span class='input-Success'></span>");
        }else{
            $("#yearFrom").css("border-bottom", "2px solid red");
            $("#member_yearMsg").html("<span class='input-Error'>생년월일 8자리 숫자를 입력해주세요!</span>");
        }
    });
    //#########################################################################


    //휴대폰 번호 체크###############################################################################
    $("#member_phone").keyup(function () {

        let regTel = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
        let phoneMsg = $("#phoneMsg");
        if (regTel.test($(this).val())){
            $("#phoneForm").css("border-bottom", "2px solid skyblue");
            phoneMsg.html("<span class='input-Success'></span>");
        } else {
            $("#phoneForm").css("border-bottom", "20px solid red");
            phoneMsg.html("<span class='input-Error'>올바른 휴대폰 번호를 입력하여 주세요.</span><br>" +
            		"<p style='font-size=10px;'>ex)01012345678</p>");
        }
    });
    //주소 3개 각각 입력시 파란밑줄 그어짐 border-bottom 스카이블ㄹ,
    $(".member_zipcode").on("keyup",()=>{
        let flag = zipzip();
        changeBorderColor(flag, 'zipcodeForm');
    });

    $(".member_faddr").on("keyup",()=>{
        let flag = faddr();
        changeBorderColor(flag, 'faddrForm');
    });

    $(".member_laddr").on("keyup",()=>{
        let flag = addr();
        changeBorderColor(flag, 'laddrForm');
    });
    //#############################################################################
});

//우편번호, 주소 값을 받아오면 bottom-bottom 색상 변경
function changeBorderColor(flag, id){
    if(flag){
        $("#"+id).css("border-bottom", "2px solid skyblue");
    } else {
        $("#"+id).css("border-bottom", "2px solid #adadad");
    }
}

//핸드폰 번호 정규식 체크
function phoneCheck(member_phone) {
    let val = member_phone.value;
    // 입력값이 있을때만 실행합니다.
    if (val != null && val != '') {
        // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
        if (val.length == 11 || val.length == 10) {
            // 유효성 체크
            let regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
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

//생년월일 정규식 체크
function validateYear(){
    let year = $("#member_year").val();
    //정규식
    let regYear =/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

    if(regYear.test(year)){
        return true;
    }else{
        return false;
    }
}


//비밀번호를 입력한 값이 일치하는가 안하는가 확인하는 함수
function passwordCheck() {
    var p1 = $("#member_pwd").val();
    var p2 = $("#member_pwd_check").val();
    if (p1 != p2) {
        return false;
    } else {
        return true;
    }
}

//가입 버튼##################################################
function doSignup() {
    var member_id = $("#member_id").val();
    var member_pwd = $("#member_pwd").val();
    var member_name = $("#member_name").val();
    var member_year = $("#member_year").val();
    var member_email = $("#member_email").val()
    var member_phone = $("#member_phone").val();
    var member_zipcode = $("#member_zipcode").val();
    var member_faddr = $("#member_faddr").val();
    var member_laddr = $("#member_laddr").val();
    if(member_id ==''||member_pwd==''||member_name==''||member_phone==''||member_email==''||member_year==''||
        member_zipcode==''||member_faddr==''){
        $("#joinError").html("<span>모든 항목을 입력해주세요.</span>");
    }
    else{
        $("#joinError").html("<span></span>");
        $.ajax({
            type: "POST",
            url: "join",
            data: {
                member_id: member_id,
                member_pwd: member_pwd,
                member_name: member_name,
                member_year: member_year,
                member_email: member_email,
                member_phone: member_phone,
                member_zipcode: member_zipcode,
                member_faddr: member_faddr,
                member_laddr: member_laddr,
            },
            success: function (data) {
            	alert("가입완료");
                window.location.href = "main";
            },
        });
    }


}
//#######################################################
// // 주소입력#3######################################################

function zipzip(){
    let zip = $(".member_zipcode").val();
    if(zip == ''){
        return false;
    }else{
        return true;
    }
}

function faddr(){
    let fadd =$(".member_faddr").val();
    if(fadd == ''){
        return false;
    }else{
        return true;
    }
}
function addr(){
    let addr = $(".member_laddr").val();
    if(addr == ''){
        return false;
    }else{
        return true;
    }
}
//#####################################################################