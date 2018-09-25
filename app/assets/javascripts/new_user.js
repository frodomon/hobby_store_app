$(document).ready(function () {
  $('#user_birthdate').datepicker({
    todayBtn: "linked",
    keyboardNavigation: false,
    forceParse: false,
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true,
    format: 'yyyy-mm-dd'
  });
  $('.i-checks').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
  });

  
  var Ubigeos = {
    departamentos: function(selector){
      var jsonUrl = "/ubigeo/get/departamentos.json"
      $.getJSON(jsonUrl).done (function(data){
        PopulateCallback(data,selector);
      })  
    },
    provincias: function(id, selector){
      var jsonUrl = "/ubigeo/get/provincias/"+id+".json"
      $('#provincia').append('<option value = "default" selected>Seleccione una Provincia</option>')
      $.getJSON(jsonUrl).done(function(data){
        PopulateCallback(data, selector)
      })
    },
    distritos: function(id, selector){
      var jsonUrl = "/ubigeo/get/distritos/"+id+".json"
      $('#distrito').append('<option value = "default" selected>Seleccione un Distrito</option>')
      $.getJSON(jsonUrl).done(function(data){
        PopulateCallback_UG(data, selector)
      })
    }
  }
  /*Llenar Información de Ubigeo */
  var departamentos = new Ubigeos.departamentos($('#departamento'));
  $('#departamento').on('change',function(e){
    e.preventDefault()
    var departamento = $(this).find(':selected').val();
    var dep_name = $(this).find(':selected').text();
    $('#provincia').empty();
    $.when(Ubigeos.provincias(departamento, $('#provincia'))).done($('.provincia').show());
    $('#user_address_attributes_departamento').val(dep_name);
  });
  $('#provincia').on('change',function(e){
    e.preventDefault();
    var provincia = $(this).find(':selected').val();
    var prov_name = $(this).find(':selected').text();
    $('#distrito').empty()
    $.when(Ubigeos.distritos(provincia, $('#distrito'))).done($('.distrito').show())
    $('#user_address_attributes_provincia').val(prov_name);
  });
  $('#distrito').change(function(e){
    e.preventDefault();
    var optionSelected = $("option:selected", this);
    var distrito= $(this).find(':selected').val();
    var dis_name = $(this).find(':selected').text();
    alert(distrito)
    $('#user_address_attributes_ubigeo_id').val(distrito)
    $('#user_address_attributes_distrito').val(dis_name);
  });
})

function PopulateCallback(data, selector){
  $.each(data, function(i,obj){
    var option = $('<option />');
    option.attr('value', obj.ug_id).text(obj.name);
    selector.append(option);
  });
}
function PopulateCallback_UG(data, selector){
  $.each(data, function(i,obj){
    var option = $('<option />');
    option.attr('value', obj.id).text(obj.name);
    selector.append(option);
  });
}
