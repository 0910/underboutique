$(function(){
  $('.slider_campaigns, .slider_products').bxSlider({
    slideWidth: 256,
    minSlides: 4,
    maxSlides: 4,
    slideMargin: 0
  });
  homeCarousel();
  homeNews();
  // Agregamos los controles a top designer de acuerdo a la cantidad de imagenes
  for (var i = 0; i <= 4; i++) {
    var controls = $('.top-designers .carousel .slide[index='+i+'] .span3').size();
    var container = $('.home .top-designers  .slide[index='+i+'] .control-nav');
    var button = $('.home .top-designers .slide[index='+i+'] .control-nav').children();
    controlItems(controls, container, button);
  };

  topDesignerProduct();
});