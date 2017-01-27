<!--  -->                
<div class="container register">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    		<form class="form" name="form" role="form">
				<h2 > Parkink-Space <small> Please Provide Space for Parking. </small></h2>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                    	    <input type="text" name="street" id="street" class="form-control input-lg" placeholder=" Street/Area " tabindex="1">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                        	<input type="text" name="city" id="city" class="form-control input-lg" placeholder=" Town/City " tabindex="1">
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="pincode" id="pincode" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
						</div>
					</div>				

					<div class="col-xs-6 col-md-6">
						<button id="find" onclick="GetLocation()" class="btn btn-success btn-block btn-lg"> Find </button>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<h2 name="lat" id="lat" class="form-control input-lg" placeholder=" Latitude " tabindex="1">Latitude</h2>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<h2 name="lng" id="lng" class="form-control input-lg" placeholder=" Longitude " tabindex="1">Longitude</h2>
						</div>
					</div>										
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<label >Features: </label>
								<input type="checkbox" class="" value="" name="" /><label for="">CCTV</label>
								<input type="checkbox" class="" value="" name="" /><label for="">Garage</label>
								<input type="checkbox" class="" value="" name="" /><label for="">Washing</label>
								<input type="checkbox" class="" value="" name="" /><label for="">Security</label>							
					</div>
				</div>				
				
				<hr class="colorgraph">
				
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="submit" value="Next" class="btn btn-primary btn-block btn-lg" tabindex="7">
					</div>
		<!-- id="activate-step-3" -->
					<div class="col-xs-12 col-md-6">
						<a href="#" id="activate-step-4" class="btn btn-success btn-block btn-lg"> Skip </a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!--  -->
<script type="text/javascript">
        function GetLocation() {
            var geocoder = new google.maps.Geocoder();
            //var address = document.form.pincode.value; 
            var address = document.getElementById("pincode").value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    document.getElementById('lat').innerHTML=latitude;
                    document.getElementById('lng').innerHTML=longitude;
//                    alert("address: "+address+"\nLatitude: " + latitude + "\nLongitude: " + longitude);
    	       		window.location = "/Parking/Checkpin.basic?loc="+address+"&lat=" + latitude + "&lng=" + longitude;
                
/*          var fenway = {lat: latitude, lng: longitude};
            var map = new google.maps.Map(document.getElementById('map'), {
                center: fenway,
                zoom: 16,
                mapTypeId:google.maps.MapTypeId.ROADMAP
            });

            var infowindow = new google.maps.InfoWindow();
            var service = new google.maps.places.PlacesService(map);
            var geocoder = new google.maps.Geocoder;

    		geocoder.geocode({'location': fenway}, function(results, status) {
        		if (status === google.maps.GeocoderStatus.OK) {
    	      		if (results[0]) {
        	      		var marker = new google.maps.Marker({
            	      		map: map,
                	  		draggable: true,
                  			animation: google.maps.Animation.DROP,
                  			position: fenway,
                  			title: 'Google '
                		});
    	      			var title = marker.getTitle();
        		      		google.maps.event.addListener(marker, 'click', function() {          		
                			infowindow.setContent('<div><strong>' + marker.getTitle() + '</strong><br>' +
                    		'Place ID: ' + results[0].place_id + '<br>' +'Address: '+ results[0].formatted_address + '</div>');
                  			infowindow.open(map, this);
                		});
    	      		} else {
            			window.alert('No results found');
          			}
        		} else {
          			window.alert('Geocoder failed due to: ' + status);
        		}
    	  	});
 */
                    
      // -----
                } else {
                    alert("Request failed.");
                }
            });
        };
         
      //init s
/*      
		function initMap() {
    	var fenway = {lat: 18.4897587, lng: 73.82029620000003};
        var map = new google.maps.Map(document.getElementById('map'), {
            center: fenway,
            zoom: 16,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        });

        var infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
        var geocoder = new google.maps.Geocoder;

		geocoder.geocode({'location': fenway}, function(results, status) {
    		if (status === google.maps.GeocoderStatus.OK) {
	      		if (results[0]) {
    	      		var marker = new google.maps.Marker({
        	      		map: map,
            	  		draggable: true,
              			animation: google.maps.Animation.DROP,
              			position: fenway,
              			title: 'Google '
            		});
	      			var title = marker.getTitle();
    		      		google.maps.event.addListener(marker, 'click', function() {          		
            			infowindow.setContent('<div><strong>' + marker.getTitle() + '</strong><br>' +
                		'Place ID: ' + results[0].place_id + '<br>' +'Address: '+ results[0].formatted_address + '</div>');
              			infowindow.open(map, this);
            		});
	      		} else {
        			window.alert('No results found');
      			}
    		} else {
      			window.alert('Geocoder failed due to: ' + status);
    		}
	  	});

	}
 */        
        //init e
    </script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCy0y-BGBgl6fjl1zDhcBpgHHo6ZR6PXvY&libraries=places&callback=initMap"></script>


