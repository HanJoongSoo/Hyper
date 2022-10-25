// 맨위로 가는 버튼 기능
const toTopEl = document.querySelector('#to-top');

window.addEventListener('scroll', _.throttle(function(){
   console.log(window.scrollY);
   if(window.scrollY >500){
      //버튼 보이기
      gsap.to(toTopEl, .2,{
         x:0
      });
   }else{
      //버튼 숨기기
      gsap.to(toTopEl, .2,{
         x:100
      });
   }
},300));
//_.throttle(함수, 시간밀리세컨드단위로)
toTopEl.addEventListener('click', function(){
   gsap.to(window,.7,{
      scrollTo: 0
   })
});
