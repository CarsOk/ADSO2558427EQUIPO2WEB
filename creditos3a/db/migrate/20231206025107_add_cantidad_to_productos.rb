class AddCantidadToProductos < ActiveRecord::Migration[6.1]
  def change
    add_column :productos, :cantidad, :integer
  end
end
