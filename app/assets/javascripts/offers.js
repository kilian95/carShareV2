$(function () {

  $('[data-toggle="tooltip"]').tooltip();  
    
  $("#continueBtn").click(function() {


    //check inputs have not been left blank
    $(".step1 input").each(function() {
      var element = $(this);
      if (element.val() == "") {
        alert("All inputs are required.")
        return false; //break out of loop  
      }else {
        $(".step1").css("display", "none");
        $(".step2").css("display", "block");
      }
    });
    
    
  });

  $('#datetimepicker1').datetimepicker({
    //change to rails datetime format
    format : "YYYY-MM-DD HH:mm:ss",
  });

  //check each input is not blank
  
});