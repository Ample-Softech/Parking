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
						<a class="imglinks" href="/Parking/Check.basic?loc=Pune Railway Station, Pune, Maharashtra, India&lat=18.52882319999999&lng=73.87448569999992">
						<img class="img-responsive img-thumbnail img" src="images/Pune_railway_station.jpg" alt="Pune_railway_station" data-toggle="popover"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Pune Railway Station, Pune, Maharashtra, India&lat=18.52882319999999&lng=73.87448569999992">Pune Railway Station</a>
       	 				</div>	
					</div>
				</div>
<!-- 	  loc= Pune Municipal Corporation, Pune, Maharashtra, India, lat= 18.5240707, lng= 73.85317980000002
 -->	
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=PCMC Office, Kharalwadi, Pimpri-Chinchwad, Maharashtra, India&lat=18.628487&lng=73.80465270000002">
							<img class="img-responsive img-thumbnail img" src="images/pcmc_pune.jpg" alt="pcmc_pune"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=PCMC Office, Kharalwadi, Pimpri-Chinchwad, Maharashtra, India&lat=18.628487&lng=73.80465270000002"> Pimpari (PCMC Office) </a>
        				</div>	
        			</div>
				</div>
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Hinjawadi, Pune, Maharashtra, India&lat=18.597059&lng=73.71882329999994">
							<img class="img-responsive img-thumbnail img" src="images/hinjawadi_pune.jpg" alt="hinjawadi_pune"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Hinjawadi, Pune, Maharashtra, India&lat=18.597059&lng=73.71882329999994">Hinjawadi, Pune</a>
        				</div>	
        			</div>
				</div>
				
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Aundh, Pune, Maharashtra, India&lat=18.558007&lng=73.80752009999992">
							<img class="img-responsive img-thumbnail img" src="images/aundh_pune.jpeg" alt="aundh_pune"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Aundh, Pune, Maharashtra, India&lat=18.558007&lng=73.80752009999992">Aundh, Pune</a>
        				</div>	
					</div>
				</div>
			</div>

			<div class="row">					
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
						<a class="imglinks" href="/Parking/Check.basic?loc=Viman Nagar, Pune, Maharashtra, India&lat=18.567929&lng=73.91431790000001">
						<img class="img-responsive img-thumbnail img" src="images/viman_pune.jpg" alt="viman_pune"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Viman Nagar, Pune, Maharashtra, India&lat=18.567929&lng=73.91431790000001">Viman Nagar</a>
        				</div>	
					</div>
				</div>		
		
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Katraj, Pune, Maharashtra, India&lat=18.4575324&lng=73.86774639999999">
						<img class="img-responsive img-thumbnail img" src="images/katraj_pune.jpg" alt="katraj_pune"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Katraj, Pune, Maharashtra, India&lat=18.4575324&lng=73.86774639999999">Katraj, Pune</a>
        				</div>	
       	 			</div>
				</div>
		
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Hadapsar, Pune, Maharashtra, India&lat=18.5089197&lng=73.92602609999994">
						<img class="img-responsive img-thumbnail img" src="images/hadpasar_pune.jpg" alt="hadpasar_pune"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Hadapsar, Pune, Maharashtra, India&lat=18.5089197&lng=73.92602609999994">Hadapsar, Pune</a>
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