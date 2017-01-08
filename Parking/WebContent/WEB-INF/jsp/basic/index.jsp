<%@page language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Home Page</title>		
		<jsp:include page="/link.jsp" />
		<script type="text/javascript" src="js/jquery/index.js" ></script>		
	</head>
	<body>
	
		<!-- MENU BAR -->
		<jsp:include page="/mainMenu.jsp" />		
		
		<!-- CONTENT -->
		<form action="/Parking/Check.basic" method="post" modelAttribute="Demo" name="searchForm">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 jumbotron searchbar" style="padding: 15px;">
						<div class="input-group" align="center">
				        	<input type="text" class="form-control" name="searchPlace" id="searchPlace"  />
				        	<input type="hidden" id="lat" name="lat" />
				        	<input type="hidden" id="lng" name="lng" />
				   			<span class="input-group-btn">
				       			<button type="submit" class="btn btn-success" id="searchBtn"> <b>Search</b></button>
				        	</span>      
				     	</div>
					</div>
				</div>
			</div>
		</form>
			
		<div class="container">
			<br><br><br><br><br><br><br><br><br><br><br><br>
		</div>		
				
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<img src="images/kothrud.jpg" alt="Kothrud" style="width:100%">
        				<div class="caption" style="color: white;">
          					<p>Kothrud, Pune</p>
        				</div>	
					</div>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<img src="images/karvenagar.jpg" alt="Karvenagar" style="width:100%">
        				<div class="caption" style="color: white;">
          					<p>Karvenagar, Pune</p>
       	 				</div>	
					</div>
				</div>
	
	
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<img src="images/chinchwa.jpg" alt="Chinchwad" style="width:100%">
        				<div class="caption" style="color: white;">
          					<p>Chinchwad Road, Pune</p>
        				</div>	
					</div>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<img src="images/deccan.jpg" alt="Deccan" style="width:100%">
        				<div class="caption" style="color: white;">
          					<p>Deccan, Pune</p>
        				</div>	
					</div>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg"><img src="images/sadashiv.jpg" alt="Sadashiv Peth" style="width:100%">
        				<div class="caption" style="color: white;">
          					<p>Sadashiv Peth, Pune</p>
        				</div>	
        			</div>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg"><img src="images/SB.jpg" alt="SB Road" style="width:100%">
        				<div class="caption" style="color: white;">
          					<p>Senapati Bapat Road, Pune</p>
        				</div>	
        			</div>
				</div>
		
		
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg"><img src="images/shaniwar peth.jpg" alt="Shaniwar Peth" style="width:100%">
        				<div class="caption" style="color: white;">
          					<p>Shaniwar Peth, Pune</p>
        				</div>	
       	 			</div>
				</div>
		
		
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 cards">
					<div class="cardImg">
						<img src="images/sinhgad.jpg" alt="Sinhgad Road" style="width:100%">
        				<div class="caption" style="color: white;">
          					<p>Sinhgad Road, Pune</p>
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