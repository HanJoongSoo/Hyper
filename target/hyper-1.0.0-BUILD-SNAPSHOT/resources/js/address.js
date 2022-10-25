function searchPost() {
   new daum.Postcode({
      oncomplete : function(data) {
         var fullAddr = '';
         var extraAddr = '';

         if (data.userSelectedType == 'R') {
            fullAddr = data.roadAddress;
         } else {
            fullAddr = data.jibunAddress;
         }
         if (data.userSelectedType == 'R') {
            if (data.bname !== '') {
               extraAddr += data.bname;
            }
            if (data.buildingName !== '') {
               extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
                     : data.buildingName);
            }
            fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
         }
         document.getElementById('member_zipcode').value = data.zonecode;
         changeBorderColor(true, 'zipcodeForm');

         document.getElementById('member_faddr').value = fullAddr;
         changeBorderColor(true, 'faddrForm');

         document.getElementById('member_laddr').focus();
      }
   }).open();
}