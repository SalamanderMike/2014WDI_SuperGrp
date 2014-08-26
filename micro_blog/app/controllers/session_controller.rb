class SessionController < ApplicationController
  def new
    #my login form
  end

  def create
    #where auth happens
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      # session in line 12 must be "session"
      session[:user_id] = @user.id
      # render text: "Logged you in"
      redirect_to pages_path, :notice => "User Logged in Successfully!"
    else
      # render text: "Try again, dude! Signup :)"
      flash.now[:notice] = "Can't log you in"
      render :new
    end

  end

  def destroy
      session[:user_id] = nil
      # render text: "You've destroyed the session"
      redirect_to login_path
  end
end

