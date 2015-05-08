class UsersController < ApplicationController
  before_action :require_login, only: [:destroy, :edit, :update]
  
  def show
    @user = User.find(params[:id])
    @gallery = Gallery.new
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    redirect_to @user
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
