# users_controllers.rb
class UsersController < ApplicationController
  before_action :is_authenticated?, :except => [:new, :create]

  def index
    @current_user = current_user
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_data)
    session[:user_id] = user.id

    if user.errors.any?
      flash[:error] = user.errors.full_messages.to_sentence
      render new_user_path
    end

    redirect_to user_pages_path(user.id)
  end

  def show
    @current_user = current_user
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    @pages = @user.pages
  end

  def edit
    @user = current_user
    render :edit
  end

  def update
    user_data = params.require(:user).permit(:email, :first_name, :last_name, :image_url)
    user = current_user
    user.update_attributes(user_data)
    userID = user.id.to_s
    redirect_to "/users/#{userID}/pages/#{userID}"
  end

  def destroy
      current_user.destroy
      redirect_to login_path
  end

private
  def user_data
    user_data = params.require(:user).permit(:email, :password, :first_name, :last_name, :image_url)
  end
end
