class LocationsController < ApplicationController

    ###----- Before actions          Append a callback before actions
    ### condition.before_action if condition is true
    ###  set what actions can be call before using all or some CRUD functions

    before_action :set_location, only: [:edit, :update, :destroy, :show]

    # select Machine to Serivce call
    def select_machine_service
      locations = current_account.locations
      @locations = locations.order(:name).page params[:page]
    end

    # link to the location contact
    def contact
      @location = Location.find(params[:location_id])
    end

    def index
      @locations = Location.order(:name).page params[:page]
    end

    def new
      @customer = Customer.find(params[:customer_id])
      @location = Location.new
    end

    def create
       @location = Location.new(location_params)
       @location.save
      unless @location.customer_number == nil
         redirect_to customer_location_path(@location.customer, @location)
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
      if @location.update(location_params)

        redirect_to customer_location_path(@location.customer, @location)
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
          :contact__first_name, :contact__last_name, :contact_phone, :contact_email, :phone, :contact_title, :customer_id, :name, :email)
      end
end
