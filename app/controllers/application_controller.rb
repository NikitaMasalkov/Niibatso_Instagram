class ApplicationController < ActionController::API
  def authorize_request
    begin
      @decoded = JsonWebToken.decode(request.headers['Authorization'])
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
