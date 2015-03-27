class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You have returned. Excellent. You have blogging to do."
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Something has gone horribly wrong."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're outta here!"
    redirect_to root_path
  end

end
