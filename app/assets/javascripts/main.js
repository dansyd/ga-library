$(document).ready(function(){
  $('.dropdown').click(function (e) {
      // e.preventDefault();
      if ($(e.target).is(':not(.logout)')) {
        e.stopPropagation();
      }
    $('.nav-dropdown').toggle();
  });

  $('html').click(function(){
    $('.nav-dropdown').hide();
  });

  $("#nav-toggle").click(function() {
    $("nav ul").toggle();
  });


  setTimeout(function(){
    $('.flash').remove();
  }, 3000);

  $('.slider').slick({ autoplay: true, autoplaySpeed: 5000, mobileFirst: true });


});
