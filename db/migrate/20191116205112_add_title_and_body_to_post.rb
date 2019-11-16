class AddTitleAndBodyToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title,    :string
    add_column :posts, :body,     :string
  end
end
