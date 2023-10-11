class AddIdentificationAndAddressToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :identification, :string
    add_column :admin_users, :address, :string
  end
end
