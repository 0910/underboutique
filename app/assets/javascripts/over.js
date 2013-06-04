$(function(){
  $('.item').hover(
    function(){
      $(this).find('.over').stop().hide().fadeIn(300);
      $(this).find('.background').stop().hide().fadeIn(300);
      $(this).find('p').css({color: '#FFF'});
    },
    function(){
      $(this).find('.over').fadeOut(300);
      $(this).find('.background').fadeOut(300);
      $(this).find('p').css({color: '#666'});
    });
});