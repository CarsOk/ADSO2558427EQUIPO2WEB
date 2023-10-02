class AddImagenToCategorias < ActiveRecord::Migration[6.1]
  def change
    add_column :categorias, :imagen, :string
  end
end
