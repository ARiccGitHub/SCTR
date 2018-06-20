class LocationsController < ApplicationController

    ###----- Before actions          Append a callback before actions
    ### condition.before_action if condition is true
    ###  set what actions can be call before using all or some CRUD functions

    before_action :set_location, only: [:edit, :update, :destroy, :create]
    #before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy, :index]

    def contact
      @location = Location.find(params[:location_id])
    end

    def index
      @locations = Location.order(:name).page params[:page]
    end

    def new # post
      # will creates a location array, pushs
      # customer_number customer bus_name bus_phone and post array
      # redirect to put (edit)
      @location = Location.new
      @customer = Customer.find(params[:customer_id])
      @location.customer_number = @customer.customer_number
      @location.customer = @customer
      @location.bus_name = @customer.name
      @location.bus_phone = @customer.phone
      if @location.save
        render 'new'
      else
        flash.now[:notice] = "error"
        redirect_to put
      end
    end

    def create

    end

    def edit

    end

    def show
      @location = Location.find(params[:id])
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
        @location = Location.find(params[:id])
      end

      def location_params
        params.require(:location).permit(:customer_number, :suite, :street, :city, :state, :zip_code, :country,
          :contact__first_name, :contact__last_name, :contact_phone, :contact_email, :phone, :contact_title, :customer_id, :name,
          :bus_name, :bus_phone)
      end
end
