<div class="popup-box chat-popup" id="qnimate">
	<div class="popup-head">
		<div class="popup-head-left pull-left"> Your Deatils</div>
			<div class="popup-head-right pull-right">
				<div class="btn-group">
    				<button class="chat-header-button" data-toggle="dropdown" type="button" aria-expanded="false">
					<i class="glyphicon glyphicon-cog"></i> </button>
					<ul role="menu" class="dropdown-menu pull-right">
						<li><a href="#">Media</a></li>
						<li><a href="#">Block</a></li>
						<li><a href="#">Clear Chat</a></li>
						<li><a href="#">Email Chat</a></li>
					</ul>
				</div>
				<button data-widget="remove" id="removeClass" class="chat-header-button pull-right" type="button"><i class="glyphicon glyphicon-off"></i></button>
           	</div>
		</div>
		
		<div class="container">
			<form class="form" role="form">
				<div class="row">
				<div class="col-xs-3 col-sm-3 col-md-3">
					<div class="form-group">
                	    <input type="text" name="fn" id="fn" class="form-control" placeholder=" First Name " tabindex="1">
					</div>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3">
					<div class="form-group">
                	    <input type="text" name="ln" id="ln" class="form-control" placeholder=" Last Name " tabindex="1">
					</div>
				</div>
				</div>

				<div class="row">
				<div class="col-xs-3 col-sm-3 col-md-3">
					<div class="form-group">
                	    <input type="text" name="mn" id="mn" class="form-control" placeholder=" Mobile Number " tabindex="1">
					</div>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3">
					<div class="form-group">
                	    <input type="text" name="ea" id="ea" class="form-control" placeholder=" Email Address " tabindex="1">
					</div>
				</div>
				</div>
				
				<div class="row">
				<div class="col-xs-3 col-sm-3 col-md-3">
					<div class="form-group">
                	    <input type="text" name="vr" id="vr" class="form-control" placeholder=" Vehicle Registration " tabindex="1">
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="checkbox" id="tc" name="tc" />
						<label for="tc">I agree to the YourParkingSpace Terms & Conditions</label>
					</div>
				</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-2 col-md-2">
					<div class="form-group">
						<a href="#" id="addClasss" class="btn btn-success">Payment</a>
					</div>
				</div>
				</div>
				
			</form>	
			
			
		</div>


		<div class="popup-messages-footer">
			<textarea id="status_message" placeholder="Type a message..." rows="10" cols="40" name="message"></textarea>
			<div class="btn-footer">
				<button class="bg_none"><i class="glyphicon glyphicon-film"></i> </button>
				<button class="bg_none"><i class="glyphicon glyphicon-camera"></i> </button>
           	 	<button class="bg_none"><i class="glyphicon glyphicon-paperclip"></i> </button>
				<button class="bg_none pull-right"><i class="glyphicon glyphicon-thumbs-up"></i> </button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("#addClass").click(function () {
        $('#qnimate').addClass('popup-box-on');
  	});
        
   	$("#removeClass").click(function () {
    	$('#qnimate').removeClass('popup-box-on');
   	});
})
</script>
