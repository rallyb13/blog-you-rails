class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You're all signed up. Now get blogging, you!"
      redirect_to root_path
    else
      flash[:alert] = "It's all gone wrong again. Wallet, keys, hopes, & dreams; we've lost it all."
      render :new
    end
  end

  def show
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
