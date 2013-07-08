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
  $('.slider_top5').bxSlider({
    slideWidth: 256,
    minSlides: 1,
    maxSlides: 1,
    slideMargin: 0
  });
  $('#topdesigners a').click(function(e) {
    e.preventDefault();
    $(this).tab('show');
  })
});