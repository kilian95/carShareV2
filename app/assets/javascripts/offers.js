document.addEventListener("turbolinks:load", function() {

  //------------------offer/new --------------------------------

  $('[data-toggle="tooltip"]').tooltip();  

  $("#pickup").click(function() {
    $("#tip").css("display", "block");
  });

  $("#dropoff").click(function() {
    $("#tip").css("display", "block");
  });

  $("#search").click(function() {
    $(".searchResults").show();

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
    $("#totalMiles").val(miles);
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
        var origin = $('#origin-input').val();
        var destination = $('#destination-input').val();
        var distance_text = calculateDistance(origin, destination); 

        //hide map inputs
        $("#origin-input").css("display", "none");
        $("#destination-input").css("display", "none");
        $("#changemode-driving").css("display", "none");
      }
    });
  });

  

  //------------------offer/search --------------------------------

  //when user clicks info div redirect to offer/show/id
  $(".info#searchItem").click(function(){
    window.location = $(this).find("#pickup a").attr("href");
  });



  $('#datetimepicker1').datetimepicker({
    //change to rails datetime format
    format : "YYYY-MM-DD HH:mm:ss",
  });

  function limitSearch(type, address){
    //for each result check if the corresponding address contains the home/work address
    $(".col-sm-4#" + type).each(function() {
      var result = $(this).text();
      if (result.indexOf(address) >= 0){
      }else{
        //hide results that do not contain address
        $(this).closest(".panel-primary.info").hide();
      }
    })
  }
  //limit search to results near home or work address
  $('input:checkbox').change(function(){
    if ($(this).is(':checked')) {
      //get type of checked box.
      var type = $(this).attr('id');
      //get address for home/work
      var address = $("span.address#" + type).text();
      limitSearch(type, address);
    }//else if user unticks box 
    else{
      //show the hidden results
      $( ".panel-primary.info").each(function() {
        $(this).show();
      })
      //if the other box is checked, narrow results.
      //get the id of the other box.
      var type = $(this).parent().siblings().children($("input")).attr('id');
      var address = $(this).parent().siblings().children($("span")).text();
      if ($("input#" + type).is(':checked')){
        limitSearch(type, address);
      }
    }
  })

  //show time input if user clicks return trip
  $('#offer_return_trip:checkbox').change(function(){
    if ($(this).is(':checked')) {
      $("#returnTripTime ").show();
    }else{
      $("#returnTripTime ").hide();
    }
  })

  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
  })

 
})