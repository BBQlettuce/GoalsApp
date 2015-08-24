class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username],
                                     params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid Username/Password Combination"]
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    logout!
    render :new
  end
end
