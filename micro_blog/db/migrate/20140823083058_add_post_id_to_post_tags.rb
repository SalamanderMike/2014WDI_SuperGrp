class AddPostIdToPostTags < ActiveRecord::Migration
  def change
    add_column :post_tags, :post_id, :integer
  end
end
