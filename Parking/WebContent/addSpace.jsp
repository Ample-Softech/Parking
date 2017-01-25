<!--  -->                
        
<div class="container register">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" name="form"  onsubmit='return(GetLocation())'>
				<h2 > Parkink-Space <small>Please Provide Space for Parking.</small></h2>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                    	    <input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder=" Street/Area " tabindex="1">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                        	<input type="text" name="middle_name" id="middle_name" class="form-control input-lg" placeholder=" Town/City " tabindex="1">
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="pincode" id="pincode" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
						</div>
					</div>				

					<div class="col-xs-6 col-md-6">
						<button  class="btn btn-success btn-block btn-lg"> Find </button>
					</div>
					
				</div>
				
				<div class="row mapGr" >
					<div class="form-group">
						<div id="map"></div>
					</div>
				</div>
				
				<hr class="colorgraph">
				
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input id="activate-step-3" type="submit" value="Next" class="btn btn-primary btn-block btn-lg" tabindex="7">
					</div>
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
            var address = document.form.pincode.value; // document.getElementById("pincode").value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    alert("address: "+address+"\nLatitude: " + latitude + "\nLongitude: " + longitude);
                    
/*             var fenway = {lat: latitude, lng: longitude};
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
