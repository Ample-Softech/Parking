<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Place details</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
        <jsp:include page="/link.jsp" />
    <style>
            
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
        
      }
    </style>
    <script>
    function initMap() {
    	var fenway = {lat: ${latitude}, lng: ${longitude}};
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

/*         
		var weatherLayer = new google.maps.weather.WeatherLayer({
			temperatuerUnits: google.maps.weather.TemperatuerUnits.CELSIUS
		});
		weatherLayer.setMap(map);
		
		var cloudLayer = google.maps.weather.CloudLayer();
		cloudLayer.setMap(map);
 */
		
/* 		var panorama = new google.maps.StreetViewPanorama(
	            document.getElementById('pano'), {
	              position: fenway,
	              addressControlOptions: {
	                position: google.maps.ControlPosition.BOTTOM_CENTER
	              },
	              linksControl: true,
	              panControl: true,
	              enableCloseButton: true
	        });
 */
	}
    </script>
  </head>
  <body>
  	<jsp:include page="/mainMenu.jsp" />
	
	<div id="map"></div>
	
	<!-- <div id="pano"></div>	 -->	
		<jsp:include page="/spacesList.jsp" />
	
	<jsp:include page="/footer.jsp" />
	
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCy0y-BGBgl6fjl1zDhcBpgHHo6ZR6PXvY&libraries=places&callback=initMap"></script>
  </body>
</html>