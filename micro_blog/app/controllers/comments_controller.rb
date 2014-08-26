# comments_controller.rb

class CommentsController < ApplicationController

def index
post_id = params[:post_id]
@post = Post.find(post_id)
@comments = @post.comments 
render 'index'
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
@comment = Comment.new(new_comment)
puts "Here is our comment"
puts @comment.content
#making comments on top of comments
# @commentable = find_commentable
  #  @comment = @commentable.comments.create(params[:content])
    if @post.comments << @comment
      redirect_to post_comments_path(@post.id, @comment)
      return false
    else
      render :action => 'new'
    end 
end

private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
      end
      end
      nil
    end
# redirect_to [@post, @comment]
# redirect_to post_comments_path(@post.id, @comment)


# redirect_to [@post, @comment]
# redirect_to post_comment_path(@post.id, @comment)
# end

def show
post_id = params[:post_id]
@post = Post.find(post_id)
@comments = @post.comments.find(params[:id])
end
end

