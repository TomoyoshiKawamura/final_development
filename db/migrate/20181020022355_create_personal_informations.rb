class CreatePersonalInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_informations do |t|
      t.string :name, null: false
      t.integer :post_code, null: false
      t.string :address1, null: false
      t.string :address2
      t.integer :phone_number, null: false
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
