# users_controllers.rb

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user_data = params.require(:user).permit(:email, :first_name, :last_name, :image_url)
    user = User.create(user_data)

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
    id_data = params[:id]
    user_data = params.require(:user).permit(:email, :first_name, :last_name, :image_url)
    user = User.find_by_id(id_data)
    if user
      user.update_attributes(user_data)
    end
    # redirect_to "/users/" + user.user_id # Save for when we have a user page
    redirect_to users_path
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to "/"
  end

end
