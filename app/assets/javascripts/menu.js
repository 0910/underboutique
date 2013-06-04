$(function(){
  login = 'false';
  $('.login').off('click').on('click', function(){
    if(login=='false'){
      $('.login-box').slideToggle('fast');
      login = 'true';
      $('.search-box').hide();
      search = 'false';
    }else{
      $('.login-box').slideToggle('fast');
      login = 'false';
    }
  });


  search = 'false';
  $('.search').off('click').on('click', function(){
    if(search=='false'){
      $('.search-box').slideToggle('fast');
      search = 'true';
      $('.login-box').hide();
      login = 'false';
    }else{
      $('.search-box').slideToggle('fast');
      search = 'false';
    }
  });
});