class UsersController < ApplicationController

  before_action :authorize,  only: [:new, :show, :destroy, :create, :index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id.to_s
        redirect_to users_path
      else
        redirect_to new_user_path
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    else
      redirect_to edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :apt_num, :email, :password, :phone, :photo_url, :roommates, :hobbies, :fav_local, :orig_home, :move_yr)
  end

end
