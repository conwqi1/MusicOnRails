class SessionsController < ApplicationController
  before_action :require_no_current_user, only: [:new, :create]
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(
      params[:session][:email], 
      params[:session][:password]
    )
    if @user #if credentials didn't match, user will be nil
      self.login_user! @user
      redirect_to bands_url
    else
      flash.now[:errors] = ['wrong credentials']
      render :new
    end
  end
  
  def destroy
    self.logout!
    redirect_to new_session_url
  end
end
