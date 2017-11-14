class ApiBaseController < ActionController::Base
  protect_from_forgery with: :null_session

  before_filter :parse_request

  private

  def parse_request
    @json = JSON.parse(request.body.read) rescue []
  end

  def bad_request(message="Bad request.")
      render json: "{\"error\": true, \"message\": \"#{message}\"}",
             status: :bad_request
  end
end