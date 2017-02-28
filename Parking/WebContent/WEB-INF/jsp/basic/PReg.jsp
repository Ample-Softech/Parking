<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Parking Register</title>
<jsp:include page="/link.jsp" />

<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
<style type="text/css">

      /* Optional: Makes the sample page fill the window. */
      
      #map {
 		height: 250px;
        width: 1170px;
        margin-left: 90px;
        margin-top: -3%;
		margin-bottom: -0.5%;
      }
      
        /* Register(Page) : Credit to bootsnipp.com for the css for the color graph */
.colorgraph {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}

.prfind {
}

.prinfo {
}

.well {
	
}

</style>

</head>
<body>
<jsp:include page="/mainMenu.jsp" />

<!--  -->

<div class="container register  well prfind">
	<div class="row">
    	<div class=" text-center  col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<h2 > Parkink-Space <small> Please Provide Space for Parking. </small></h2>
				<hr class="colorgraph">
				<div class="row">
					<div class=" form col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                    	    <input type="text" required="required" name="street" id="street" class="form-control input-lg" placeholder=" Street/Area " tabindex="1">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                        	<input type="text" required="required" name="city1" id="city1" class="form-control input-lg" placeholder=" Town/City " tabindex="1">
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" required="required" name="pin" id="pin" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
						</div>
					</div>				

					<div class="col-xs-6 col-md-6">
						<button id="find" onclick="GetLocation()" class="btn btn-success btn-block btn-lg"> Find </button>
					</div>
				</div>
		</div>
	</div>
</div>


				<div id="map"></div>


<div class="container register well prinfo">
	<div class="row">
    	<div class="  text-center col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" class="form" method="post" action="/Parking/psReg.basic">
					<input type="hidden" required="required" name="area" id="area" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
					<input type="hidden" required="required" name="city" id="city" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
					<input type="hidden" required="required" name="pincode" id="pincode" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="hidden" required="required" name="latitude" id="latitude" class="form-control input-lg" placeholder=" Latitude " tabindex="2">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="hidden" required="required" name="longitude" id="longitude" class="form-control input-lg" placeholder=" Logitude " tabindex="2">
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
						<a href="/Parking/home.basic" class="btn btn-success btn-block btn-lg"> Skip </a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--  -->

<jsp:include page="/footer.jsp"></jsp:include>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCy0y-BGBgl6fjl1zDhcBpgHHo6ZR6PXvY&libraries=places&callback=initMap"></script>
<script type="text/javascript">
function GetLocation() {
    var geocoder = new google.maps.Geocoder();
    //var address = document.form.pincode.value; 
    var address = document.getElementById("pin").value;
    var city1 = document.getElementById("city1").value;
    var street = document.getElementById("street").value;

    var lat = document.getElementById("latitude");
    var lng = document.getElementById("longitude");
    var area = document.getElementById("area");
    var city = document.getElementById("city");
    var pincode = document.getElementById("pincode");

    if(street=="" || street!=(street.split(' ').join('+'))){
//		document.getElementById("errorMessage").innerHTML="username Field should not be blank or with spaces..";
//		window.alert("username Field should not be blank or with spaces..");
		document.getElementById("street").focus();
		return false;
	}
    
    if(city1=="" || city1!=(city1.split(' ').join('+'))){
//		document.getElementById("errorMessage").innerHTML="username Field should not be blank or with spaces..";
//		window.alert("username Field should not be blank or with spaces..");
		document.getElementById("city1").focus();
		return false;
	}
    
    if(address=="" || address!=(address.split(' ').join('+'))){
//		document.getElementById("errorMessage").innerHTML="username Field should not be blank or with spaces..";
//		window.alert("username Field should not be blank or with spaces..");
		document.getElementById("pin").focus();
		return false;
	}
    
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var latitude = results[0].geometry.location.lat();
            var longitude = results[0].geometry.location.lng();
            lat.value = latitude;
            lng.value = longitude;
            area.value = street;
            city.value = city1;
            pincode.value = address;
//            alert("address: "+address+"\nLatitude: " + latitude + "\nLongitude: " + longitude);
//       		window.location = "/Parking/Checkpin.basic?loc="+address+"&lat=" + latitude + "&lng=" + longitude;

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


</script>
</body>
</html>