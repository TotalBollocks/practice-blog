class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    
    if @user.save
      flash[:notice] = "You have signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    
    if @user.update(user_params)
      flash[:notice] = "Profile updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
  def find_user
    @user = current_resource
  end
  
  def current_resource
    @current_resource ||= User.find_by_slug!(params[:id]) if params[:id]
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
