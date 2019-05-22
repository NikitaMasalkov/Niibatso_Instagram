class PhotosController < ApplicationController
  before_action :authorize_request

  def show
    photo = Photo.find_by(user_id: params[:user_id], id:params[:id])
    render json: photo
  end


  def create
    photo = Photo.create(photo_params)
    @current_user.photos << photo

    render json: photo
  end
end


def photo_params
  params.require(:photo).permit(:photo_url)
end

