# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  layout 'empty'
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    
    build_resource({})
    self.resource.address = Address.new
    respond_with self.resource
  end

  # POST /resource
  def create
    resource = build_resource(sign_up_params)
    resource.roles = ["","",'user',""]

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    allow = [:title, :name, :last_name, :username, :doi, :avatar,:mtg_id, :pkm_id, :ygo_id, :bloobie_id, :dbsuper_id, :telephone, :mobile, :email, :business_name, :ruc, :workcenter, :birthdate, :genre, :password, :password_confirmation, roles: [], address_attributes: [:user_id, :shortname, :house_type, :address_line1, :address_line2, :departamento, :provincia, :distrito, :ubigeo_id, :postal_code]]    
    devise_parameter_sanitizer.permit(:sign_up, keys: allow)
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:title, :name, :last_name, :username, :doi, :avatar, :mtg_id, :pkm_id, :ygo_id, :bloobie_id, :dbsuper_id, :telephone, :mobile, :email, :business_name, :ruc, :workcenter, :birthdate, :genre, :password, :password_confirmation, roles: [], address_attributes: [:user_id, :shortname, :house_type, :address_line1, :address_line2, :departamento, :provincia, :distrito, :ubigeo_id, :postal_code]])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
