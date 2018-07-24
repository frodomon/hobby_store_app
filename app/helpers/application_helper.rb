module ApplicationHelper
	#Visualizar Booleans
	def human_boolean(boolean)
    boolean ? 'Si' : 'No'
  end
  #Definir Estados
  def sales_order_status(status)
    case status
      when 0
        'Creado'
      when 1
        'Pendiente Guía Interna'
      when 2
        'Pendiente Guía de Remisión'
      when 3
        'Pendiente Factura'
      when 4
        'Facturado'
    end
  end
  #Formularios Dinamicos
  def link_to_add_fields(name, f, association)
  	new_object = f.object.send(association).klass.new
  	id = new_object.object_id
  	fields = f.fields_for(association, new_object, child_index: id) do |builder|
  		render(association.to_s.singularize + "_fields", f: builder)
  	end
  	link_to(name, '#', class: "add_fields btn btn-success", data: {id: id, fields: fields.gsub("\n", "")})
  end
  def link_to_add_row_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_row_fields btn btn-success", data: {id: id, fields: fields.gsub("\n", "")})
  end
  def link_to_add_row_fields_sod(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_row_fields_sod btn btn-success", data: {id: id, fields: fields.gsub("\n", "")})
  end

  # Displays object errors
  def form_errors_for(object)
    render('shared/form_errors', object: object) unless object.blank?
  end
  def flash_errors_for(object)
    render('shared/flash_errors', object: object) unless object.blank?
  end
  def field_class(resource, field_name)
    if (resource.errors[field_name].length > 0)
      return "form-group has-error".html_safe
    else
      return 'form-group'.html_safe
    end
  end

  def is_active_controller(controller_name, class_name = nil)
    if params[:controller] == controller_name
      class_name == nil ? "active" : class_name
    else
      nil
    end
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end
end
