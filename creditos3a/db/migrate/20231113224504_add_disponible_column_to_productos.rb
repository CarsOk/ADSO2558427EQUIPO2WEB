class AddDisponibleColumnToProductos < ActiveRecord::Migration[6.1]
  def change
    add_column :productos, :disponible, :boolean, default: true
  end
end
