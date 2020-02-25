class RenameTagToTagId < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :tag, :tag_id
  end
end
