class AdminbordsController < ApplicationController

  ###----- Before actions          Append a callback before actions
  ### condition.before_action if condition is true
  ###  set what actions can be call before using all or some CRUD functions


  before_action :authenticate_admin!, only: [:index]
  def index
    #code
  end
  def select_customer
    @customers = Customer.order(:customer_number).page params[:page]
  end
end
