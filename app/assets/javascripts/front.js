$(function() {
  $('#move_drink').click('turbolinks:load', function() {
    $("html").animate({
      scrollTop : $('.drink').offset().top
    }, {
      queue : false
    })
  });
});

$(function() {
  $('#move_salesperson').click('turbolinks:load', function() {
    $("html").animate({
      scrollTop : $('.salesperson').offset().top
    }, {
      queue : false
    })
  });
});

$(function() {
  $('#move_top').click('turbolinks:load', function() {
    $("html").animate({
      scrollTop : $('.body__main').offset().top
    }, {
      queue : false
    })
  });
});