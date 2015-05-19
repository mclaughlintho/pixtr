class LikesController < ApplicationController
  before_action :require_login
  
  def create
    @user = current_user
    @image = Image.find(params[:image_id])
    @like = @image.likes.create
    redirect_to [@image.gallery, @image]
  end

  def destroy
    @like = Like.find(params[:id])
    @image = @like.image
    @like.destroy
    redirect_to [@image.gallery, @image]
  end
  
end
