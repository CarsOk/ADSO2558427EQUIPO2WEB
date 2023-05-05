class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :image
      
      t.timestamps
    end
  end
end
