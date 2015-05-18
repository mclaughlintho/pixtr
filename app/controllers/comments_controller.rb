class CommentsController < ApplicationController
  before_action :require_login
  
  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create(comment_params)
    redirect_to [@image.gallery, @image]
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @image = @comment.image
    @comment.destroy
    redirect_to [@image.gallery, @image]
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
  
end
