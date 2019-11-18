class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :posts_id, :post_id
  end
end
