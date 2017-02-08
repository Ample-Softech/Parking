	function getLocation() {
    	var geocoder = new google.maps.Geocoder();
    	var address = document.forms["myForm"]["pincode"].value;
    	geocoder.geocode({ 'address': address }, function (results, status) {
        	if (status == google.maps.GeocoderStatus.OK) {
            	var latitude = results[0].geometry.location.lat();
            	var longitude = results[0].geometry.location.lng();
            	document.getElementById("latitude").value = latitude;
            	document.getElementById("longitude").value = longitude;
//  			alert("address: "+address+"\nLatitude: " + latitude + "\nLongitude: " + longitude);
//       		window.location = "/Parking/reg.basic?latitude=" + latitude + "&longitude=" + longitude;
  				return true;
        	} else {
            	alert("Request failed.");
            	return false;
        	}
    	});
	}  
