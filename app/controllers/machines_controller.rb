class MachinesController < ApplicationController

    ###----- Before actions          Append a callback before actions
    ### condition.before_action if condition is true
    ###  set what actions can be call before using all or some CRUD functions

    before_action :set_machine, only: [:edit, :update, :destroy]
    before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy, :index]

    def index
      @machines = Machine.order(:machine_number).page params[:page]
    end

    def new
      # will creates a machine array, pushs
      # customer_number customer bus_name bus_phone and post array
      # redirect to put (edit)
      @machine = Machine.new
      @location = Location.find(params[:location_id])
      # Costumer info added
      @machine.customer_number = @location.customer_number
      @machine.customer_id = @location.customer
      # Location added
      @machine.location = @location
      # Save
      if @machine.save
        render 'new'
      else
        flash.now[:notice] = "error"
        render 'new'
      end
    end

    def create

    end

    def edit

    end

    def show
      @machine = Machine.find(params[:id])
    end

    def update
      if @machine.update(machine_params)
        redirect_to machine_path(@machine)
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
        @machine = Machine.find(params[:id])
      end

      def machine_params
        params.require(:machine).permit(:customer_number, :machine_number, :model, :serial_number, :on_location)
      end
end
