# users_controllers.rb
class UsersController < ApplicationController

#     @current_user = User.find_by_id(2)

  def index
    @current_user = User.find_by_first_name("Lisa")
    # @users = User.find_by_id(1) #Use until we integrate Authentication
    @users = User.all # Use after integrating signin
  end

  def new
    @user = User.new
  end

  def create
    user_data = params.require(:user).permit(:email, :first_name, :last_name, :image_url)
    @user = User.create(user_data)

    if @user.errors.count == 0 # Delete this line if using below commented code
      flash[:notice] = "New User created successfully"
       redirect_to users_path
    else
      flash[:error] = "Unable to create new user"
      render "users/new"
    end
    # user = User.create(user_data) #use with commented code below
    # redirect_to "/users/" + user.user_id ## save until user has a page
    # redirect_to users_path
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    @pages = @user.pages
  end

  def edit
    @current_user = User.find_by_first_name("Lisa")

    @user = @current_user
    render :edit
  end

  def update
    @current_user = User.find_by_first_name("Lisa")

    user_data = params.require(:user).permit(:email, :first_name, :last_name, :image_url)
    user = @current_user
    user.update_attributes(user_data)

    # redirect_to "/users/" + user.user_id # Save for when we have a user page
    redirect_to users_path
  end

  def destroy
    @current_user = User.find_by_first_name("Lisa")

    @current_user.destroy
    redirect_to users_path
  end

end
