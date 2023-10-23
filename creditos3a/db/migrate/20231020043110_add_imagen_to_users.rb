class AddImagenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :imagen, :string
  end
end
