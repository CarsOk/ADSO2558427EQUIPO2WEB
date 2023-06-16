class AddCategoriaIdToProductos < ActiveRecord::Migration[6.1]
  def change
    add_reference :productos, :categoria, null: false, foreign_key: true
  end
end
