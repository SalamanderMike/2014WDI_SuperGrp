class AddTagIdToPostTags < ActiveRecord::Migration
  def change
    add_column :post_tags, :tag_id, :integer
  end
end
