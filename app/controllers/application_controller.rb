class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      adminbords_path
    elsif resource.class == Accounts
      root_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:title, :first_name, :last_name,
      :customer_number, :main_contact, :email, :customer_id])
    devise_parameter_sanitizer.permit(:update, keys: [:title, :first_name, :last_name,
      :customer_number, :main_contact, :email, :customer_id])
  end
  # def create
  #   UserMailer.with(service_call: @service_call, machine: @machine, account: current_account, ).request.deliver_now
  #   redirect_to root_path, notice: "Your service ticket request was succelly commited!"
  # end
end
