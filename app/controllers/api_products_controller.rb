class ApiProductsController < ApiBaseController
  def index
    @products = Product.all
    @products = @products.where(category: params[:category]) if params[:category] && params[:category] != ""
    @products = @products.where(first_level: params[:first_level]) if params[:first_level] && params[:first_level] != ""
    @products = @products.where(second_level: params[:second_level]) if params[:second_level] && params[:second_level] != ""
    @products = @products.where(cold_flexibility: params[:cold_flexibility]) if params[:cold_flexibility] && params[:cold_flexibility] != ""
    @products = @products.where(carrier: params[:carrier]) if params[:carrier] && params[:carrier] != ""
    render json: @products != Product.all ? @products.take : Product.all
  end

  def products_list
    @products = Product.all
    @products = @products.where(category: params[:category]) if params[:category] && params[:category] != ""
    @products = @products.where(first_level: params[:first_level]) if params[:first_level] && params[:first_level] != ""
    @products = @products.where(second_level: params[:second_level]) if params[:second_level] && params[:second_level] != ""
    @products = @products.where(cold_flexibility: params[:cold_flexibility]) if params[:cold_flexibility] && params[:cold_flexibility] != ""
    @products = @products.where(carrier: params[:carrier]) if params[:carrier] && params[:carrier] != ""
    render json: @products != Product.all ? @products : Product.all
  end

  def show
    if Product.where(id: params[:id]).present?
      render json: Product.find(params[:id])
    else
      bad_request("Product not found.")
    end
  end

  def systems
    @product = Product.where(id: params[:product_id])
    if @product.present?
      render json: @product.first.systems
    else
      bad_request("Product not found.")
    end
  end
  
  def cold_flexibility
  	render json: Product.where("second_level = ?", params[:type]).map(&:cold_flexibility).uniq.sort_by { |v| -v.split(" ").shift.to_i }
  end
  
  def carrier
  	render json: Product.where("second_level = ? AND cold_flexibility = ?", params[:type], params[:cold_flexibility]).map(&:carrier).uniq.sort
  end
  
  def all_filters
  	@products = Product.where("second_level = ?", params[:type]).map(&:cold_flexibility).uniq.sort_by { |v| -v.split(" ").shift.to_i }
  	@hash = {}
  	@products.each do |cf|
  		@hash[:"#{cf}"] = Product.where("second_level = ? AND cold_flexibility = ?", params[:type], cf).map(&:carrier).uniq.sort
  	end
  	render json: @hash.to_json
  	#Product.where("second_level = ?", params[:type]).map { |cf| "#{cf.cold_flexibility}" << Product.where("second_level = ? AND cold_flexibility = ?", params[:type], cf.cold_flexibility).map(&:carrier).uniq }
  end
 end
