class AddSuperAdminToUsers < ActiveRecord::Migration[6.1]
  def change
        add_column :users, :super_admin, :boolean
  end
end
