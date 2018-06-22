class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      adminbords_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_number, :title, :first_name, :last_name, :email])
    devise_parameter_sanitizer.permit(:update, keys: [:customer_number, :title, :first_name, :last_name, :email])
  end
end
