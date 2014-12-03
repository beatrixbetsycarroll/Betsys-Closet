$(document).ready(function() {
  // $(".item").addClass("col-md-"+ $(this).index());

  // $("img").on('click', function() {
  //   console.log("click");
  // })


  $(".like").submit(function(e) {
    e.preventDefault();
    var data = $(e.target).serialize();
    $.ajax({
      type: "POST",
      url: "/like",
      data: data,
      dataType: "JSON"
    }).done(function(response){
      $("#item-" + response.item_id).html("likes: "+ response.likes);
    });

  });


});
