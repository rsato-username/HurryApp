// var position = $('#drinks').offset().top;


$(function() {
  $('#move_drink').click(function() {
    $("html").animate({
      scrollTop : $('.main__drinks').offset().top
    }, {
      queue : false
    })
  });
});

$(function() {
  $('#move_salesperson').click(function() {
    $("html").animate({
      scrollTop : $('.main__salespersons').offset().top
    }, {
      queue : false
    })
  });
});

$(function() {
  $('#move_top').click(function() {
    $("html").animate({
      scrollTop : $('.main').offset().top
    }, {
      queue : false
    })
  });
});