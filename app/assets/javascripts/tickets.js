// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
	$('form').on('change','.tkt_unit_price',function(e){
    e.preventDefault();
    unit_price = parseFloat($(this).val());
    quantity = parseFloat($(this).closest('tr').find('.tkt_quantity').val());
    if (isNaN(quantity)) { quantity = 0;}
    subtotal = unit_price * quantity;
    $(this).closest('tr').find('.tkt_subtotal').val(subtotal);
    total = calculate_final_price('tkt_subtotal');
    $('#ticket_ammount').val(total);
  });
  $('form').on('change','.tkt_quantity',function(e){
    e.preventDefault();  
    quantity = parseFloat($(this).val());
    unit_price = parseFloat($(this).closest('tr').find('.tkt_unit_price').val());
    if (isNaN(unit_price)) { unit_price = 0;}
    subtotal = unit_price * quantity;
    $(this).closest('tr').find('.tkt_subtotal').val(subtotal);
    total = calculate_final_price('tkt_subtotal');
    $('#ticket_ammount').val(total)
  });
  $('#ticket_date').datepicker({
    todayBtn: "linked",
    keyboardNavigation: false,
    forceParse: false,
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true,
    format: 'yyyy-mm-dd'
  });
  $('#ticket_delivery_date').datepicker({
    todayBtn: "linked",
    keyboardNavigation: false,
    forceParse: false,
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true,
    format: 'yyyy-mm-dd'
  });
});
