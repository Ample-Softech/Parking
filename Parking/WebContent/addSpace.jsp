<!--  -->                
<div class="container register">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
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
						<button id="find" class="btn btn-success btn-block btn-lg"> Find </button>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
					<hr>
					</div>
				</div>				

				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                    	    <input type="text" name="lat" id="lat" class="form-control input-lg" placeholder=" Latitude " tabindex="1">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                        	<input type="text" name="lng" id="lng" class="form-control input-lg" placeholder=" Longitude " tabindex="1">
						</div>
					</div>										
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
					<hr>
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
						<input type="submit" value="Next" class="btn btn-primary btn-block btn-lg" tabindex="7">
					</div>
		<!-- id="activate-step-3" -->
					<div class="col-xs-12 col-md-6">
						<a href="#" id="activate-step-4" class="btn btn-success btn-block btn-lg"> Skip </a>
					</div>
				</div>
		</div>
	</div>
</div>

<!--  -->

<script type="text/javascript">
$(document).ready(function() {    		
		$("#find").click(function() {
		    var geocoder = new google.maps.Geocoder();
		    var pincode = $("#pincode").val();
            geocoder.geocode({ 'address': pincode }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    $("#lat").val(latitude);
                    $("#lng").val(longitude);
                } else {
                    alert("Request failed.");
                }
            });
		});
});
</script>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
