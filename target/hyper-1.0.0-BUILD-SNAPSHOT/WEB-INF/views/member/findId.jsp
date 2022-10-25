<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>하이퍼 - 아이디 찾기</title>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@구글 공짜 폰트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <link rel="stylesheet" href="resources/css/findId.css">
    <script defer src="resources/js/findId.js"></script>


</head>


<body>
<%@ include file="../include/header.jsp"%>
<%--상단 공통 header.jsp 불러오기 --%>
<div class="container">
    <form class="form" method="post" id="login" action="find_id" name="findform">
        <h1 class="form__title">아이디 찾기</h1>
        <div class="form__message form__message--error">

            <!-- 이름과 전화번호가 일치하지 않을 때 일치하는게 없다고 에러메세지 보낸다.-->
            <!--opener 텍스트 가져옴-->
            <c:if test="${check == 1}">
                <script>
                    opener.document.findform.member_name.value = "";
                    opener.document.findform.member_phone.value = "";
                </script>
                <label>일치하는 정보가 존재하지 않습니다.</label>
            </c:if>
        </div>
        <div class="form__message">
            <!--이름과 전화번호가 일치하면 아이디를 메시지 창에 알려준다.-->
            <h3>
                <c:if test="${check == 0 }">
                    <label>찾으시는 아이디 <span style="color: #0A0A0A">${member_id}</span> 입니다.</label>
                </c:if>
            </h3>
        </div>
        <div class="form__input-group">
            <input type="text" class="form__input" id="member_name" name="member_name" autofocus placeholder="이름">
            <label for="member_name"></label>
            <div class="form__input-error-message"></div>
        </div>
        <div class="form__input-group">
            <input type="text" class="form__input" id="member_phone" name="member_phone" autofocus placeholder="핸드폰번호">
            <label for="member_phone"></label>
            <div class="form__input-error-message"></div>
        </div>
        <button class="form__button" type="submit" value="check">아이디 찾기</button>
        <p class="form__text">
            <a href="find_password_form" class="form__link">비밀번호 찾기</a>
        </p>
        <p class="form__text">
            <a class="form__link" href="main" id="">HOME</a>
        </p>
    </form>


</div>
<footer><%@ include file="../include/footer.jsp"%></footer>
</body>

</html>
