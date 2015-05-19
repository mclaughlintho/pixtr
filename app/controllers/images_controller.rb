class ImagesController < ApplicationController
  before_action :require_login, only: [:create, :edit, :update, :destroy]
  
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.create(image_params)
    @tags = Tag.all
      redirect_to @gallery
  end
  
  def destroy
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    @image.destroy
    if @image.destroy
      redirect_to @gallery
    end
  end
  
  def edit
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    @tags = Tag.all
  end
  
  def update
    gallery = Gallery.find(params[:gallery_id])
    image = Image.find(params[:id])
    image.update_attributes(image_params)
    redirect_to [gallery, image]
  end
  
  def index
    @images = Image.all
  end
  
  def show
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    @comment = Comment.new
    @comments = @image.comments
    @like = Like.new
  end
  
  private
  
  def image_params
    params.require(:image).permit(:title, :url, tag_ids: []).merge(user_id: current_user.id)
  end
  
end
