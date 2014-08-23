users_controller.rb

class UsersController < ApplicationController
  def index
    @all_users = Users.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    @pages = @user.pages   
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    user_data = params[:user].permit(:email, :first_name, :last_name, :image_url)

    user = User.create(user_data)

    # redirect to that users new page
    redirect_to "/users/" + user.user_id
  end
  
  def edit
    @user = User.find_by_id(params[:id])
  end
  
  def update
    id_data = params[:id]
    user_data = params[:user].permit(:email, :first_name, :last_name, :image_url)

    user = User.find_by_id(id_data)
    if user
      user.update_attributes(user_data)
    end
    redirect_to "/users/" + user.user_id
  end
  
  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to "/"
  end

end
