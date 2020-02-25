class ChangeTagIdToBeIntegerInPosts < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :tag_id, :integer
  end

  def down
    change_column :posts, :tag_id, :string
  end
end
