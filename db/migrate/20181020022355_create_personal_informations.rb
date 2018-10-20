class CreatePersonalInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_informations do |t|
      t.string :name
      t.integer :post_code
      t.string :address1
      t.string :address2
      t.integer :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
