class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :text, null: false
      t.string :title, null: false
      t.integer :rank, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :item_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
