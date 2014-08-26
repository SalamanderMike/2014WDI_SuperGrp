# comments_controller.rb

class CommentsController < ApplicationController

	def index
		post_id = params[:post_id]
		@post = Post.find(post_id)
		@comments = @post.comments 
	end

	def new
		post_id = params[:post_id]
		@post = Post.find(post_id)
		@comment = @post.comments.new
	end	

	def create
		post_id = params[:post_id]
		@post = Post.find(post_id)

		new_comment = params.require(:comment).permit(:content)
		@comment = @post.comments.create(new_comment)

		# redirect_to [@post, @comment]
		redirect_to post_comment_path(@post.id, @comment)
	end

	def show
		post_id = params[:post_id]
		@post = Post.find(post_id)
		@comments = @post.comments.find(params[:id])
	end

	def update
		# @user = current_user
		@user = User.find_by(params[:user_id])
		@comment = @user.comment.new
	end

end
