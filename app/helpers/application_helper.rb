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

  def is_active_controller(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end

  def activation(class_name = nil)
    if class_name === nil 
      clase = "active"
    else
      clase = class_name
    end
  end

  def navigation_lvl1(menu_name = nil)
    menu_name == active_menu() ? "active" : nil 
    

  end
  def navigation_lvl2(helper = nil)
    helper == active_menu() ? "in" : nil
  
  end

  def active_menu()
    controller_name = params[:controller]
    case controller_name
      when 'ubigeos'
        "mantenimiento"
      when 'doi_types'
        "mantenimiento"
      when 'suppliers'
        "mantenimiento"
      when 'warehouses'
        "mantenimiento"
      when 'delivery_methods'
        "mantenimiento"
      when 'payment_methods'
        "mantenimiento"
      when 'delivery_hours'
        "mantenimiento"
      when 'products'
        "product_line"
      when 'categories'
        "product_line"
      when 'sub_categories'
        "product_line"
      when 'game_types'
        "product_line"
      when 'game_styles'
        "product_line"
      when 'thematics'
        "product_line"
      when 'suggested_ages'
        "product_line"
      when 'game_lines'
        "product_line"
      when 'inventories'
        "inventory_mgmt"
      when 'store_credits'
        "store_credits"
      when 'purchase_orders'
        "compras"
      when 'sales_orders'
        "ventas"
      when 'tickets'
        "ventas"
      else
        nil
    end
  end
    
  def is_active_mantenimiento(class_name)
    clase = activation(class_name)
    controller_name = params[:controller]
    case controller_name
      when 'ubigeos'
        clase
      when 'doi_types'
        clase
      when 'suppliers'
        clase
      when 'warehouses'
        clase
      when 'delivery_methods'
        clase
      when 'payment_methods'
        clase
      when 'delivery_hours'
        clase
      else
        nil
    end
  end

  def is_active_product_line(class_name)
    clase = activation(class_name)
    controller_name = params[:controller]
    case controller_name
      when 'products'
        clase
      when 'categories'
        clase
      when 'sub_categories'
        clase
      when 'game_types'
        clase
      when 'game_styles'
        clase
      when 'thematics'
        clase
      when 'suggested_ages'
        clase
      when 'game_lines'
        clase
      else
        nil
    end
  end

  def is_active_inventory_mgmt(class_name)
    clase = activation(class_name)
    controller_name = params[:controller]
    case controller_name
      when 'inventories'
        clase
      else
        nil
    end
  end
  
  def is_active_store_credit(class_name)
    clase = activation(class_name)
    controller_name = params[:controller]
    case controller_name
      when 'store_credits'
        clase
      else
        nil
    end
  end

  def is_active_compras(class_name)
    clase = activation(class_name)
    controller_name = params[:controller]
    case controller_name
      when 'purchase_orders'
        clase
      else
        nil
    end
  end
  def is_active_ventas(class_name)
    clase = activation(class_name)
    controller_name = params[:controller]
    case controller_name
      when 'sales_orders'
        clase
      when 'tickets'
        clase
      else
        nil
    end
  end

end