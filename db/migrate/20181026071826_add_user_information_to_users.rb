class AddUserInformationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name,      :string, null: false
    add_column :users, :name_kana, :string, null: false
  end
end
