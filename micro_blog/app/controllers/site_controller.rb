class SiteController < ApplicationController
  before_action :is_authenticated?
  def index
  	@user = User.find(session[:user_id]) || ""
  	# render text: @user.email
  	render text: "Hi #{current_user.email}, this is my secret page!"
  end
end

# Add signup link to users#new