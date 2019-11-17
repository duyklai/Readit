class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :posts_id
      t.integer :points
      t.string :body

      t.timestamps
    end
  end
end
