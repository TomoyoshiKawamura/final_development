class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
