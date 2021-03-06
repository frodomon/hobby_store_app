$(document).ready(function () {
  
  smart_checkbox_multiform('purchase_order','registered');
  
  if($('#submit-form[class^="edit_"]').length > 0) {
    $('#purchase_order_date').datepicker({
      todayBtn: "linked",
      keyboardNavigation: false,
      forceParse: false,
      calendarWeeks: true,
      autoclose: true,
      todayHighlight: true,
      format: 'yyyy-mm-dd'
    });
    $('#chk_registered').iCheck('disable');
  };

    $('form').on('change','.pod_quantity',function(e){
    e.preventDefault();
    quantity = parseFloat($(this).val());
    unit_price = parseFloat($(this).closest('tr').find('.pod_unit_price').val());
    if (isNaN(unit_price)) { unit_price = 0;}
    subtotal = unit_price * quantity;
    $(this).closest('tr').find('.pod_pending').val(quantity);
    $(this).closest('tr').find('.pod_subtotal').val(subtotal);
    total = calculate_final_price('pod_subtotal');
    $('#purchase_order_ammount').val(total);
  });
    
  $('form').on('change','.pod_unit_price',function(e){
    e.preventDefault();
    unit_price = parseFloat($(this).val());
    quantity = parseFloat($(this).closest('tr').find('.pod_quantity').val());
    if (isNaN(quantity)) { quantity = 0;}
    subtotal = unit_price * quantity;
    $(this).closest('tr').find('.pod_subtotal').val(subtotal);
    total = calculate_final_price('pod_subtotal');
    $('#purchase_order_ammount').val(total);
  });
  $('#purchase_order_delivery_date').datepicker({
    todayBtn: "linked",
    keyboardNavigation: false,
    forceParse: false,
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true,
    format: 'yyyy-mm-dd'
  });
  $('#purchase_order_order_date').datepicker({
    todayBtn: "linked",
    keyboardNavigation: false,
    forceParse: false,
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true,
    format: 'yyyy-mm-dd'
  });
  $('#submit-form').submit(function(){
    fields = ['#purchase_order_business_id','#purchase_order_supplier_id','#purchase_order_order_number','#purchase_order_delivery_date','#purchase_order_order_date','#purchase_order_billing_address','#purchase_order_delivery_address','#purchase_order_ammount'];
    fields_flag = validate_form(fields);
    return fields_flag;
  });
});
