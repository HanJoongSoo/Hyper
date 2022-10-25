<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>HYPER</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script defer src="resources/js/main.js"></script>
</head>
<body>
   <%@ include file="include/header.jsp"%>

   <!-- 슬라이드 섹션 -->
   <!-- 9/14 화면을 줄였을때 오른쪽 버튼이 사라지는 부분 찾아봐야함 -->
   <section>
   <div class="slideshow-container">

      <!-- 슬라이드 이미지 부분 -->
      <div class="mySlides fade">
         <div class="numbertext">1 / 6</div>
         <img src="resources/image/body/main_img1.jpg" style="width: 100%">
         <div class="text">HYPER</div>
      </div>

      <div class="mySlides fade">
         <div class="numbertext">2 / 6</div>
         <img src="resources/image/body/main_img2.jpg" style="width: 100%">
         <div class="text">HYPER</div>
      </div>

      <div class="mySlides fade">
         <div class="numbertext">3 / 6</div>
         <img src="resources/image/body/main_img3.jpg" style="width: 100%">
         <div class="text">HYPER</div>
      </div>

      <div class="mySlides fade">
         <div class="numbertext">4 / 6</div>
         <img src="resources/image/body/main_img1.jpg" style="width: 100%">
         <div class="text">HYPER</div>
      </div>

      <div class="mySlides fade">
         <div class="numbertext">5 / 6</div>
         <img src="resources/image/body/main_img2.jpg" style="width: 100%">
         <div class="text">HYPER</div>
      </div>

      <div class="mySlides fade">
         <div class="numbertext">6 / 6</div>
         <img src="resources/image/body/main_img3.jpg" style="width: 100%">
         <div class="text">HYPER</div>
      </div>

      <!-- 슬라이드 양옆으로 넘기기 -->
      <a class="prev" onclick="moveSlides(-1)">&#10094;</a> <a class="next"
         onclick="moveSlides(1)">&#10095;</a>
   </div>
   <br />

   <!-- 슬라이드 아래 버튼 -->
   <div style="text-align: center">
      <span class="dot" onclick="currentSlide(0)"></span> <span class="dot"
         onclick="currentSlide(1)"></span> <span class="dot"
         onclick="currentSlide(2)"></span> <span class="dot"
         onclick="currentSlide(3)"></span> <span class="dot"
         onclick="currentSlide(4)"></span> <span class="dot"
         onclick="currentSlide(5)"></span>
   </div>

   </section>

   <!-- 슬라이드 아래 부분 -->

   <!-- 주력 물품 영역 -->
   <hr class="noline">
   <section class="clothes">
   <h2>TODAY BEST</h2>
   <hr align="center">
   <img id="back1" src="resources/image/body/left.png" />
   <div class="slide1">
      <table>
         <tr>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/today/today1.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">일자 청바지</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 청바지<br> 남녀노소 입을 수 있는 청바지<br> 가성비 좋은 청바지
                  </div>
                  <a herf="" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>
               <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/today/today2.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">일자 청바지(검정)</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 청바지<br> 남녀노소 입을 수 있는 청바지<br> 가성비 좋은 청바지
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>   
               <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/today/today3.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">맨투맨</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 맨투맨<br> 남녀노소 입을 수 있는 맨투맨<br> 가성비 좋은 맨투맨
                  </div>
                  <a herf="#" onclick="location.href='category?cate_id=TOP20220010'" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>   
               <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/today/today4.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">츄리닝 바지</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 츄리닝 바지<br> 남녀노소 입을 수 있는 츄리닝 바지<br> 가성비 좋은 츄리닝바지
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>   
               <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/today/today5.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">긴팔티</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 긴팔티<br> 남녀노소 입을 수 있는 긴팔티<br> 가성비 좋은 긴팔티
                  </div>
                  <a herf="#" onclick="location.href='category?cate_id=TOP20220010'" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>   
               <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/today/today6.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">조거 츄리닝 바지</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 조거 츄리닝 바지<br> 남녀노소 입을 수 있는 조거 츄리닝 바지<br> 가성비 좋은 조거 츄리닝 바지
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>   
               <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/today/today7.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">카라 맨투맨</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 카라 맨투맨<br> 남녀노소 입을 수 있는 카라 맨투맨<br> 가성비 좋은 카라 맨투맨
                  </div>
                  <a herf="#" onclick="location.href='category?cate_id=TOP20220010'" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>   
               <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/today/today8.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">후드티</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 후드티<br> 남녀노소 입을 수 있는 후드티<br> 가성비 좋은 후드티
                  </div>
                  <a herf="#" onclick="location.href='productpage?prd_id=TOP003'" class="caption_link">더 보기</a>
               </div></div>
            </td>   
         </tr>
      </table>
   </div>
   <img id="next1" src="resources/image/body/right.png" /> <script>
      $(document).ready(function() {
         var imgs;
         var img_count;
         var img_position = 1;

         imgs = $(".slide1 tr");
         img_count = imgs.children().length;

         //버튼을 클릭했을 때 함수 실행
         $('#back1').click(function() {
            back();
         });
         $('#next1').click(function() {
            next();
         });

         function back() {
            if (1 < img_position) {
               console.log("sex");
               imgs.animate({
                  left : '+=1290px'
               });
               img_position--;
            }
         }
         function next() {
            if (2 > img_position) {   // 사진이 추가되면 숫자를 올려주면 된다
               imgs.animate({
                  left : '-=1290px'
               });
               img_position++;
            }
         }
      });
   </script> <!-- 신상 모아보기 -->



   <h2>신상 모아보기</h2>
   <hr align="center">
   <img id="back2" src="resources/image/body/left.png" />
   <div class="slide2">
      <table>
         <tr>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/new/new01.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">맨투맨(회색)</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 맨투맨<br> 남녀노소 입을 수 있는 맨투맨<br> 가성비 좋은 맨투맨
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/new/new02.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">맨투맨(아이보리)</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 맨투맨<br> 남녀노소 입을 수 있는 맨투맨<br> 가성비 좋은 맨투맨
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/new/new03.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">맨투맨(베이지)</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 맨투맨<br> 남녀노소 입을 수 있는 맨투맨<br> 가성비 좋은 맨투맨
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/new/new04.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">맨투맨(크림)</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 맨투맨<br> 남녀노소 입을 수 있는 맨투맨<br> 가성비 좋은 맨투맨
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/new/new05.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">후드 야상</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 후드 야상<br> 남녀노소 입을 수 있는 후드 야상<br> 가성비 좋은 후드 야상
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/new/new06.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">가을 세트1</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 세트 옷<br> 남녀노소 입을 수 있는 세트 옷<br> 가성비 좋은 세트 옷
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/new/new07.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">가을 세트2</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 세트 옷<br> 남녀노소 입을 수 있는 세트 옷<br> 가성비 좋은 세트 옷
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
            <td>
            <div class="hover_effect_box hover_effect_1">
               <div class="content_bg">
                  <img src="resources/image/body/new/new08.jpeg"
                     style="width: 300px; height: 300px;">
               </div>
               <div class="caption">
                  <div class="caption_title">가을 세트3</div>
                  <div class="caption_desc">
                     조영윤이 입고 나온 세트 옷<br> 남녀노소 입을 수 있는 세트 옷<br> 가성비 좋은 세트 옷
                  </div>
                  <a herf="#" class="caption_link">더 보기</a>
               </div></div>
            </td>
         </tr>
      </table>
   </div>
   <img id="next2" src="resources/image/body/right.png" /> <script>
      $(document).ready(function() {
         var imgs;
         var img_count;
         var img_position = 1;

         imgs = $(".slide2 tr");
         img_count = imgs.children().length;

         //버튼을 클릭했을 때 함수 실행
         $('#back2').click(function() {
            back();
         });
         $('#next2').click(function() {
            next();
         });

         function back() {
            if (1 < img_position) {
               imgs.animate({
                  left : '+=1290px'
               });
               img_position--;
            }
         }
         function next() {
            if (2 > img_position) { // 사진이 추가되면 숫자를 올려주면 된다
               imgs.animate({
                  left : '-=1290px'
               });
               img_position++;
            }
         }
      });
   </script> </section>


   <!-- 홍보물 사진 영역 -->
   <div class="main-product-list">
      <div class="title">
         <h2>지금 뜨고있는 하이퍼 혜택</h2>
      </div>
      <ul class="main-event-list">
         <li class="event-item"><a class="event-img"
            style="background-image: url(resources/image/body/event_item1.jpg);">
         </a>
         <li class="event-item"><a class="event-img"
            style="background-image: url(resources/image/body/event_item2.jpg);">
         </a></li>
      </ul>
   </div>
   <hr class="noline">
   <%@ include file="include/footer.jsp"%>
</body>
</html>