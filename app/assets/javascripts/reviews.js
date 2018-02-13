document.addEventListener("turbolinks:load", function() {
  //get average rating
  $(".btn-block").mouseenter(function() {
    var total = 0;
    $( "select#starRating" ).each(function() {
      rating = $(this).val();
      total = total + +rating;
      average = total/4;  
    });
    $("#rating").val(average);
  });

})

  
 
  
  




  
