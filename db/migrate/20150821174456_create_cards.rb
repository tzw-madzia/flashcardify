class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :primary_language_word
      t.string :learning_language_word
      t.string :special_character_word
      t.references :card_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
