<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Home Page</title>
		
		<jsp:include page="/link.jsp" />
		
		<script type="text/javascript">
			$(document).ready(function() {    		
   		 		$("#searchPlace").click(function(){
   		 			var options = {
						  componentRestrictions: {country: "ind"}
   		 			};
    				autocomplete = new google.maps.places.Autocomplete(document.getElementById('searchPlace'),options);
	   				autocomplete.addListener('place_changed', fillInAddress);
    			});
   			});
						
			function fillInAddress() {
		        //Get the place details from the autocomplete object.
				var place = autocomplete.getPlace();
		        var loc = document.getElementById('searchPlace').value;
		       	var lat = place.geometry.location.lat(), lng = place.geometry.location.lng();	       	
	       		window.location = "/Parking/Check.basic?loc="+loc+"&lat=" + lat + "&lng=" + lng;
	       	//	alert(place.geometry.location.lat()+"  "+place.geometry.location.lng());	       		
			}

			$(document).ready(function(){
				$(".cards").hover3d({
					selector: ".cardImg",
					/* shine: true, */
					sensitivity: 7,
				});				
			});
			
		</script>
		<style type="text/css">
      		/* Optional: Makes the sample page fill the window. */
      		html, body {
       	 		height: 100%;
        		margin: 0;
        		padding: 0;
      		}		
		 .searchbar {background: rgba(220, 220, 220, 0.5);}
      		
		</style>
		
		
	</head>
	<body id="page_effect">

		<!-- MENU BAR -->
		<jsp:include page="/mainMenu.jsp" />		

		<!-- CONTENT -->
			<div class="container searchField">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 jumbotron searchbar" style="padding: 15px;">
						<div class="input-group" align="center">
				        	<input type="text" class="form-control" name="searchPlace" id="searchPlace" required="required" />
				        	<span class="input-group-btn">
				       			<button type="submit" class="btn btn-success" id="searchBtn"><b>Search</b></button>
				        	</span>      
				     	</div>
					</div>
				</div>
			</div>
			
				
		<div class="container img-temp">
			<div class="row img-rows">
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Kothrud, Pune, Maharashtra&lat=18.5073985&lng=73.80765040000006">
							<img class="img-thumbnail img" src="images/kothrud.jpg" alt="Kothrud"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Kothrud, Pune, Maharashtra&lat=18.5073985&lng=73.80765040000006">Kothrud, Pune</a>
        				</div>	
					</div>
				</div>
				
				
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Karve Nagar, Pune, Maharashtra&lat=18.4897587&lng=73.82029620000003">
						<img class="img-responsive img-thumbnail img" src="images/karvenagar.jpg" alt="Karvenagar" data-toggle="popover"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Karve Nagar, Pune, Maharashtra&lat=18.4897587&lng=73.82029620000003">Karvenagar, Pune</a>
       	 				</div>	
					</div>
				</div>
	
	
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Chinchwad, Maharashtra&lat=18.6297811&lng=73.79970939999998">
						<img class="img-responsive img-thumbnail img" src="images/chinchwa.jpg" alt="Chinchwad"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Chinchwad, Maharashtra&lat=18.6297811&lng=73.79970939999998">Chinchwad, Pune</a>
        				</div>	
					</div>
				</div>
				
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Deccan Gymkhana, Pune, Maharashtra&lat=18.5175566&lng=73.84166000000005">
							<img class="img-responsive img-thumbnail img" src="images/deccan.jpg" alt="Deccan"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Deccan Gymkhana, Pune, Maharashtra&lat=18.5175566&lng=73.84166000000005">Deccan-Gymkhana, Pune</a>
        				</div>	
					</div>
				</div>
			</div>

			<div class="row">					
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Sadashiv Peth, Pune, Maharashtra&lat=18.5083218&lng=73.84656480000001">
							<img class="img-responsive img-thumbnail img" src="images/sadashiv.jpg" alt="Sadashiv Peth"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Sadashiv Peth, Pune, Maharashtra&lat=18.5083218&lng=73.84656480000001">Sadashiv Peth, Pune</a>
        				</div>	
        			</div>
				</div>
				
				
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Senapati Bapat Road, Sheti Mahamandal, 30, Laxmi Society, Pune, Maharashtra&lat=18.5316664&lng=73.83010739999997">
							<img class="img-responsive img-thumbnail img" src="images/SB.jpg" alt="SB Road"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Senapati Bapat Road, Sheti Mahamandal, 30, Laxmi Society, Pune, Maharashtra&lat=18.5316664&lng=73.83010739999997">SB Road, Pune</a>
        				</div>	
        			</div>
				</div>
		
		
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Shaniwar Peth, Pune, Maharashtra&lat=18.5194431&lng=73.85193559999993">
						<img class="img-responsive img-thumbnail img" src="images/shaniwar peth.jpg" alt="Shaniwar Peth"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Shaniwar Peth, Pune, Maharashtra&lat=18.5194431&lng=73.85193559999993">Shaniwar Peth, Pune</a>
        				</div>	
       	 			</div>
				</div>
		
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Sinhagad Road, Amarendra Society, Bank Of India Colony, Pune, Maharashtra&lat=18.4571738&lng=73.80336820000002">
						<img class="img-responsive img-thumbnail img" src="images/sinhgad.jpg" alt="Sinhgad Road"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Sinhagad Road, Amarendra Society, Bank Of India Colony, Pune, Maharashtra&lat=18.4571738&lng=73.80336820000002">Sinhgad Road, Pune</a>
       	 				</div>	
        			</div>
				</div>
			</div>
		</div>
		
		<jsp:include page="/footer.jsp" />
<!-- 		
		FOOTER
 		<div class="container-fluid"> 
 			<div class="jumbotron" > 
 					FOOTER HERE
 			</div> 
 		</div> 

 -->
	</body>
</html>