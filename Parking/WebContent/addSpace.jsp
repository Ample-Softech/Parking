<!--  -->                
<div class="container register">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="/Parking/regCode.basic" method="post" name="form">
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
						<button onclick="getLocation()" class="btn btn-success btn-block btn-lg"> Find </button>
					</div>
					
				</div>
				
				<div class="row" >
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
<script language="javascript">
function getLocation(){
	var zip = document.form.pincode.value;
  getAddressInfoByZip(zip); 
}

function response(obj){
  console.log(obj);
}
function getAddressInfoByZip(zip){
  if(zip.length >= 5 && typeof google != 'undefined'){
    var addr = {};
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': zip }, function(results, status){
      if (status == google.maps.GeocoderStatus.OK){
        if (results.length >= 1) {
	  for (var ii = 0; ii < results[0].address_components.length; ii++){
	    var street_number = route = street = city = state = zipcode = country = formatted_address = '';
	    var types = results[0].address_components[ii].types.join(",");
	    if (types == "street_number"){
	      addr.street_number = results[0].address_components[ii].long_name;
	    }
	    if (types == "route" || types == "point_of_interest,establishment"){
	      addr.route = results[0].address_components[ii].long_name;
	    }
	    if (types == "sublocality,political" || types == "locality,political" || types == "neighborhood,political" || types == "administrative_area_level_3,political"){
	      addr.city = (city == '' || types == "locality,political") ? results[0].address_components[ii].long_name : city;
	    }
	    if (types == "administrative_area_level_1,political"){
	      addr.state = results[0].address_components[ii].short_name;
	    }
	    if (types == "postal_code" || types == "postal_code_prefix,postal_code"){
	      addr.zipcode = results[0].address_components[ii].long_name;
	    }
	    if (types == "country,political"){
	      addr.country = results[0].address_components[ii].long_name;
	    }
	  }
	  addr.success = true;
	  for (name in addr){
		  alert("Done " + name + ': ' + addr[name]);
//		  console.log('### google maps api ### ' + name + ': ' + addr[name]);
	  }
	  response(addr);
        } else {
          response({success:false});
        }
      } else {
        response({success:false});
      }
    });
  } else {
    response({success:false});
  }
}
</script>