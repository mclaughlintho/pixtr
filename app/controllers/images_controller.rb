class ImagesController < ApplicationController
  
  def create
    @gallery = Gallery.find(params[:id])
    @image = @gallery.images.new(image_params)
    if @image.save
      redirect_to @gallery
    end
  end
  
  private
  
  def image_params
    params.require(:image).permit(:title, :url, :gallery_id)
  end
  
end
