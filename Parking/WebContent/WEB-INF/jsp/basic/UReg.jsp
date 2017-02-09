<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>

<jsp:include page="/link.jsp" />

<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>

<style type="text/css">
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
</style>

<script type="text/javascript">
	function getLocation() {
    	var geocoder = new google.maps.Geocoder();
//    	var address = document.getElementById('pincode').value;
    	var address = document.forms["myForm"]["pincode"].value;
    	geocoder.geocode({ 'address': address }, function (results, status) {
        	if (status == google.maps.GeocoderStatus.OK) {
            	var latitude = results[0].geometry.location.lat();
            	var longitude = results[0].geometry.location.lng();
				document.getElementById("latitude").value = latitude;
				document.getElementById("longitude").value = longitude;
				document.getElementById("myForm").submit();
//	  			alert("address: "+address+"\nLatitude: " + latitude + "\nLongitude: " + longitude);
//				window.location = "/Parking/reg.basic?latitude=" + latitude + "&longitude=" + longitude;
  				return true;
        	} else {
            	alert("Request failed.");
            	return false;
        	}
    	});
	}
</script>
</head>
<body>

	<jsp:include page="/mainMenu.jsp" />

<form action="/Parking/reg.basic" method="post" id="myForm" name="myForm" onsubmit="return getLocation()">  
	<input type="hidden" name="latitude" id="latitude" />
	<input type="hidden" name="longitude" id="longitude" />
<div class="container register well">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<div class="text-center form">	
				<h2 >Please Sign Up <small>It's free and always will be.</small></h2>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
        	                <input type="text" name="fname" id="fname" class="form-control input-lg" placeholder="First Name" tabindex="1" required="required" />
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
           	            	<input type="text" required="required" name="mname" id="mname" class="form-control input-lg" placeholder="Middle Name" tabindex="1">
						</div>
					</div>
				
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" required="required" name="lname" id="lname" class="form-control input-lg" placeholder="Last Name" tabindex="2">
						</div>
					</div>
				</div>		
			
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group form-inline">
							<label for="gen form-control">Gender : </label>
							<div class="form-control gen">
								<input class="radio" type="radio" name="gender" value="male" />
								<label for="gender form-control">Male</label>
								<input class="radio"  type="radio" name="gender" value="female" />
								<label for="gender">Female</label>
							</div>
						</div>
					</div>
			
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<div class="input-group date" id="datetimepicker">
            	        		<input class="form-control input-lg" required="required" type="date" name="dob" id="dob" placeholder="DOB" />
        	            		<span class="input-group-addon add-on">
	               	         		<span class="glyphicon glyphicon-calendar"></span>               	         		
                	    		</span>
                			</div>
						</div>
					</div>
		<script>
         $(document).ready(function() {
        	    $('#dateRangePicker')
        	        .datepicker({
        	            format: 'mm/dd/yyyy',
        	            startDate: '01/01/2010',
        	            endDate: '12/30/2020'
        	        })
        	        .on('changeDate', function(e) {
        	            // Revalidate the date field
        	            $('#dateRangeForm').formValidation('revalidateField', 'date');
        	        });

        	    $('#dateRangeForm').formValidation({
        	        framework: 'bootstrap',
        	        icon: {
        	            valid: 'glyphicon glyphicon-ok',
        	            invalid: 'glyphicon glyphicon-remove',
        	            validating: 'glyphicon glyphicon-refresh'
        	        },
        	        fields: {
        	            date: {
        	                validators: {
        	                    notEmpty: {
        	                        message: 'The date is required'
        	                    },
        	                    date: {
        	                        format: 'MM/DD/YYYY',
        	                        min: '01/01/2010',
        	                        max: '12/30/2020',
        	                        message: 'The date is not a valid'
        	                    }
        	                }
        	            }
        	        }
        	    });
        	});
         </script>
				</div>
			
				<div class="form-group">
					<input type="email" name="username" required="required" id="username" class="form-control input-lg" placeholder="Email Address" tabindex="4">
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password" required="required" id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="6">
						</div>
					</div>
				</div>
			
				<div class="form-group">
					<input type="text" name="area" required="required" id="area" class="form-control input-lg" placeholder="Address" tabindex="4">
				</div>
			
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="city" id="city" required="required" class="form-control input-lg" placeholder="City" tabindex="5">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
						<input type="text" name="state" id="state" class="form-control input-lg" placeholder="State" required="required" tabindex="6">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="country" id="country" class="form-control input-lg" required="required" placeholder="Country" tabindex="5">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="pincode" id="pincode" class="form-control input-lg" required="required" placeholder="Pincode" tabindex="6" />
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-4 col-sm-3 col-md-3">
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info" tabindex="7">I Agree</button>
                    	<input type="checkbox" required="required" name="t_and_c" id="t_and_c" class="hidden" value="1">
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9">
					 By clicking <strong class="label label-primary">Register</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
				</div>
			</div>			

			<hr class="colorgraph">

			<div class="row">
				<div class="col-xs-12 col-md-6">
					<button id="Register" onclick="getLocation()" class="btn btn-primary btn-block btn-lg"> Register </button>
				</div>
				<div class="col-xs-12 col-md-6">
					<a href="/Parking/LoginPage.basic" class="btn btn-success btn-block btn-lg">Sign In</a>
				</div>
			</div>
    		</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
				</div>
				<div class="modal-body">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

</div>
</form>
<!-- End register  -->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>