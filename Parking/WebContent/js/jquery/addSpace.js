        function GetLocation() {
            var geocoder = new google.maps.Geocoder();
            //var address = document.form.pincode.value; 
            var address = document.getElementById("pin").value;
            var city1 = document.getElementById("city1").value;
            var street = document.getElementById("street").value;

            var lat = document.getElementById("lat");
            var lng = document.getElementById("lng");
            var area = document.getElementById("area");
            var city = document.getElementById("city");
            var pincode = document.getElementById("pincode");
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    lat.value = latitude;
                    lng.value = longitude;
                    area.value = street;
                    city.value = city1;
                    pincode.value = address;
 //                 alert("address: "+address+"\nLatitude: " + latitude + "\nLongitude: " + longitude);
//    	       		window.location = "/Parking/Checkpin.basic?loc="+address+"&lat=" + latitude + "&lng=" + longitude;

			        var fenway = {lat: latitude, lng: longitude};
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

                } else {
                    alert("Request failed.");
                }
            });
        };  
        
        //init s
        		function initMap() {
            	var fenway = {lat: 18.5204303, lng: 73.85674369999992};
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
/*            	      		var marker = new google.maps.Marker({
                	      		map: map,
                    	  		draggable: true,
                      			animation: google.maps.Animation.DROP,
                      			position: fenway,
                      			title: 'Google '
                    		});
*/        	      			var title = marker.getTitle();
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
                //init e
