class ApiStaticsController < ApiBaseController
  def index
    render json: Static.all
  end
  
  def show_by_key
    @static = Static.where(key: params[:key])
    if @static.present?
      @static = @static.first
      render json: @static
    else
      bad_request("Static not found.")
    end
  end
  
  def show_countries
    render json: ISO3166::Country.all.map { |country| { name: country.data["name"] } }
  end
end
