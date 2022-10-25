<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hyper Login</title>

  <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@구글 공짜 폰트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="resources/css/login.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script defer src="resources/js/login.js"></script>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp"%>
  <div id="root">
    <div id="wrap">
      <div id="container" class="noFooter">
        <div class="bdsNavbar container-bar">
        <!--로그인 타이틀 문구 있는부분-->
        <div class="login-title">
          <div class="loginTitle login-title-box">
            <div class="login-title-box-header section-header">
              <div class="login-title-text">
                <h3 class="login-title-h3 bold display2">안녕하세요 하이퍼입니다</h3>
              </div>
              <p class="subTitle body2 loginsub">잘 부탁드립니다. 언제 든지 로그인이 가능합니다.</p>
            </div>
          </div>

          <!--아이디 비밀번호 입력하는 부분-->
          <div class="login-form-wrap">
            <form action="#" id="login">
              <div class="login-form-group fieldId">
                <!--아이디 영역-->
                <div class="login-form-input input-group">
                  <div class="login-form-input-text">
                    <input placeholder="아이디 입력" name="member_id" id="member_id" class="input-id" value="">
                  </div>
                 
                </div>
              </div>
              <div class="login-form-group fieldPwd">
                <!--비밀번호 영역-->
                <div class="login-form-input">
                  <div class="login-form-input-text">
                    <input placeholder="비밀번호 입력" type="password" name="member_pwd" id="member_pwd" autocomplete="off" class="input-password"
                      value="">
                    <span class="pwd-css">
                      <button type="button" class="icon-button view-button">
                        <svg class="svgIcon viewLine viewLine-round  css-icon" role="img" aria-label="view"
                          viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none">
                          <path
                            d="M20 12C20 13.5 16.4183 18 12 18C7.58172 18 4 13.5 4 12C4 10.5 7.58172 6 12 6C16.4183 6 20 10.5 20 12Z"
                            stroke="#202429" stroke-width="1.5"></path>
                          <circle cx="12" cy="12" r="3" stroke="#202429" stroke-width="1.5"></circle>
                        </svg></button></span>
                  </div>
                  <div class="input-message-error"></div>
                </div>
              </div>
              <button type="button" onclick="memberCheck()" class="loginBtn login-btn"><span class="text button1 bold">로그인</span></button>
            </form>
            <script>
               $("#login").keypress(function(e){
                  if(e.keyCode === 13){
                     memberCheck();
                  }
               });
            </script>


            <!--찾기 가입 영역-->
            <div class="textBtnWrap textBtn">
              <button class="textButton text-btn-css" onclick="location.href='find_id_form'">
                <span class="text button2">아이디 찾기</span>
              </button>
              <button class="textButton text-btn-css" onclick="location.href='find_password_form'">
                <span class="text button2">비밀번호 찾기</span>
              </button>
              <button class="textButton text-btn-css" type="button" onclick="location.href='signup'">
                <span class="text button2">회원 가입</span>
              </button>
            </div>
            <!--sns-->
            <div class="snsWrap sns-line"><span class="before"></span>
              <p>SNS 계정으로 로그인</p><span class="after"></span>
            </div>

            <div class="iconBtnWrap css-pz4faq sns-login-icon"><a>
                <h1 class="ir">kakao</h1><span><img src="resources/image/login/ic_kakao.svg" alt="카카오톡" class="snsIcon" title="카카오톡 로그인"></span>
              </a><a>
                <h1 class="ir">facebook</h1><span><img src="resources/image/login/ic_facebook.svg" alt="페이스북" class="snsIcon" title="페이스북 로그인"></span>
              </a><a class="google">
                <h1 class="ir">google</h1><span><img src="resources/image/login/ic_google.svg" alt="구글" class="snsIcon" title="구글 로그인"></span>
              </a><a>
                <h1 class="ir">naver</h1><span><img src="resources/image/login/ic_naver.svg" alt="네이버" class="snsIcon" title="네이버 로그인"></span>
              </a>
              <div id="naverIdLogin" style="display: none;"><a id="naverIdLogin_loginButton" href="#"><img
                    src="https://static.nid.naver.com/oauth/button_g.PNG?version=js-2.0.1" height="250"></a></div><a>
                <h1 class="ir">apple</h1><span><img src="resources/image/login/ic_apple.svg" alt="애플" class="snsIcon" title="애플 로그인"></span>
              </a>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<%@ include file="../include/footer.jsp"%>
</html>