# tags_controller.rb

class TagsController < ApplicationController
  def index
    @all_tags = Tag.all.select do |tag|
      tag.posts.length > 0
    end
  end

  #/tags/5
  def show
    @tag = Tag.find_by_id(params[:id])
  end

 #  def showbyuser
	# @posts = Post.where(:user_id => params[:user_id])
 #  end

end

# 1. only show, for the users/:user_id/tags/:tag_id route
# 2. the show will display all the posts associated to a tag for a `user