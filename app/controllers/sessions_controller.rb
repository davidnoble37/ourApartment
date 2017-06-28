class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:login][:email])

    if @user && @user.authenticate(params[:login][:password])
      # make a new key in our session object called :user_id
      # which gets stored in a cookie in our browser
      session[:user_id] = @user.id.to_s
      redirect_to users_path
    else
      # give them another shot at logging
      # perhaps by redirecting back to the login form
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
