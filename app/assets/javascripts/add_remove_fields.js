$(document).ready(function () {

  displayFile = function(object) {
    var file, filename;
    file = object.value.split("\\");
    filename = file[file.length - 1];
    return $("#file-name").text(filename);
  };

  $("#file-btn").on("click", function() {
    return $("#file-picker").click();
  });

  $("#file-picker").on("change", function() {
    return displayFile(this);
  });


  
  

  $('form').on('click','.add_fields', function(e){
    e.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
  });
  $('form').on('click', '.add_row_fields', function(event){
    event.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('table tr:last').after($(this).data('fields').replace(regexp, time));
  });
  $('form').on('click', '.add_row_fields_sod', function(event){
    event.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('table tr:last').after($(this).data('fields').replace(regexp, time));
    if ($('#without').hasClass('active') === true ){
      id = 0;
    }
    else{
      id=1;
    }
    set_readable(id);
  });
  $('form').on('click','.remove_fields', function(e){
    e.preventDefault();
    $(this).prev().val('1');
    $(this).closest('.row').remove();
  });
  $('form').on('click','.remove_row_fields', function(event){
    $(this).prev().val('1');
    $(this).closest('tr').remove();
    event.preventDefault();
  });
});
  
function set_readable(flag){
  if (flag === 0){
    $('.sod_unit_price').each(function(){
      $(this).prop('readonly', false);
    });
  }
}