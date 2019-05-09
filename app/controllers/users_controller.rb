class UsersController < ApplicationController
  before_action :authorize_request, except: [:create, :index]

  def index
    render json: User.all, each_serializer: UserSerializer
  end

  def show
    user = User.find_by(id: params[:id])

    if user
      render json: user, serializer: UserSerializer
    else
      render json: { error: 'User not found'}
    end
  end

  def create
    user = User.create(user_params)
    if user.errors.empty?
      render json: user
    else
      render json: { errors: user.errors }
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user
      user.destroy
      render json: { success: true }
    else
      render json: { errors: "User not found"}
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      render json: {success: "Updated"}
    else
      render json: {errors: "No user"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :description, :avatar, :password)
  end
end

