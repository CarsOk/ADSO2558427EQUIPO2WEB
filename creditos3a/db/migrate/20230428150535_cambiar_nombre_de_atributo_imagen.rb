class CambiarNombreDeAtributoImagen < ActiveRecord::Migration[6.1]
  def change
    rename_column :productos, :image, :file
  end
end
