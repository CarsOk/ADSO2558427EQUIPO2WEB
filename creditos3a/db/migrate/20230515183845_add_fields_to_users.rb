class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :last_name_1, :string
    add_column :users, :last_name_2, :string
    add_column :users, :address, :string
    add_column :users, :identification, :integer
  end
end
