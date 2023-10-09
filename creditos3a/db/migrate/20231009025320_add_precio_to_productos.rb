class AddPrecioToProductos < ActiveRecord::Migration[6.1]
  def change
    add_column :productos, :precio, :integer
  end
end
