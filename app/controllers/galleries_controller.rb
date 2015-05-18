class GalleriesController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy, :edit, :update]
  
  def index
    @galleries = Gallery.all
  end
  
  def new
    @gallery = Gallery.new
  end
  
  def create
    @gallery = current_user.galleries.create(gallery_params)
    redirect_to @gallery
  end
  
  def show
    @gallery = Gallery.find(params[:id])
    @user = @gallery.user
    @image = @gallery.images.new
    @tags = Tag.all
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to root_url
  end
  
  def edit
    @gallery = Gallery.find(params[:id])
  end
  
  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update_attributes(gallery_params)
    redirect_to @gallery
  end
  
  private
  
  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
  
end
