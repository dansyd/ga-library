$(document).ready(function(){

$('.dropdown').click(function (e) {
    e.preventDefault();
  $('.nav-dropdown').toggle();
});

$('html').click(function(){
  $('.nav-dropdown').hide();
});

$("#nav-toggle").click(function() {
      $("nav ul").toggle();
    });
    // Hamburger to X toggle
    document.querySelector("#nav-toggle").addEventListener("click", function() {
      this.classList.toggle("active");
    });

  });
