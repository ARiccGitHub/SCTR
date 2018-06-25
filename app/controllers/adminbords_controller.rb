class AdminbordsController < ApplicationController

  ###----- Before actions          Append a callback before actions
  ### condition.before_action if condition is true
  ###  set what actions can be call before using all or some CRUD functions
  before_action :authenticate_admin!, only: [:index]
  before_action :set_customer, only: [:select_customer_new_location, :select_customer_new_machine, :select_customer_new_account]


  def index
  end

  def select_customer_new_location
  end

  def select_customer_new_machine
  end

  def select_customer_new_account

  end

  def show_account_register
    @account=Account.find(params[:id])
  end

private

    def set_customer
      @customers = Customer.order(:customer_number).page params[:page]
    end
    def set_account
      @account = Account.find(params[:id])
    end
    def account_params
      params.require(:account).permit(:customer_number, :email, :title, :first_name, :last_name, :encrypted_password, :reset_password_token,
        :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :ast_sign_in_ip, :created_at, :updated_at, :customer_id)
    end

end
