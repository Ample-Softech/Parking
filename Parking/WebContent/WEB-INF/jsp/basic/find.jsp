<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Place details</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
        <jsp:include page="/link.jsp" />
	    <link rel="stylesheet" href='<c:url value="/css/findMap.css"></c:url>'  />
    
    <script>
    function initMap() {
    	var fenway = {lat: ${latitude}, lng: ${longitude} };
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
		
/* 		
		var panorama = new google.maps.StreetViewPanorama(
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

<div class="container pana">
	<div class="box">
  		<div class="container-fluid navbar2">
    		<div class="header">
      			<label class="brand" >${loc }</label>
    		</div>
  		</div>
	</div>

	<div class="row contentList">
		<div class="container">
			<c:forEach var="p" items="${parking }" varStatus="status">
		
			<div class="row">
          		<div class="col-xs-6 col-sm-2 col-md-2">
              		<a href="/Parking/Check.basic?loc=${p.area }&lat=${p.latitude }&lng=${p.longitude }">
                   		<img src="${p.image }" class="img-responsive img-box img-thumbnail"  /> 
                  	</a>
             	</div>
          		<div class="col-xs-6 col-sm-10 col-md-10">
              		<div class="list-group">
                   		<div class="list-group-item">
                       		<div class="row-content">
                          		<div class="list-group-item-heading">
                              		<a href="/Parking/Check.basic?loc=${p.area }&lat=${p.latitude }&lng=${p.longitude }" title="sintret">
                                   		<small>${p.area }</small>
                                	</a>
                    			</div>
                            	<small>
                              	<i class="glyphicon glyphicon-time"></i> ${p.latitude } <span class="twitter"> <i class="fa fa-twitter"></i> <a target="_blank" href="https://twitter.com/sintret" alt="sintret" title="sintret">${p.city }</a></span>
                              	<br>
                           		<span class="explore"><i class="glyphicon glyphicon-th"></i> <a href="#">${p.longitude } </a></span>
                                </small>
                        	</div>
                     	</div>
                  	</div>
     	            <a href="#" id="addClass" class="btn btn-success" >Book Now</a>
	          	</div>	
 	        </div>
          	<hr>      	
 	        </c:forEach>
		</div>
	</div>	
</div>
	
	<jsp:include page="/popup.jsp"></jsp:include>
	<jsp:include page="/Payment.jsp"></jsp:include>
  	<jsp:include page="/footer.jsp" />
	
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQ5r7UKO1smUmapgSi3dLV9MWkbFMi45M&libraries=places&callback=initMap"></script>

  </body>
</html>