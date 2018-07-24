# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:title, :name, :last_name, :username, :doi, :avatar,:mtg_id, :pkm_id, :ygo_id, :bloobie_id, :dbsuper_id, :telephone, :mobile, :email, :business_name, :ruc, :workcenter, :birthdate, :genre, :password, :password_confirmation, :role_mask])
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:title, :name, :last_name, :username, :doi, :avatar, :mtg_id, :pkm_id, :ygo_id, :bloobie_id, :dbsuper_id, :telephone, :mobile, :email, :business_name, :ruc, :workcenter, :birthdate, :genre, :password, :password_confirmation, :role_mask])
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
