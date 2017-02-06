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
				<form role="form" class="form" method="post" action="/Parking/psReg.basic" >
					<input type="hidden" required="required" name="area" id="area" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
					<input type="hidden" required="required" name="city" id="city" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
					<input type="hidden" required="required" name="pincode" id="pincode" class="form-control input-lg" placeholder=" Pincode " tabindex="2">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" required="required" name="lat" id="lat" class="form-control input-lg" placeholder=" Latitude " tabindex="2">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" required="required" name="lng" id="lng" class="form-control input-lg" placeholder=" Logitude " tabindex="2">
						</div>
					</div>										
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12" ">
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
						<a href="#" class="btn btn-success btn-block btn-lg"> Skip </a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--  -->

<jsp:include page="/footer.jsp"></jsp:include>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCy0y-BGBgl6fjl1zDhcBpgHHo6ZR6PXvY&libraries=places&callback=initMap"></script>
	<script src="js/jquery/addSpace.js" type="text/javascript"></script>

</body>
</html>