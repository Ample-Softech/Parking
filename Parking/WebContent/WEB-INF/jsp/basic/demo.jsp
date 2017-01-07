<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/jquery.js"></script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCy0y-BGBgl6fjl1zDhcBpgHHo6ZR6PXvY&&libraries=places&&callback=initMap"
     async defer></script>
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
    
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
  <div class="container">
  	<div class="row">
  		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="map" style="height: 300px;"></div>
  		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 form-group"  style="height: 300px;">
  			<label>First Name</label>
  			<input id="searchPlace" type="text" class="form-control" required="required" title="HERE" >
  		</div>
  	</div>
  </div>
<!--     <div id="map"></div> -->
    <script>
    
    	$(document).ready(function(){
    		
    		
    		
    		$("#searchPlace").click(function(){
    			initAutocomplete();
    			autocomplete = new google.maps.places.Autocomplete(
    		              /** @type {!HTMLInputElement} */(document.getElementById('searchPlace')),
    		              {types: ['geocode']});
    			autocomplete.addListener('place_changed', fillInAddress);
    		});
    	});
      var map;
      function initMap() {
    	  var markers = [];
    	  var pos;
    	  if (navigator.geolocation) {
              navigator.geolocation.getCurrentPosition(function(position) {
            	  var directionsService = new google.maps.DirectionsService;
                  var directionsDisplay = new google.maps.DirectionsRenderer;
                pos = {
                  lat: position.coords.latitude,
                  lng: position.coords.longitude
                };
                map = new google.maps.Map(document.getElementById('map'), {
                    center: pos,
                    zoom: 10
                  });
                directionsDisplay.setMap(map);
//                   new google.maps.Marker({
//                       position: pos,
//                       map: map,
//                       draggable: true,
//                       animation: google.maps.Animation.DROP
//                     });
                  
//                   new google.maps.Marker({
//                 	  position: {lat: 18.501832, lng: 73.863591},
//                       map: map,
//                       draggable: true,
//                       animation: google.maps.Animation.DROP
//                     });
                  
//                   directionsService.route({
//                       origin: pos,
//                       destination: {lat: 18.501832, lng: 73.863591},
//                       travelMode: 'DRIVING'
//                     }, function(response, status) {
//                       if (status === 'OK') {
//                         directionsDisplay.setDirections(response);
//                       } else {
//                        alert('Directions request failed due to ' + status);
//                       }
//                     });
              });
    	  }
    	  
    	  
    	  var neighborhoods = [
    	                       {lat: 18.507399, lng: 73.807650},
    	                       {lat: 52.549, lng: 13.422},
    	                       {lat: 52.497, lng: 13.396},
    	                       {lat: 52.517, lng: 13.394}
    	                     ];
    	  
    	  
        
      }
      
      function initAutocomplete() {
          // Create the autocomplete object, restricting the search to geographical
          // location types.
          autocomplete = new google.maps.places.Autocomplete(
              /** @type {!HTMLInputElement} */(document.getElementById('searchPlace')),
              {types: ['geocode']});

          // When the user selects an address from the dropdown, populate the address
          // fields in the form.
          autocomplete.addListener('place_changed', fillInAddress);
        }

        function fillInAddress() {
          // Get the place details from the autocomplete object.
    	var place = autocomplete.getPlace();
          alert(place.geometry.location.lat()+"  "+place.geometry.location.lng());
       
          posM = {
                  lat: place.geometry.location.lat(),
                  lng: place.geometry.location.lng()
                };
          
          map = new google.maps.Map(document.getElementById('map'), {
              center: posM,
              zoom: 15
            });
          new google.maps.Marker({
              position: posM,
              map: map,
              draggable: true,
              animation: google.maps.Animation.DROP
            });

        }
      
    </script>
    
  </body>
</html>