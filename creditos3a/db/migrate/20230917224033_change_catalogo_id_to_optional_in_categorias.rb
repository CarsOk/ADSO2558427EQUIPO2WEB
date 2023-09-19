class ChangeCatalogoIdToOptionalInCategorias < ActiveRecord::Migration[6.1]
  change_column :categorias, :catalogo_id, :integer, null: true
  def change
  end
end
