class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in_after_sign_up(@user)
      redirect_to root_url, notice: 'Signed up!'
    else
      render 'new'
    end
  end

  private

  def log_in_after_sign_up(user)
    User.authenticate(user.email, user.password)
    session[:user_id] = user.id
  end
end
