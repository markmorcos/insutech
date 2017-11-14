class ApiDesignMailerController < ApiBaseController
  def send_design
    @customer = Customer.find_by email: params[:email]
    if @customer.nil?
      @customer = Customer.create(
                                   name: params[:name], email: params[:email],
                                   country: ISO3166::Country.find_by_name(params[:country])[0],
                                   phone: params[:phone], company_name: params[:company_name]
                                 )                          
    end
    DesignMailer.send_design(@customer).deliver_later
    render json: { success: true }
  end
end
