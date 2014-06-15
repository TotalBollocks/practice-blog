class UsersController < ApplicationController
  
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
    @user = current_resource
  end
  
  def update
    @user = current_resource    
    
    if @user.update(user_params)
      flash[:notice] = "Profile updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
  
  def current_resource
    @current_resource ||= User.find(params[:id]) if params[:id]
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
