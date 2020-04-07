class ChangeTagIdToBeIntegerInPosts < ActiveRecord::Migration[5.2]
  def change
    # This is the old change_column line for sqlite testing/development environment
    # change_column :posts, :tag_id, :integer

    # This line is for postgreSQL deployment/production environment
    change_column :posts, :tag_id, 'integer USING CAST(tag_id AS integer)'
  end
end
