# pages_controller.rb

class PagesController < ApplicationController

	def index
    	@pages = Page.all
	end

	def new
		user_id = params[:user_id]
		@user = User.find(user_id)
		@page = @user.pages.new
	end	

	def create
		user_id = params[:user_id]
		@user = User.find(user_id)

		new_page_data = params.require(:pages).permit(:content)
		@page = @user.pages.create(new_page_data)

		# redirect_to [@user, @pages]
		redirect_to user_page_path(@user.id, @page)
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def show
		user_id = params[:user_id]
		@user = User.find(user_id)
		# @pages = @user.pages
	end

end