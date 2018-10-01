// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
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
    $('#warehouse_departamento').val(dep_name);
  });
  $('#provincia').on('change',function(e){
    e.preventDefault();
    var provincia = $(this).find(':selected').val();
    var prov_name = $(this).find(':selected').text();
    $('#distrito').empty()
    $.when(Ubigeos.distritos(provincia, $('#distrito'))).done($('.distrito').show())
    $('#warehouse_provincia').val(prov_name);
  });
  $('#distrito').change(function(e){
    e.preventDefault();
    var optionSelected = $("option:selected", this);
    var distrito= $(this).find(':selected').val();
    var dis_name = $(this).find(':selected').text();
    $('#warehouse_ubigeo_id').val(distrito)
    $('#warehouse_distrito').val(dis_name);
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
