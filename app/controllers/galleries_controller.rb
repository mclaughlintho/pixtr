class GalleriesController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy, :edit, :update]
  before_action :require_owner, only: [:destroy, :edit, :update]
  before_action :user_can_view_gallery, only: [:show]
  
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
    params.require(:gallery).permit(:name, :description, :private)
  end
  
  def require_owner
    gallery = Gallery.find(params[:id])
    if gallery.user != current_user
      redirect_to root_url
    end
  end
  
  def user_can_view_gallery
    gallery = Gallery.find(params[:id])
    if gallery.private? && gallery.user != current_user
        redirect_to root_url
    end
  end
  
end
