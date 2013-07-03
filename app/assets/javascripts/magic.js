$(function(){
  $('.bxslider').bxSlider({
    pagerCustom: '#bx-pager',
    mode: 'vertical'
  });
  $('.slider_campaigns, .slider_products').bxSlider({
    slideWidth: 256,
    minSlides: 4,
    maxSlides: 4,
    slideMargin: 0
  });
});