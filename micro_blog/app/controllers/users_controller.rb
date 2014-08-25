# users_controllers.rb
class UsersController < ApplicationController
  def index
    # @users = User.find_by_id(1) #Use until we integrate Authentication
    @users = User.all # Use after integrating signin
  end

  def new
    @user = User.new
  end

  def create
    user_data = params.require(:user).permit(:email, :first_name, :last_name, :image_url)
    User.create(user_data) # Delete this line if useing below commented code
    # user = User.create(user_data) #use with commented code below
    # redirect_to "/users/" + user.user_id ## save until user has a page
    redirect_to users_path
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    @pages = @user.pages
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    user_data = params.require(:user).permit(:email, :first_name, :last_name, :image_url)
    user = User.find_by_id(params[:id])
    user.update_attributes(user_data) if (user)

    # redirect_to "/users/" + user.user_id # Save for when we have a user page
    redirect_to users_path
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    redirect_to users_path
  end
end
