function moveSliderToHorizontal (slidePos, carouselWidth, sliderContent, control) {
  slideNewPos = slidePos*carouselWidth;
  sliderContent.animate({"right": +slideNewPos},{duration:800, easing:'swing'});
  control.removeClass('active');
  control.eq(slidePos).addClass('active');
  // clearInterval(myCounter);

}