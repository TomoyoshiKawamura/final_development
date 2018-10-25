class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.integer :price, null: false
      t.string :company, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end
