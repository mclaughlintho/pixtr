class ImagesController < ApplicationController
  
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new(image_params)
    @tags = Tag.all
    if @image.save
      redirect_to @gallery
    end
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
  end
  
  private
  
  def image_params
    params.require(:image).permit(:title, :url, tag_ids: [])
  end
  
end
