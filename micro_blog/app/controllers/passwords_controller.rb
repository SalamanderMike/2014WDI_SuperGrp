class PasswordsController < ApplicationController
  def new
  	# Render reset password form
  end

  def create
  	# render text: "About to reset password..."
  	user = User.find_by_email(params[:email])

  	if user
  		#start password flow
  		user.set_password_reset
  		#password reset from user_mailer method
  		UserMailer.password_reset(user).deliver
  	end

   	# render text: "User has been reset"
   	redirect_to "/"
  end

end

