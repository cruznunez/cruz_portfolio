class SessionsController < ApplicationController
  def new
    if User.any?                # Are there any users?
      if session[:user_id]        # If so, check if user is signed in
        redirect_to root_path       # if so they are signed in, go to home page, already logged in
      else
        @user = User.new            # if not, go to login page so they sign in
      end
    else
      session[:user_id] = nil     # if not, clear session and continue to login page, just in case db was dropped but didn't log out.
    end
  end

  def create
    email = params[:name]
    password = params[:password]
    user = User.find_by_name(email)
    if user
      if user.authenticate(password)
        session[:user_id] = user.id
        redirect_to projects_path
      else
        redirect_to log_in_path
      end
    else
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to projects_path
  end
end
