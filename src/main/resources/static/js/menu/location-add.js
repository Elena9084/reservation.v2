
$(function(){
  $(".location-dropdown").change(function() {
    console.log("js 동작");
    const selectedValue = document.getElementsByClassName("location-dropdown")[0].value;
    const locationInput = document.querySelector('#location');
    if (selectedValue === 'add') {
      console.log("추가하기");
      if(locationInput == null){
        $('<input>').attr({
          class: 'location-add-input',
          type: 'text',
          id: 'location',
          name: 'location'
        }).insertAfter($(this));
      }
    } else {
      console.log("locationInput : " + locationInput);
      if (locationInput != null) {
        console.log("삭제까지 무사히 도착");
        $("#location").remove()
      }
    }
  });

});

