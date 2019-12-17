$(function() {
  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'review[rate]',
    half: true,
    click: function(score, e) {
    $("#review_star").val(score)
    }
    });
});