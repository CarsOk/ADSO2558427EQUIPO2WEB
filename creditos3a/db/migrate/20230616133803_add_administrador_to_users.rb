class AddAdministradorToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :administrador, :boolean
  end
end
