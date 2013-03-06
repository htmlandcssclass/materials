$(document).ready(function(){

  $('.feedback-badge').click(function(){
    $('.modal-container').addClass('visible');
  });

  $('.close').click(function(){
    $('.modal-container').removeClass('visible');
  });

  $('.modal-container').click(function(){
    $('.modal-container').removeClass('visible');
  });

});