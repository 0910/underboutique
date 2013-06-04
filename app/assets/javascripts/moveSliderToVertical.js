function moveSliderToVertical (slidePos, carouselHeight, sliderContent, control, itemContent) {
  slideNewPos = slidePos*carouselHeight;
  sliderContent.animate({"top": -+slideNewPos},{duration:800, easing:'swing'});
  control.removeClass('active');
  control.eq(slidePos).addClass('active');
  itemContent.removeClass('selected');
  itemContent.eq(slidePos).addClass('selected');
}
