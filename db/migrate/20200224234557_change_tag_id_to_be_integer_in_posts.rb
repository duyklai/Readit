class ChangeTagIdToBeIntegerInPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :tag_id, :integer
  end
end
