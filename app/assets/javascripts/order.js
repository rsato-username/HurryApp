$(function() {
  function builtHTML(salesperson){
    let html = `
    <div class = salesperson>
      ${salesperson.name}
    </div>
    `
    $("#search-result").append(html);
  }

  function NoResult(){
    let html = `
    <div class = salesperson>
      <p>売り子が見つかりません</p>
    </div>
    `
    $("#search-result").append(html);
  }

  $("#search").on("keyup", function(){
    let input = $("#search").val();
    $.ajax({
      type: "GET",
      url: "/orders/new",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(salesperson) {
        $("#search-result").empty();
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