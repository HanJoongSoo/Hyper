<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.footer * {
   /* footer 전체 설정 */
   background-color: #eeeeee;
   margin: 0;
   padding: 0;
   font-size: 14px;
   text-align: justify;
   line-height: 24px;
   color:#333333;
   font-family: Noto Sans KR, Spoqa Han Sans, Sans-serif;
   font-weight: 400;
   letter-spacing: 0;
}
.footer img {
   margin-bottom: 10px;
   margin-left: 10px;
   margin-right: 10px;
}
div {
   display: block;
}

.footer .links-social {
   /* 인스타 페북 네이버 플친 */
   float: right;
   color: #666666;
   resize: both;
   padding: 10px;
}

.footer .inner {
   max-width: 1160px;
   margin: 0 auto;
}

.tit-h1 {
   color: #333333;
   font-size: 18px;
}
.infos{
   display: block;
   font-size: 14px;
    line-height: 24px;
   font-style: normal;
   padding-top: 50px;
}
.infos-cs{
   padding-bottom: 100px;
   float: right;
   margin-top: 100px;
   width:325px;
   font-style: normal;
}
.clear{
   clear:both;
   display: block;
   content: "";
}
.more-brandi{
   font-size: 22px;
   font-weight: bold;
}
</style>
</head>
<body>
   <footer class="footer"> <nav class="division">
   <div class="inner">
      <div class="links-about">
         <span class="br-m"><a href="#" target="_blank" class="about" onclick="location.href='welcome'">하이퍼소개</a>
            <a href="#" target="_blank" rel="noreferrer noopener" class="recruit">인재채용</a> 
            <a href="#" target="_blank" class="question" onclick="location.href='faq'">자주묻는 질문</a>
         </span> 
            <a href="#" target="_blank" class="terms" onclick="location.href='location'">오시는길</a> 
            <a href="/policy" target="_blank" class="privacy">개인정보처리방침</a> 
            <a href="#" target="_blank" class="business">사업자정보확인</a>
      </div>
      <div class="links-social">
         <a href="#" target="_blank" rel="noreferrer noopener"><image src="resources/image/footer/insta.svg" alt="인스타그램"></a>
         <a href="#" target="_blank" rel="noreferrer noopener"><image src="resources/image/footer/facebook.svg" alt="페이스북"></a>
         <a href="#" target="_blank" rel="noreferrer noopener"><image src="resources/image/footer/kakaoplus.svg" alt="카카오"></a>
         <a href="#" target="_blank" rel="noreferrer noopener"><image src="resources/image/footer/naver.svg" alt="네이버"></a>
      </div>
   </div>
   </nav>

   <address class="division">
      <div class="inner">
         <div class="infos">
            <h1 class="tit-h1">
               <a href="#" class="more-brandi">하이퍼</a>
            </h1>
            <div>
               <div class="bundle">
                  <span class="part">대표이사 : 문도박사 | </span> 
                  <span>사업자등록번호 : 22-03-1996 | </span> 
                     <span>통신판매업신고 : 2022-텔레텔레콤파니-12345</span>
               </div>
               <div class="bundle">
                  <span>호스팅사업자 : (주)영윤띠 | </span> 
                  <span>주소 : 서울 도봉구 마들로 646 110동</span>
               </div>
               <div> 개인정보관리책임자 : 티모 보안관( <a href="#"> a01053968208@gmail.com</a>)
               </div>
            </div>
            <p>
               <span class="br">(주)영윤띠가 제공하는 하이퍼 서비스는 통신판매중개자로서 통신판매 당사자가 아니며,<br></span> 
               <span class="br">판매자가 등록한 상품정보 및 거래에 하이퍼는 책임지지 않습니다.</span>
            </p>
            <div class="prd-info">
               <strong>25% 정품</strong>
               <p>하이버에서 판매되는 모든 브랜드 제품은 정식제조, 정식수입원을 통해 유통되는 25% 정품입니다.</p>
            </div>
            <p>
               <b>안전거래센터</b>
               <a href="https://sites.google.com/brandi.co.kr/safety/%ED%99%88?authuser=0 " target="_blank">신고하기</a>
            </p>
         </div>
         <div class="infos-cs">
            <h2 class="tit-h1">고객센터 <a href="#">1577-1577</a></h2>
            <div>
               <h3 class="tit-h2">영업시간</h3>
               <a>AM 11:00</a>
               ~
               <a>PM 14:00</a>
               (주말 및 공휴일 휴무)
            </div>
            <div class="time">
               <h3 class="tit-h2">점심시간</h3>
               <a>AM 12:00</a>
               ~
               <a>PM 13:30</a>
            </div>
            <div class="infos-link">
               <a href="http://pf.kakao.com/_yCxkxhC" target="_blank" rel="noreferrer noopener">입점문의</a>
               <a href="https://admin.hiver.co.kr" target="_blank">셀러어드민</a>
            </div>
         </div>
         <div class="clear"></div>
      </div>
   </address>
   </footer>
</body>
</html>