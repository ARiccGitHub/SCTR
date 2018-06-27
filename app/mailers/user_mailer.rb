class UserMailer < ApplicationMailer
  default from: 'servicerequest@vcn.com'

  def request_email
    @service_call = params[:service_call]
    @machine = params[:machine]
    @location = params[:location]
    @account = params[:account]
    mail(to: 'service@gmail.com', subject: 'Service Call Ticket Request')
  end
end
