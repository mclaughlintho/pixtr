class GalleriesController < ApplicationController
  
  def index
    @galleries = Gallery.all
  end
  
  def new
    @gallery = Gallery.new
  end
  
  def create
    @gallery = Gallery.new(user_params)
    if @gallery.save
      redirect_to @gallery
    else
      render 'galleries/new'
    end
  end
  
  def show
    @gallery = Gallery.find(params[:id])
    @image = @gallery.images.new
  end
  
  private
  
  def user_params
    params.require(:gallery).permit(:name, :description)
  end
  
end
