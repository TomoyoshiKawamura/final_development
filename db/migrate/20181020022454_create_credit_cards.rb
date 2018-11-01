class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name, null: false
      t.integer :number, null: false, unique: true
      t.integer :deadline_month, null: false
      t.integer :deadline_year, null: false
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
