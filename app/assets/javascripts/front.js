$(function() {
  $('#move_drink').click('turbolinks:load', function() {
    $("html").animate({
      scrollTop : $('.main__drinks').offset().top
    }, {
      queue : false
    })
  });
});

$(function() {
  $('#move_salesperson').click('turbolinks:load', function() {
    $("html").animate({
      scrollTop : $('.main__salespersons').offset().top
    }, {
      queue : false
    })
  });
});

$(function() {
  $('#move_top').click('turbolinks:load', function() {
    $("html").animate({
      scrollTop : $('.main').offset().top
    }, {
      queue : false
    })
  });
});