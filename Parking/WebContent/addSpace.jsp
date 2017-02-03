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
						<button id="find" onclick="GetLocation()" class="btn btn-success btn-block btn-lg"> Find </button>
					</div>
				</div>
		</div>
	</div>
</div>

				<div id="map"></div>

<div class="container register">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" class="form" >
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<h2 style="display: none;" name="lat" id="lat" class="form-control input-lg" placeholder=" Latitude " tabindex="1">Latitude</h2>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<h2 style="display: none;" name="lng" id="lng" class="form-control input-lg" placeholder=" Longitude " tabindex="1">Longitude</h2>
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

	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCy0y-BGBgl6fjl1zDhcBpgHHo6ZR6PXvY&libraries=places&callback=initMap"></script>
	<script src="js/jquery/addSpace.js" type="text/javascript"></script>
