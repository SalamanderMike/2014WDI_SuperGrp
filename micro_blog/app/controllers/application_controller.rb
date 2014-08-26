class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



# # TEMPORARY CURRENT_USER
#   def current_user # Stores user_id or finds it
#     @current_user ||= User.find_by(2)
#   end
end
