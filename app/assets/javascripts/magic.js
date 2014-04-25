$(function(){
  windowHeight = $(window).height();
  $('#home').css('height', windowHeight);
  $('.item').hover(
    function(){
      $(this).find('.over').stop().fadeIn(400);
    },
    function(){
      $(this).find('.over').fadeOut(400);
    }
  );
  $('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
});
$('#scrolldown').click(function(event){
  $.scrollTo($('#scrolldown'), 800);
});
