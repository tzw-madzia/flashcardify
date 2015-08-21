class CreateCardLists < ActiveRecord::Migration
  def change
    create_table :card_lists do |t|
      t.string :name
      t.string :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :card_lists, [:user_id, :created_at]
  end
end
