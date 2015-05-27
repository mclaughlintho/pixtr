class LikesController < ApplicationController
  before_action :require_login
  
  def create
    @image = Image.find(params[:image_id])
    @like = @image.likes.create(user: current_user)
    redirect_to :back
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to :back
  end
  
end
