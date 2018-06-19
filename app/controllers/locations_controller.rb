class LocationsController < ApplicationController

    ###----- Before actions          Append a callback before actions
    ### condition.before_action if condition is true
    ###  set what actions can be call before using all or some CRUD functions

    before_action :set_location, only: [:edit, :update, :destroy]
    #before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy, :index]

    def index
      @locations = location.order(:name).page params[:page]
    end

    def new
      @location = location.new
    end

    def create
      @location = location.new(location_params)
      if @location.save
        redirect_to location_path(@location)
      else
        flash.now[:notice] = "error"
        render 'new'
      end
    end

    def edit
      @location = location.find(params[:id])
    end

    def show
      @location = location.find(params[:id])
    end

    def update
      if @location.update(location_params)
        redirect_to location_path(@location)
      else
        flash.now[:notice] = "error"
        render 'edit'
      end
    end

    def destroy
        @location.destroy
        redirect_to locations_path
    end

    private

      def set_location
        @location = location.find(params[:id])
      end

      def location_params
        params.require(:location).permit(:cutomer_number, :name, :suite, :street, :city, :state, :zip_code, :country,
          :contact__first_name, :contact__last_name, :contact_phone, :contact_email, :phone, :contact_title)
      end
end
