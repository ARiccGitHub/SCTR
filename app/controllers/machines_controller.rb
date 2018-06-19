class MachinesController < ApplicationController

    ###----- Before actions          Append a callback before actions
    ### condition.before_action if condition is true
    ###  set what actions can be call before using all or some CRUD functions

    before_action :set_machine, only: [:edit, :update, :destroy]
    #before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy, :index]

    def index
      @machines = machine.order(:machine_number).page params[:page]
    end

    def new
      @machine = Machine.new
    end

    def create
      @machine = machine.new(machine_params)
      if @machine.save
        redirect_to customer_path(@machine)
      else
        flash.now[:notice] = "error"
        render 'new'
      end
    end

    def edit
      @machine = machine.find(params[:id])
    end

    def show
      @location = machine.find(params[:id])
    end

    def update
      if @machine.update(machine_params)
        redirect_to customer_path(@machine)
      else
        flash.now[:notice] = "error"
        render 'edit'
      end
    end

    def destroy
        @machine.destroy
        redirect_to locations_path
    end

    private

      def set_machine
        @location = machine.find(params[:id])
      end

      def machine_params
        params.require(:machine).permit(:customer_number, :machine_number, :model, :serial_number)
      end
end
