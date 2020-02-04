class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :value, :null => false
      t.integer :user_id
      t.integer :post_id, :null => true
      t.integer :comment_id, :null => true

      t.timestamps
    end
  end
end
