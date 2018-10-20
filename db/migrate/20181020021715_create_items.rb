class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.string :company
      t.text :explanation

      t.timestamps
    end
  end
end
