class AddTelefonoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :telefono, :string
  end
end
