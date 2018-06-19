class CustomersController < ApplicationController

  ###----- Before actions          Append a callback before actions
  ### condition.before_action if condition is true
  ###  set what actions can be call before using all or some CRUD functions

  before_action :set_customer, only: [:edit, :update, :destroy]
  #before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy, :index]


  def main_contact
    @customer = Customer.find(params[:customer_id])
  end

  def index
    @customers = Customer.order(:customer_number).page params[:page]
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customer_path(@customer)
    else
      flash.now[:notice] = "error"
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      flash.now[:notice] = "error"
      render 'edit'
    end
  end

  def destroy
      @customer.destroy
      redirect_to customers_path
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:customer_number,:name, :phone, :email, :suite, :street, :city, :state, :zip_code, :country,
         :main_contact_title, :main_contact__first_name, :main_contact__last_name,:main_contact_phone, :main_contact_email)
    end
end
