class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
  end
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.create(tag_params)
    redirect_to tags_path
  end
  
  def show
    @tag = Tag.find(params[:id])
    @images = @tag.images.all
  end

private

  def tag_params
    params.require(:tag).permit(:text)
  end

end
