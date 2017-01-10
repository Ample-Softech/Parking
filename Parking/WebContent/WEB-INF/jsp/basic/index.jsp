<%@page language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	       		//	       	  	alert(place.geometry.location.lat()+"  "+place.geometry.location.lng());	       		
			}
		</script>
		
	</head>
	<body>
		<!-- MENU BAR -->
		<jsp:include page="/mainMenu.jsp" />		
		<!-- CONTENT -->
			<div class="container" >
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 jumbotron searchbar" style="padding: 15px;">
						<div class="input-group" align="center">
				        	<input type="text" class="form-control" name="searchPlace" id="searchPlace" required="required"  />
				        	<span class="input-group-btn">
				       			<button type="submit" class="btn btn-success" id="searchBtn"> <b>Search</b></button>
				        	</span>      
				     	</div>
					</div>
				</div>
			</div>
			
		<div class="container">
			<br><br><br><br><br><br><br><br><br><br><br><br>
		</div>		
				
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Kothrud, Pune, Maharashtra&lat=18.5073985&lng=73.80765040000006">
							<img src="images/kothrud.jpg" alt="Kothrud" style="width:100%"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Kothrud, Pune, Maharashtra&lat=18.5073985&lng=73.80765040000006" style="color:white;"><p>Kothrud, Pune</p></a>
        				</div>	
					</div>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Karve Nagar, Pune, Maharashtra&lat=18.4897587&lng=73.82029620000003">
						<img src="images/karvenagar.jpg" alt="Karvenagar" style="width:100%"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Karve Nagar, Pune, Maharashtra&lat=18.4897587&lng=73.82029620000003" style="color:white;"><p>Karvenagar, Pune</p></a>
       	 				</div>	
					</div>
				</div>
	
	
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Chinchwad, Maharashtra&lat=18.6297811&lng=73.79970939999998">
						<img src="images/chinchwa.jpg" alt="Chinchwad" style="width:100%"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Chinchwad, Maharashtra&lat=18.6297811&lng=73.79970939999998" style="color:white;"><p>Chinchwad, Pune</p></a>
        				</div>	
					</div>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Deccan Gymkhana, Pune, Maharashtra&lat=18.5175566&lng=73.84166000000005"><img src="images/deccan.jpg" alt="Deccan" style="width:100%"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Deccan Gymkhana, Pune, Maharashtra&lat=18.5175566&lng=73.84166000000005" style="color:white;"><p>Deccan-Gymkhana, Pune</p></a>
        				</div>	
					</div>
				</div>
								
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Sadashiv Peth, Pune, Maharashtra&lat=18.5083218&lng=73.84656480000001">
							<img src="images/sadashiv.jpg" alt="Sadashiv Peth" style="width:100%"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Sadashiv Peth, Pune, Maharashtra&lat=18.5083218&lng=73.84656480000001" style="color:white;"><p>Sadashiv Peth, Pune</p></a>
        				</div>	
        			</div>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Senapati Bapat Road, Sheti Mahamandal, 30, Laxmi Society, Pune, Maharashtra&lat=18.5316664&lng=73.83010739999997">
							<img src="images/SB.jpg" alt="SB Road" style="width:100%"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Senapati Bapat Road, Sheti Mahamandal, 30, Laxmi Society, Pune, Maharashtra&lat=18.5316664&lng=73.83010739999997" style="color:white;"><p>Senapati Bapat Road, Pune</p></a>
        				</div>	
        			</div>
				</div>
		
		
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Shaniwar Peth, Pune, Maharashtra&lat=18.5194431&lng=73.85193559999993"><img src="images/shaniwar peth.jpg" alt="Shaniwar Peth" style="width:100%"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Shaniwar Peth, Pune, Maharashtra&lat=18.5194431&lng=73.85193559999993" style="color:white;"><p>Shaniwar Peth, Pune</p></a>
        				</div>	
       	 			</div>
				</div>
		
		
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<a class="imglinks" href="/Parking/Check.basic?loc=Sinhagad Road, Amarendra Society, Bank Of India Colony, Pune, Maharashtra&lat=18.4571738&lng=73.80336820000002"><img src="images/sinhgad.jpg" alt="Sinhgad Road" style="width:100%"></a>
        				<div class="caption" style="color: white;">
          					<a class="imglinks" href="/Parking/Check.basic?loc=Sinhagad Road, Amarendra Society, Bank Of India Colony, Pune, Maharashtra&lat=18.4571738&lng=73.80336820000002" style="color:white;"><p>Sinhgad Road, Pune</p></a>
       	 				</div>	
        			</div>
				</div>
			</div>
		</div>
		
		
		<!-- FOOTER -->
<!-- 		<div class="container-fluid"> -->
<!-- 			<div class="jumbotron" > -->
<!-- 					FOOTER HERE -->
<!-- 			</div> -->
<!-- 		</div> -->
	</body>
</html>