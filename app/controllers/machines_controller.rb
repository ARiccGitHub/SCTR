class MachinesController < ApplicationController

    ###----- Before actions          Append a callback before actions
    ### condition.before_action if condition is true
    ###  set what actions can be call before using all or some CRUD functions

    before_action :set_machine, only: [:edit, :update, :destroy, :show]

    def index
      @machines = Machine.order(:machine_number).page params[:page]
    end

    def new
      @location = Location.find(params[:location_id])
      @machine = Machine.new
    end

    def create
        @machine = Machine.new(machine_params)
        @machine.save
        if @machine.customer_number == nil
          flash.now[:notice] = "error"
          render 'new'
        else
          redirect_to machine_path(@machine)
        end
    end

    def edit

    end

    def show
      @service_calls = []
      ServiceCall.all.each do |service|
        if service.machine  == @machine
          @service_calls << service
        end
      end
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
        params.require(:machine).permit(:customer_number, :machine_number,
          :model, :serial_number, :on_location, :location_id)
      end
end
