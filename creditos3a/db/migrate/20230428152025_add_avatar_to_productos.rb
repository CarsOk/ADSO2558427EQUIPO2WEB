class AddAvatarToProductos < ActiveRecord::Migration[6.1]
  def change
    add_column :productos, :avatar, :string
  end
end
