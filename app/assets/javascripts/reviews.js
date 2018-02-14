document.addEventListener("turbolinks:load", function() {

  //get average rating
  $(".btn-block.reviewBtn").mouseenter(function() {
    var total = 0;  
    $( "input#starRating").each(function() {
      rating = $(this).val();
      total = total + +rating;
      average = total/4;  
     });
    $("#rating").val(average);
  });


  //on hover change color of stars
  $("span.fa-star").mouseenter(function() {
    $(this).css("color", "#f8c045");
    var parentClass = $(this).parent().attr("class");
    $(this).prevAll("."+ parentClass + " > .fa-star").css("color", "#f8c045");
    $(this).nextAll("."+ parentClass + " > .fa-star").css("color", "#333333");

    //to get the number of stars that have been selected get the index of the star.
    var ratingInt = $( "."+ parentClass + " > .fa-star").index($(this))
    //index starts at 0 so increment by 1 to give the correct rating.
    ratingInt++;
    
    $(this).siblings(".review_" + parentClass).find($("input")).val(ratingInt);
    

    
    
  });

})

  
 
  
  




  
