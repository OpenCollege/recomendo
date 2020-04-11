class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :followed_user_id, null: false
      t.integer :following_user_id, null: false

      t.timestamps
    end

    # Standart foreign key indexes (added by any t.references)
    add_index :follows, :followed_user_id
    add_index :follows, :following_user_id

    # Composite index: https://rails-3-2.railstutorial.org/book/following_users#code-relationships_migration
    add_index :follows, [:followed_user_id, :following_user_id], unique: true
  end
end
