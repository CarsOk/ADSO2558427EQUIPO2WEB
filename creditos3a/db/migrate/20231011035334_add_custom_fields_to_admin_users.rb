class AddCustomFieldsToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :first_name, :string
    add_column :admin_users, :second_name, :string
    add_column :admin_users, :last_name_1, :string
    add_column :admin_users, :last_name_2, :string
  end
end
