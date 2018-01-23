class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_after_sign_up(@user)
      redirect_to root_url, notice: 'Signed up!'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find params[:id]
  end

  def log_in_after_sign_up(user)
    User.authenticate(user.email, user.password)
    session[:user_id] = user.id
  end

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation,
      :first_name, :last_name, :username, :birthday
    )
  end
end
