class AddAdministradorToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :administrador, :boolean
  end
end
