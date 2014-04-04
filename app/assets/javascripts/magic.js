$(function(){
  makeSlides();
  $('.item').hover(
    function(){
      $(this).find('.over').stop().fadeIn(400);
    },
    function(){
      $(this).find('.over').fadeOut(400);
    });
});
$(window).resize(function() {
  makeSlides();
});
$(window).bind('orientationchange', function(event){
  makeSlides();
});
function makeSlides(){
  photoTot = $('.slide a').size();
  photoTot--;
  photoCnt = 0;
  if (photoTot > 1){ $('.slide .prev, .slide .nextphoto').fadeIn(); }
  $('.photo').each(function(){
      $('.steps').append('<div class="step"></div>');
    });
    // select the first
    $('.photo').eq(0).show();
  $('.steps .step').eq(0).css('opacity', 1);
}
$(window).scroll(function(){
    nav();
});
$('#scrolldown').click(function(event){
  $.scrollTo($('#scrolldown'), 800);
});
function nav(){
  var wherescroll = $(window).scrollTop();
  if (wherescroll <= 50){
    $('#header').css('background-color', 'rgba(0, 0, 0, 0);');
  }
  else {
    $('#header').css('background-color', 'rgba(0, 0, 0, 0.7);');
  }
}
