<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
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
</style>
</head>
<body>

<jsp:include page="/mainMenu.jsp" />

<div class="container registration" >
	<div class="row form-group">
        <div class="col-xs-12">
            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                <li class="active"><a href="#step-1">
                    <h4 class="list-group-item-heading">Step 1</h4>
                    <p class="list-group-item-text">First step description</p>
                </a></li>
                <li class="disabled"><a href="#step-2">
                    <h4 class="list-group-item-heading">Step 2</h4>
                    <p class="list-group-item-text">Second step description</p>
                </a></li>
                <li class="disabled"><a href="#step-3">
                    <h4 class="list-group-item-heading">Step 3</h4>
                    <p class="list-group-item-text">Third step description</p>
                </a></li>
                
                 <li class="disabled"><a href="#step-4">
                    <h4 class="list-group-item-heading">Step 4</h4>
                    <p class="list-group-item-text">Second step description</p>
                </a></li>
            </ul>
        </div>
	</div>
	
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">            	
            	<jsp:include page="/register.jsp" />                
<!--                 <button id="activate-step-2" class="btn btn-primary btn-md">Activate Step 2</button>	-->       	</div>
        	</div>
    	</div>
    </div>


    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                	<jsp:include page="/addSpace.jsp" />
<!--                  <button id="activate-step-3" class="btn btn-primary btn-md">Activate Step 3</button> -->
		  	</div>
        </div>
    </div>

    
    
    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1 class="text-center"> UPLOAD-LOCATION-IMAGE </h1> 
			    <div class="container">
          			<div class="row">
           				<div class="col-lg-11 col-xs-11 col-sm-11 col-md-11">
           					<form class="well well-image" action="upload.php" method="post" enctype="multipart/form-data">
               					<div class="form-group">
                   					<label for="file">Select a file to upload</label>
                   					<input type="file" name="file">
                   					<p class="help-block">Only jpg,jpeg,png and gif file with maximum size of 1 MB is allowed.</p>
               					</div>
			 	                <input id="activate-step-4" type="submit" class="btn btn-lg btn-primary" value="Upload">
               				</form>
            			</div>
          			</div>
    			</div> 
<!-- <button id="activate-step-4" class="btn btn-primary btn-md">Activate Step 3</button> -->          
	 		</div>
    	</div>
    </div>

    
     <div class="row setup-content" id="step-4">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1 class="text-center"> FINALLY </h1>
                
					<form></form>
                
            </div>
        </div>
    </div>
		
</div>

<jsp:include page="/footer.jsp" />

</body>
</html>