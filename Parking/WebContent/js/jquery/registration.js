//Register start
$(function () {
    $('.button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i>');
            }
        }
        init();
    });
});
//Register End

//Activate Next Step
$(document).ready(function() {
 
 var navListItems = $('ul.setup-panel li a'),
     allWells = $('.setup-content');

 allWells.hide();

 navListItems.click(function(e)
 {
     e.preventDefault();
     var $target = $($(this).attr('href')),
         $item = $(this).closest('li');
     
     if (!$item.hasClass('disabled')) {
         navListItems.closest('li').removeClass('active');
         $item.addClass('active');
         allWells.hide();
         $target.show();
     }
 });
 
 $('ul.setup-panel li.active a').trigger('click');
 
 // DEMO ONLY //
 $('#activate-step-2').on('click', function(e) {
     $('ul.setup-panel li:eq(1)').removeClass('disabled');
     $('ul.setup-panel li a[href="#step-2"]').trigger('click');
     $(this).remove();
 })
 
 $('#activate-step-3').on('click', function(e) {
     $('ul.setup-panel li:eq(2)').removeClass('disabled');
     $('ul.setup-panel li a[href="#step-3"]').trigger('click');
     $(this).remove();
 })
 
 $('#activate-step-4').on('click', function(e) {
     $('ul.setup-panel li:eq(3)').removeClass('disabled');
     $('ul.setup-panel li a[href="#step-4"]').trigger('click');
     $(this).remove();
 })
 
 $('#activate-step-3').on('click', function(e) {
     $('ul.setup-panel li:eq(2)').removeClass('disabled');
     $('ul.setup-panel li a[href="#step-3"]').trigger('click');
     $(this).remove();
 })
});


//Add , Dlelete row dynamically

  $(document).ready(function(){
   var i=1;
  $("#add_row").click(function(){
   $('#addr'+i).html("<td>"+ (i+1) +"</td><td><input name='name"+i+"' type='text' placeholder='Name' class='form-control input-md'  /> </td><td><input  name='sur"+i+"' type='text' placeholder='Surname'  class='form-control input-md'></td><td><input  name='email"+i+"' type='text' placeholder='Email'  class='form-control input-md'></td>");

   $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
   i++; 
});
  $("#delete_row").click(function(){
 	 if(i>1){
		 $("#addr"+(i-1)).html('');
		 i--;
		 }
	 });

});


