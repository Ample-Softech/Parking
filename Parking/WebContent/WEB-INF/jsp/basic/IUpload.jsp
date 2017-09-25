<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Image Upload</title>
<jsp:include page="/link.jsp" />
	<link rel="stylesheet" href='<c:url value="https://www.w3schools.com/w3css/4/w3.css"></c:url>'  />

<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
<style type="text/css">

      /* Optional: Makes the sample page fill the window. */
      
      
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

.psiu{
	margin-top: 20px;
}
 .well {background: rgba(220, 220, 220, 0.7);}

</style>

</head>
<body>

<jsp:include page="/mainMenu.jsp" />

	<div class="container psiu">
		<div class="well row">
           	<div class="text-center col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<h2> Upload Image <small> Please Provide Parking Space Image. </small></h2>
				<hr class="colorgraph">
	            <form role="form" action="/Parking/imageUp.basic" method="post" class="form" enctype="multipart/form-data">
	            	<div class="w3-card-4">
	            	  	<div class="form-group">
		   					<label for="file">Select a file to upload</label>
	           	        	<input class="form-control" type="file" name="file" id="file" />
	   						<p class="help-block">Only jpg,jpeg,png and gif file with maximum size of 1 MB is allowed.</p>
	   					</div>
	            	</div>
					<br>
           			<input type="submit" class="btn btn-lg btn-primary" value="Upload">
					<a href="/Parking/regDone.basic" class="btn btn-lg btn-success"> Skip </a>
				</form><br>
				<hr class="colorgraph">
    		</div>
		</div>
	</div>
<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>