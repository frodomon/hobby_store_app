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
  
  var fileinput = $('.fileinput').fileinput();
  if ($('.fileinput-filename').val !== null){
    fileinput.addClass('fileinput-exists').removeClass('fileinput-new')
  }

  var edit_ug = {
    departamentos: function(selector, id){
      var jsonUrl = "/ubigeo/get/departamentos.json"
      $.getJSON(jsonUrl).done (function(data){
        $.when(PopulateCallback(data,selector)).then(selectDep(id))
      })  
    },
    provincias: function(id, selector, prov_id){
      var jsonUrl = "/ubigeo/get/provincias/"+id+".json"
      $('#provincia').append('<option value = "default" selected>Seleccione una Provincia</option>')
      $.getJSON(jsonUrl).done(function(data){
        $.when(PopulateCallback(data, selector)).then(selectProv(prov_id))
      })
    },
    distritos: function(id, selector, dis_id){
      var jsonUrl = "/ubigeo/get/distritos/"+id+".json"
      $('#distrito').append('<option value = "default" selected>Seleccione un Distrito</option>')
      $.getJSON(jsonUrl).done(function(data){
        $.when(PopulateCallback(data, selector)).then(selectDis(dis_id))
      })
    }
  }

  var ubigeos = []
  $.when(PopulateUbigeos(ubigeos)).done(edit_ug.departamentos($('#departamento'),ubigeos[2]))

  $('#departamento').on('change',function(e){
    e.preventDefault();
    var departamento = $(this).find(':selected').val();
    $('#provincia').empty()
    $.when(edit_ug.provincias(departamento, $('#provincia'),ubigeos[1])).done($('.provincia').show())
  });
  $('#provincia').on('change',function(e){
    e.preventDefault();
    var provincia = $(this).find(':selected').val();
    $('#distrito').empty()
    $.when(edit_ug.distritos(provincia, $('#distrito'),ubigeos[0])).done($('.distrito').show())
  });
  $('#distrito').change(function(e){
    e.preventDefault();
    var optionSelected = $("option:selected", this);
    var distrito= this.value;
    $('#user_ubigeo_id').val(distrito)
  });
});

function PopulateUbigeos(arreglo){
  var ubigeo_id = $('#user_address_attributes_ubigeo_id').val()
  
  var jsonUrl = "/ubigeo/get/ubigeo/"+ubigeo_id+".json"
  distrito_id = get_data(jsonUrl,null).toString()
  if (distrito_id.length === 6){
    var provincia_id = distrito_id.slice(0,4)
    var departamento_id = provincia_id.slice(0,2)
  }
  else{
    var provincia_id = distrito_id.slice(0,3)
    var departamento_id = provincia_id.slice(0,1)
  }
  arreglo.push(distrito_id)
  arreglo.push(provincia_id)
  arreglo.push(departamento_id)
}
function selectDep(id){
  $('#departamento option[value="'+id+'"]').prop('selected', 'selected').trigger('change')
}
function selectProv(id){
  $('#provincia option[value="'+id+'"]').prop('selected', 'selected').trigger('change')
}
function selectDis(id){
  $('#distrito option[value="'+id+'"]').prop('selected', 'selected').trigger('change')
}
function PopulateCallback(data, selector){
  $.each(data, function(i,obj){
    var option = $('<option />');
    option.attr('value', obj.ug_id).text(obj.name);
    selector.append(option);
  });
}