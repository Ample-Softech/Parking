<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<!-- Link:- http://bootsnipp.com/snippets/M3pNX  -->
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
<div class="container register">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    		<form action="/Parking/regCode.basic">
				<h2 >Please Sign Up <small>It's free and always will be.</small></h2>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
        	                <input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="1" />
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
           	            	<input type="text" name="middle_name" id="middle_name" class="form-control input-lg" placeholder="Middle Name" tabindex="1">
						</div>
					</div>
				
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2">
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
								<input class="radio" type="radio" name="gender" value="female" />
								<label for="gender">Female</label>
							</div>
						</div>
					</div>
			
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<div class="input-group date" id="datetimepicker">
            	        		<input class="form-control input-lg" type="text" placeholder="DOB" />
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
				
<!-- 				<script type="text/javascript">
		        	$(function () {$('#datetimepicker1').datetimepicker();});
		        </script>
 -->
				</div>
		
			
				<div class="form-group">
					<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="4">
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="6">
						</div>
					</div>
				</div>
			
				<div class="form-group">
					<input type="text" name="address" id="address" class="form-control input-lg" placeholder="Address" tabindex="4">
				</div>
			
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="city" id="city" class="form-control input-lg" placeholder="City" tabindex="5">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
						<input type="text" name="state" id="state" class="form-control input-lg" placeholder="State" tabindex="6">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="country" id="country" class="form-control input-lg" placeholder="Country" tabindex="5">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="pincode" id="pincode" class="form-control input-lg" placeholder="Pincode" tabindex="6">
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-xs-4 col-sm-3 col-md-3">
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info" tabindex="7">I Agree</button>
                        <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9">
					 By clicking <strong class="label label-primary">Register</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
				</div>
			</div>
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<input id="activate-step-2" type="submit" value="Register" class="btn btn-primary btn-block btn-lg" tabindex="7">
				</div>
				<div class="col-xs-12 col-md-6">
					<a href="/Parking/LoginPage.basic" class="btn btn-success btn-block btn-lg">Sign In</a>
				</div>
			</div>
		</form>
    		
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

<!-- End register  -->                
        	</div>
    	</div>
    </div>


    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
<!--  -->                
<div class="container register">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" action="/Parking/regCode.basic">
				<h2 > Parkink-Space <small>Please Provide Space for Parking.</small></h2>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                    	    <input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="1">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
                        	<input type="text" name="middle_name" id="middle_name" class="form-control input-lg" placeholder="Middle Name" tabindex="1">
						</div>
					</div>
				
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2">
						</div>
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
<!--  -->		  	</div>
        </div>
    </div>
    
    
    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1 class="text-center"> UPLOAD-LOCATION-IMAGE </h1> 
			    <div class="container">
          			<div class="row">
           				<div class="col-lg-11 col-xs-11 col-sm-11 col-md-11">
			               <form role="form" action="/Parking/regCode.basic" class="well" enctype="multipart/form-data">
            			   		<div class="form-group">
                    				<label for="file">Select a file to upload</label>
                    					<input type="file" name="file"  />
                    					<p class="help-block">Only jpg,jpeg,png and gif file with maximum size of 1 MB is allowed.</p>
                  				</div>
                  				<input type="submit" id="activate-step-4" class="btn btn-lg btn-primary" value="Upload">
                			</form>
            			</div>
          			</div>
    			</div>	 		</div>
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