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


$(function() {
  $('#star-rating-result').raty({
    path: '/assets/',
    scoreName: 'review[rate]',
    half: true,
    readOnly: true,
    // click: function(score, e) {
    // $("#review_star").val(score)
    // }
    });
});