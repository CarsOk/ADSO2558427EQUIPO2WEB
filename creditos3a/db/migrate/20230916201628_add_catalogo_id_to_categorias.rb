class AddCatalogoIdToCategorias < ActiveRecord::Migration[6.1]
  def change
    add_reference :categorias, :catalogo, null: false, foreign_key: true
  end
end
