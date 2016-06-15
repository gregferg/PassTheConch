class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :word, null: false
      t.string :part_of_speech, null: false
      t.timestamps null: false
    end

    add_index :prompts, :word, unique: true
  end
end
