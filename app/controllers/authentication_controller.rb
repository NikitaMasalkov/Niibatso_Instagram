class AuthenticationController < ApplicationController

  def login
    @user = User.find_by_first_name(params[:first_name])
    if @user&.authenticate(params[:password])
      token = :JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.first_name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:first_name, :password)
  end
end


