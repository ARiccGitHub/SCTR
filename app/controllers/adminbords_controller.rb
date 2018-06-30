class AdminbordsController < ApplicationController

  ###----- Before actions          Append a callback before actions
  ### condition.before_action if condition is true
  ###  set what actions can be call before using all or some CRUD functions
  before_action :authenticate_admin!, only: [:index, :select_customer_new_location, :select_customer_new_machine,
      :select_customer_new_account, :show_account_register]
  before_action :set_customer, only: [:select_customer_new_location, :select_customer_new_machine,
    :select_customer_new_account]
  before_action :set_account, only: [:select_account_locations, :show_account_register]

  def index
  end

  def select_customer_new_location
  end

  def select_customer_new_machine
  end

  def select_customer_new_account
  end

  def show_account_register
  end

  def accounts
    @accounts = Account.order(:customer_number).page params[:page]
  end

  def select_account_locations
    @account = Account.find(params[:account_id])
    customer = Customer.find_by customer_number: @account.customer_number
    locations = customer.locations
    @locations = locations.order(:customer_number).page params[:page]
  end

  def save_account_locations
    account = Account.find(params[:account_id])
    unless (params[:selected_location_ids]) == nil
      locations = Location.find(params[:selected_location_ids])
      account.locations << locations
      # locations .each do |location|
      #   account.locations << location
      # end
      redirect_to show_account_register_path(account)
    else
      redirect_to select_account_locations(account)
    end
  end

private

    def set_customer
      @customers = Customer.order(:customer_number).page params[:page]
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    def account_params
      params.require(:account).permit(:customer_number, :email, :title, :first_name, :last_name, :encrypted_password,
        :reset_password_token,
        :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :ast_sign_in_ip,
        :created_at, :updated_at, :customer_id)
    end

end
