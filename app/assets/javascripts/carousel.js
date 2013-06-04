// Funcion para crear puntitos
function controlItems(size, container, button){
  if(size==2){
    for (var i = 1; i <= 2; i++) {
      container.append('<a class="control"></a>');  
    };  
  }else if(size==3){
    for (var i = 1; i <= 3; i++) {
      container.append('<a class="control"></a>');  
    };  
  }else if(size==4){
    for (var i = 1; i <= 4; i++) {
      container.append('<a class="control"></a>');  
    };  
  }else if(size==5){
    for (var i = 1; i <= 5; i++) {
      container.append('<a class="control"></a>');  
    };  
  }
}
$(function(){
  
  homeDesignerCarousel();
  saleCarousel();
});

// -----------------------------------------------------------------
// -----------------------------------------------------------------

function homeCarousel(){
  sliderContent = $('.home #myCarousel .carousel-inner');
  carouselHeight = $('.home #myCarousel').height();
  slideVertical = $('.home #myCarousel .carousel-inner .slide');
  slideVertical.css('height', carouselHeight);
  var control = $('.control-carousel .control');
  itemContent = $('.item-content');
  $('.item-content:first-child').addClass('selected');

  slidePos = 0;
  slideCntVertical = slideVertical.size();
  slideSize = slideCntVertical*carouselHeight;
  sliderContent.css('height', slideSize);

  if (slideCntVertical>1) {
    myCounter = setInterval(function(){
      if (slidePos<slideCntVertical-1) {
        slidePos+=1;
        moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);
      }else if(slidePos==slideCntVertical-1){
        slidePos=0;
        moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);
      }
    }, 5000);
  };

  control.off('click').on('click', function(event){
    event.preventDefault();
    slidePos = $(this).index();
    moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);
    clearInterval(myCounter);
  });

  itemContent.off('click').on('click', function(event){
    event.preventDefault();
    slidePos = $(this).index();
    moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);
    clearInterval(myCounter);
  });
}

// -----------------------------------------------------------------
// -----------------------------------------------------------------

function homeNews(){
  // Agregamos los controles de acuerdo a la cantidad de imagenes
  var controls = $('.novedades .carousel-inner .slide').size()/5;
  var controlsInt = Math.ceil(controls);
  var container = $('.home .novedades .control-nav');
  controlItems(controlsInt, container);
  $('.home .novedades .control-nav .control:first-child').addClass('active');

  var sliderContent = $('.novedades .carousel-inner');
  var carouselWidth = $('.novedades').width();
  slide = $('.novedades .carousel-inner .slide');
  var control = $('.control-novedades .control');
  slidePos = 0;
  slideCnt = slide.size();
  slideSize = slideCnt*carouselWidth;
  sliderContent.css('width', slideSize);

  control.off('click').on('click', function(event){
    event.preventDefault();
    slidePos = $(this).index();
    moveSliderToHorizontal(slidePos, carouselWidth, sliderContent, control);
  });
}

// -----------------------------------------------------------------
// -----------------------------------------------------------------
function homeDesignerCarousel(event){
  $('ul.top-designers li:first-child').addClass("active");
  $('ul.top-designers li').off("click").on("click", function(){
    event.preventDefault();
    
    
    var sliderContent = $('#myCarouselTopDesigner .carousel-inner');
    var carouselHeight = $('#myCarouselTopDesigner').height();
    var control = $('ul.top-designers li');
    slidePos = $(this).index();
    itemContent
    moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);

    var sliderContentProd = $('.top-designers .carousel-inner');
    var carouselHeightProd = $('.top-designers .carousel').height();
    moveSliderToVertical(slidePos, carouselHeightProd, sliderContentProd, control, itemContent);
    topDesignerProduct(slidePos);
  });
}

function topDesignerProduct(index){

  var sliderContent = $('.top-designers .carousel .carousel-inner ');
  var carouselWidth = $('.top-designers .carousel').width();
  slide = $('.top-designers .carousel-inner .slide');
  var control = $('.top-designers li');
  
  slidePos = 0;
  slideCnt = slide.size();
  slideSize = slideCnt*carouselWidth;
  sliderContent.css('width', slideSize);
  var sliderMove = $('.top-designers .carousel .carousel-inner .move');

// Agregamos la clase active al control
  if (!index) {
    $('.top-designers .slide[index=0] .control:first-child').addClass('active');
  }else{
    moveSliderToHorizontal(slidePos, carouselWidth, sliderMove, control);
    $('.top-designers .slide[index='+index+'] .control:first-child').addClass('active');
  };

  control.off('click').on('click', function(event){
    event.preventDefault();
    slidePos = $(this).index();
    moveSliderToHorizontal(slidePos, carouselWidth, sliderMove, control);
  });
}

// -----------------------------------------------------------------
// -----------------------------------------------------------------


// -----------------------------------------------------------------
// -----------------------------------------------------------------

function saleCarousel(){
  sliderContent = $('.sale #myCarousel .carousel-inner');
  carouselHeight = $('.sale #myCarousel').height();
  slideVertical = $('.sale #myCarousel .carousel-inner .slide');
  slideVertical.css('height', carouselHeight);
  var control = $('.control-carousel .control');
  itemContent = $('.item-content');
  $('.item-content:first-child').addClass('selected');

  slidePos = 0;
  slideCntVertical = slideVertical.size();
  slideSize = slideCntVertical*carouselHeight;
  sliderContent.css('height', slideSize);

  if (slideCntVertical>1) {
    myCounter = setInterval(function(){
      if (slidePos<slideCntVertical-1) {
        slidePos+=1;
        moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);
      }else if(slidePos==slideCntVertical-1){
        slidePos=0;
        moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);
      }
    }, 5000);
  };

  control.off('click').on('click', function(event){
    event.preventDefault();
    slidePos = $(this).index();
    moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);
    clearInterval(myCounter);
  });

  itemContent.off('click').on('click', function(event){
    event.preventDefault();
    slidePos = $(this).index();
    moveSliderToVertical(slidePos, carouselHeight, sliderContent, control, itemContent);
    clearInterval(myCounter);
  });
}