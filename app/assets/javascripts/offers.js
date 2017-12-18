$(function () {

  //_form.html.haml --------------------------------

  $('[data-toggle="tooltip"]').tooltip();  
    


  $('#datetimepicker1').datetimepicker({
    //change to rails datetime format
    format : "YYYY-MM-DD HH:mm:ss",
  });

  $("#pickup").click(function() {
    $("#tip").css("display", "block");
  });

  $("#dropoff").click(function() {
    $("#tip").css("display", "block");
  });

  //calculate distance
  function calculateDistance(origin, destination) {
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix(
    {
      origins: [origin],
      destinations: [destination],
      travelMode: google.maps.TravelMode.DRIVING,
      unitSystem: google.maps.UnitSystem.IMPERIAL,
      avoidHighways: false,
      avoidTolls: false
    }, callback);
  }

  function callback(response, status) {
    
    var origin = response.originAddresses[0];
    var destination = response.destinationAddresses[0];
    var distance = response.rows[0].elements[0].distance;
    var distance_value = distance.value;
    var distance_text = distance.text;
    var miles = distance_text.substring(0, distance_text.length - 3);
    calulateCost(miles);
    $('#results').html("It is " + miles + " miles from " + origin + " to " + destination);
  }
  
  function calulateCost(miles){
    var fpg = 5.360 //price of fuel per gallon
    var mpg = 35    //miles per gallon
    var gpt = miles / mpg //amount of gallons of petrol used for trip
    var totalCost = fpg * gpt

    var passengers =  $('#noOfSeats').val(); //amount of passengers
    passengers ++; //include the driver
    var pricePerPas = totalCost / passengers; //cost each passenger should pay
    pricePerPas = pricePerPas.toFixed(2); //show to 2 decimal places

    $("#price").val(pricePerPas);
  }

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
        //display price
        var origin = $('#pickup').val();
        var destination = $('#dropoff').val();
        var distance_text = calculateDistance(origin, destination); 

        //hide map inputs
        $("#origin-input").css("display", "none");
        $("#destination-input").css("display", "none");
        $("#changemode-driving").css("display", "none");
      }
    });
  });

});

  


  
