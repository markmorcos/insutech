class ApiNewsController < ApiBaseController
  def index
    render json: News.offset(params[:offset] || 0).limit(params[:limit] || nil)
  end

  def show
    if News.where(id: params[:id]).present?
      render json: News.find(params[:id])
    else
      bad_request("Article not found.")
    end
  end
end
