class ImagesController < ApplicationController
  before_action :require_login, only: [:create, :edit, :update, :destroy]
  before_action :require_owner, only: [:destroy, :edit, :update]
  before_action :user_can_view_image, only: [:show]
  
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
  
  def require_owner
    image = Image.find(params[:id])
    if image.user != current_user
      redirect_to root_url
    end
  end
  
  def user_can_view_image
    image = Image.find(params[:id])
    if image.gallery.private? && image.user != current_user
        redirect_to root_url
    end
  end
  
end
