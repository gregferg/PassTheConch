class CreateUserGames < ActiveRecord::Migration
  def change
    create_table :user_games do |t|
      t.integer :story_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end

    add_index :user_games, :story_id
    add_index :user_games, :user_id
  end
end
