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
  		redirect_to pages_path
  	else
  		render text: "Try again, dude! Signup :)"
  	end

  end

  def destroy
  		session[:user_id] = nil
  		# render text: "You've destroyed the session"
  		redirect_to login_path
  end
end
