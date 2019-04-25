class PhotosController < ApplicationController

  def show
    photo = Photo.find_by(user_id: params[:user_id], id:params[:id])
    render json: photo
  end
end


