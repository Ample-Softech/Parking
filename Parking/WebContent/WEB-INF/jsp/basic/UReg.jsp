<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>User Registration</title>
	
	<jsp:include page="/link.jsp" />
	
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

 .well {background: rgba(220, 220, 220, 0.7);}
 
</style>

</head>
<body>
<%
	if(!(session.isNew() || (session.getAttribute("userLog")!="login"))) {
		response.sendRedirect("/Parking/SignOut.basic");
	} 
%>
	<jsp:include page="/mainMenu.jsp" />
<br>
<form action="/Parking/UserReg.basic" method="post" id="myForm" name="myForm" onsubmit="return getLocationValid()">
	<input type="hidden" name="usertype" id="usertype" value="user" />
<div class="container register well">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<div class="text-center form">	
				<h2 >Please Sign Up <small>It's free and always will be.</small></h2>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
        	                <input type="text" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="fname" id="fname" class="form-control input-lg" placeholder="First Name" tabindex="1" required="required" />
						</div>
					</div>					
				
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" pattern="[a-zA-Z][a-zA-Z0-9\s]*" required="required" name="lname" id="lname" class="form-control input-lg" placeholder="Last Name" tabindex="2">
						</div>
					</div>
				</div>		
			
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group form-inline">
							<label for="gen form-control">Gender : </label>
							<div class="form-control gen">
								<input class="radio" type="radio" id="gender" name="gender" value="Male" />
								<label for="gender form-control">Male</label>
								<input class="radio"  type="radio" id="gender" name="gender" value="Female" />
								<label for="gender">Female</label>
							</div>
						</div>
					</div>
			
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<div class="input-group date" id="datetimepicker">
            	        		<input class="form-control input-lg" name="dob" id="dob" required="required" type="date" placeholder="DOB" />
        	            		<span class="input-group-addon add-on">
	               	         		<span class="glyphicon glyphicon-calendar"></span>
                	    		</span>
                			</div>
						</div>
					</div>
				</div>
			
				<div class="form-group">
					<input type="email" name="username" required="required" id="username" class="form-control input-lg" placeholder="Email Address" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" tabindex="4">
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" pattern="[a-zA-Z][a-zA-Z0-9\s]*{3}" name="password" required="required" id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" pattern="[a-zA-Z][a-zA-Z0-9\s]*{3}" name="passconf" required="required" id="passconf" class="form-control input-lg" placeholder="Confirm Password" tabindex="6">
						</div>
					</div>
				</div>
			
				<div class="form-group">
					<input type="text" name="area" required="required" pattern="[a-zA-Z][a-zA-Z0-9\s]*" id="area" class="form-control input-lg" placeholder="Street" tabindex="4">
				</div>
			
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="city" id="city" required="required" class="form-control input-lg" placeholder="City" tabindex="5">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
						<input type="text" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="state" id="state" class="form-control input-lg" placeholder="State" required="required" tabindex="6">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" pattern="[a-zA-Z][a-zA-Z0-9\s]*" name="country" id="country" class="form-control input-lg" required="required" placeholder="Country" tabindex="5">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" pattern="[0-9]{6}" name="pincode" id="pincode" class="form-control input-lg" required="required" placeholder="Pincode" tabindex="6" />
						<input type="hidden" required="required" name="latitude" id="latitude" />
						<input type="hidden" required="required" name="longitude" id="longitude" />
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-4 col-sm-3 col-md-3">
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info" tabindex="7">I Agree</button>
                    	<input type="checkbox" required="required" name="tac" id="tac" class="hidden" value="one" />
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9">
					 By clicking <strong class="label label-primary">Register</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
				</div>
			</div>			

			<hr class="colorgraph">

			<div class="row">
				<div class="col-xs-12 col-md-6">
					<button id="Register" type="submit" class="btn btn-primary btn-block btn-lg"> Register </button>
				</div>
				<div class="col-xs-12 col-md-6">
					<a href="/Parking/LoginPage.basic" class="btn btn-success btn-block btn-lg"> Sign In </a>
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
<script type="text/javascript">
function getLocationValid() {
	var pass1 = document.myForm.password.value;
	var pass2 = document.myForm.passconf.value;
	var gender = document.myForm.gender.value;
	var address = document.myForm.pincode.value;
	var tc = document.myForm.tac.value;
	var psj = pass1.split(' ').join('+');
	var pcsj = pass2.split(' ').join('+');
	var gsj = gender.split(' ').join('+');
	var asj = address.split(' ').join('+');
    if(gender=="" || gender!=gsj){
		window.alert("Gender Field should not be blank..!");
    	document.getElementById("gender").focus();
		return false;
	}

	if(pass1=="" || psj!=pass1 || pass2=="" || pcsj!=pass2) {
		window.alert("Password Field should not be blank or Spaces..");
		document.myForm.password.focus();
		return false;
	} else {
		if(psj.length<2){
			window.alert("Password Size atleast 2..");
			document.myForm.password.focus();
			return false;
		} else {
			if((psj!=pcsj)||(pass1!=pass2)){
				window.alert("Password & Re-enter Password Both are not matched..!");
				document.myForm.password.focus();
				return false;
			}
		}
	}
    if(tc!="one"){
		window.alert("T&C not Check..!");
    	document.getElementById("t&c").focus();
		return false;
	}

	//GeoLocation
	if(address!="" && address!=asj){
		window.alert("Pincode Invalid..!");
		document.getElementById("pincode").focus();    		
		return false;
	} else {
		var geocoder = new google.maps.Geocoder();
    	geocoder.geocode({'address': address }, function (results, status) {
        	if (status == google.maps.GeocoderStatus.OK) {
            	latitude = results[0].geometry.location.lat();
            	longitude = results[0].geometry.location.lng();
				document.getElementById("latitude").value = latitude;
				document.getElementById("longitude").value = longitude;
				document.getElementById("myForm").submit();
        	} else {
            	alert("GeoLocation Request failed.");
            	return false;
        	}
    	});        	
	}    	
}
</script>

</form>
<!-- End register  -->

	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>