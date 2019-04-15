class UsersController < ApplicationController
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
    binding.pry
    user = User.create(user_params)
    render json: user

  end

  def destroy
    #binding.pry
    user = User.find_by(id: params[:id])

    if user
      user.destroy
      render json: { success: true }
    else
      render json: { errors: "User not found"}
    end
  end

  def update
    binding.pry
    user = User.find_by(id: params[:id])
    if user
      user.update(user_params)
      render json: {success: "Updated"}
    else
      render json: {errors: "No user"}
    end
  end



  def user_params
    params.require(:user).permit(:first_name, :description, :avatar)
  end
end

