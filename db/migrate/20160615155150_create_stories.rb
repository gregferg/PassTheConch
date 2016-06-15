class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :current_user_id, null: false
      t.string :prompt, null: false
      t.string :title, null: false
      t.string :status, null: false
      t.integer :sentences_left, null: false

      t.timestamps null: false
    end

    add_index :stories, :current_user_id, unique: true
    change_column_default :stories, :status, 'pending'
    change_column_default :stories, :sentences_left, 10
  end
end
