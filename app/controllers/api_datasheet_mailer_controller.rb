class ApiDatasheetMailerController < ApiBaseController
  def send_datasheet
    @customer = Customer.find_by email: params[:email]
    @product = Product.find(params[:product_id])
    @surface_finish = params[:surface_finish]
    if @customer.nil?
      @customer = Customer.create(
                                   name: params[:name], email: params[:email],
                                   country: ISO3166::Country.find_by_name(params[:country])[0],
                                   phone: params[:phone], company_name: params[:company_name]
                                 )                          
    end
    DatasheetMailer.send_datasheet(@customer, @product, @surface_finish).deliver_later
    render json: { success: true }
  end
end
