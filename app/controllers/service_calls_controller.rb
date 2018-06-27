class ServiceCallsController < ApplicationController
  ###----- Before actions          Append a callback before actions
  ### condition.before_action if condition is true
  ###  set what actions can be call before using all or some CRUD functions

  before_action :set_service_call, only: [:destroy, :show]

  def index
    @service_calls = ServiceCall.order(:customer_number).page params[:page]
  end

  def new
    @machine = Machine.find(params[:machine_id])
    @service_call = ServiceCall.new
    unless @service_call.customer_number == nil
        redirect_to service_call_path(@service_call)
    else
      flash.now[:notice] = "error"
      render 'new'
    end
  end

  def create
    @machine = Machine.find(params[:machine_id])
    @service_call = ServiceCall.new(service_call_params)
    @service_call.account = current_account
    if @service_call.save

        UserMailer.with(service_call: @service_call,
          machine: @machine, account: current_account, location: @machine.location).request_email.deliver_now
        redirect_to service_call_path(@service_call), notice: "Your service ticket request was succelly commited!"

    else
      flash.now[:notice] = "error"
      render 'new'
    end
  end

  def edit

  end

  def show

  end

  def update
    if @service_call.update(service_call_params)
      redirect_to customer_location_path(@service_call.customer)
    else
      flash.now[:notice] = "error"
      render 'edit'
    end
  end

  def destroy
      @service_call.destroy
      redirect_to locations_path
  end

private
  def set_service_call
    @service_call= ServiceCall.find(params[:id])
  end
  def service_call_params
    params.require(:service_call).permit(:customer_number, :description, :machine_id, :accound_id)
  end

end
