			$(document).ready(function(){    		
	    		$("#searchPlace").click(function(){
	    		
	    			var options = {
   					  componentRestrictions: {country: "ind"}
   					 };
	    			autocomplete = new google.maps.places.Autocomplete(document.getElementById('searchPlace'),options);
	    			autocomplete.addListener('place_changed', fillInAddress);
	    		});
	   		});
							
			function fillInAddress() {
		          // Get the place details from the autocomplete object.
		    	var place = autocomplete.getPlace();
 		       		document.getElementById('lat').innerHTML=place.geometry.location.lat();
		       		document.getElementById('lng').innerHTML=place.geometry.location.lng();
		            alert(place.geometry.location.lat()+"  "+place.geometry.location.lng());
 		          
 	 	          Demo = {
	 	                  lat: place.geometry.location.lat(),
	 	                  lng: place.geometry.location.lng()
	 	                };
		        }
