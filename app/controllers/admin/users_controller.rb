class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end
  
  def edit
  end
  
  def update
    
    if @user.update(user_params)
      flash[:notice] = "User has been updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params[:user].permit(:role_ids => [])
  end
  
  def find_user
    @user = User.find_by_slug!(params[:id])
  end
  
end
