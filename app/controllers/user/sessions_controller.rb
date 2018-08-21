# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  include Devise::Controllers::Helpers
  # before_action :configure_sign_in_params, only: [:create]
  layout 'login'

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
  def after_sign_in_path_for(resource)
    home_path
  end
end
