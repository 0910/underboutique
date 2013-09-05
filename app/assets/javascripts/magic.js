$(function(){
  makeSlides();
});
$(window).resize(function() {
  makeSlides();
});
$(window).bind('orientationchange', function(event){
  makeSlides();
});
function makeSlides(){
  windowWidth = $('.container').width();
  if (windowWidth <= 480){
    slideWidth = windowWidth;
    slideCnt = 4;
    slideWidth2 = windowWidth / 3;
    slideCnt2 = 3;
    slideMode = 'horizontal';
  }
  else if (windowWidth > 480 && windowWidth <= 767){
    slideWidth = windowWidth / 4;
    slideCnt = 4;
    slideWidth2 = windowWidth / 3;
    slideCnt2 = 3;
    slideMode = 'horizontal';
  }
  else if (windowWidth > 767){
    slideWidth = windowWidth / 4;
    slideCnt = 4;
    slideWidth2 = windowWidth / 3;
    slideCnt2 = 3;
    slideMode = 'vertical';
  }
  $('.bxslider').bxSlider({
    pagerCustom: '#bx-pager',
    mode: slideMode,
    auto: true
  });
  $('.slider_campaigns').bxSlider({
    slideWidth: slideWidth2,
    minSlides: slideCnt2,
    maxSlides: slideCnt2,
    slideMargin: 0
  });
  $('.slider_products').bxSlider({
    slideWidth: slideWidth,
    minSlides: slideCnt,
    maxSlides: slideCnt,
    slideMargin: 0
  });
  $('.slider_products2').bxSlider({
    slideWidth: slideWidth,
    minSlides: slideCnt2,
    maxSlides: slideCnt2,
    slideMargin: 0
  });
  $('.slider_top5').bxSlider({
    slideWidth: 256,
    minSlides: 1,
    maxSlides: 1,
    slideMargin: 0
  });
  $('.bx-wrapper .bx-viewport').css('height', 'auto');
  $('#topdesigners a').click(function(e) {
    e.preventDefault();
    $(this).tab('show');
  });
}