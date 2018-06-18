class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_number, :title, :first_name, :last_name, :email])
    devise_parameter_sanitizer.permit(:update, keys: [:customer_number, :title, :first_name, :last_name, :email])
  end
end
