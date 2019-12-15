$(function() {
  function builtHTML(salesperson){
    let html = `
    <div class = order__form__salesperson__search>
      <p>${salesperson.name}</p>
    </div>
    `
    $(".order__form__salesperson__search").append(html);
  }

  function NoResult(){
    let html = `
    <div class = order__form__salesperson__search>
      <p>売り子が見つかりません</p>
    </div>
    `
    $(".order__form__salesperson__search").append(html);
  }

  $("#search").on("keyup", function(){
    let input = $("#search").val();
    $.ajax({
      type: "GET",
      url: "/orders",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(salesperson) {
        $(".order__form__salesperson__search").empty();
        if (salesperson.length !== 0) {
          salesperson.forEach(function(salesperson) {
            builtHTML(salesperson);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          NoResult();
        }
      })
      .fail(function(){
        alert('通信エラー');
      })
  });
});