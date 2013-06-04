$(function(){
  $('.product .thumbs .item').off('click').on('click', function(){
    sliderContent = $('.product #myCarousel .carousel-inner .item');
    slidePos = ($(this).index());
    moveSliderToVertical(slidePos, 480, sliderContent);
  })
})