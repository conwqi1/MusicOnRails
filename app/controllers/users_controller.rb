class UsersController < ApplicationController
  before_action :require_no_current_user
  
  def new 
    @user = User.new()
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to bands_url
    else
      render :new
    end
  end
  
  protected
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
