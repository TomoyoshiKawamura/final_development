class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.integer :number
      t.integer :deadline_month
      t.integer :deadline_year
      t.integer :user_id

      t.timestamps
    end
  end
end
